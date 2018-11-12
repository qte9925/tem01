package com.bc.service;

import com.bc.dao.*;
import com.bc.entity.TbAchresult;
import com.bc.entity.TbDetailone;
import com.bc.entity.TbRecorddetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TbDetailoneServicesImpl implements TbDetailoneServices{
    @Autowired
    private TbDetailoneMapper td;
    @Autowired
    private TbAchresultMapper tba;
    @Autowired
    private TbTaskMapper ta;
    @Autowired
    private TbRecorddetailsMapper tbr;
    @Autowired
    private TbPropleYgkhMapper tbp;
    //查询所有考核项详情
   public List<Map> selectTbDetailone(Map map){
       return td.selectTbDetailone(map);
    }
    //查询绩效考核名称
        public List<Map> selectTaskName(){
        return td.selectTaskName();
    }
    //查询考核项目名称
    public List<Map> selectEventName(){
        return td.selectEventName();
    }
//添加考核结果表和结果详情表
public int insertresultAndrecorddetails(Map map){
        Integer taskid =Integer.parseInt(map.get("Taskid").toString());
    List<Map> rolist =tbp.SelectTbpropleYghStaffid(taskid);
    System.out.print("*************zz**************"+rolist);//通过TaskId查询TbDetailoneId
    System.out.print("*************zz**************");
    for (Map ro :rolist) {
        Integer PropleYghid = Integer.parseInt(ro.get("tb_prople_ygkh_id").toString());
        System.out.print("*************aa**************" + PropleYghid);
        Integer TbStaffId = Integer.parseInt(ro.get("tb_staff_id").toString());
        System.out.print("*************66**************" + TbStaffId);
        TbAchresult ach = new TbAchresult();
        ach.setTbTaskId(taskid);
        ach.setTbPropleYgkhId(PropleYghid);
        ach.setTbAchresultState(1);
        int ahr = tba.insert(ach);
        System.out.print("*************zz**************" + TbStaffId);
        int TbAchresultMaxid = tba.SelectTbAchresultMaxid();
        List<Map> list = td.selectTaskByTbDetailoneId(taskid);
        for(Map aa:list){
            Integer DetailoneId =Integer.parseInt(aa.get("tb_detailone_id").toString());
            TbRecorddetails rec = new TbRecorddetails();
            rec.setTbStaffId(TbStaffId);
            rec.setTbDetailoneId(DetailoneId);
            rec.setTbAchresultId(TbAchresultMaxid);
            rec.setTbRecorddetailsState(1);
            int red = tbr.insert(rec);
        }
    }
     int result=1;
    return result;
}
    /*public int insertDetailone(List list) {
        for (int i = 0; i < list.size(); i++) {
            Map map1 = new HashMap();
            Map map2 = new HashMap();
            map1 = (Map) list.get(i);
            map2.put("tbEventId", map1.get("tbEventId"));
            map2.put("tbDetailoneValue", map1.get("tbDetailoneValue"));
            map2.put("tbDetailoneName", map1.get("tbDetailoneName"));
            map2.put("tbtaskid", map1.get("tbtaskid"));
            map2.put("tbdetailonestate", map1.get("tbdetailonestate"));
            TbDetailone tbd = new TbDetailone();
            tbd.setTbDetailoneName(map2.get("tbDetailoneName").toString());
            tbd.setTbDetailoneValue(map2.get("tbDetailoneValue").toString());
            tbd.setTbEventId(Integer.parseInt(map2.get("tbEventId").toString()));
            tbd.setTbTaskId(Integer.parseInt(map2.get("tbtaskid").toString()));
            tbd.setTbDetailoneState(Integer.parseInt(map2.get("tbdetailonestate").toString()));
            int u = td.insertDetailone(tbd);
            int detailoneMax = td.SelectDetailoneIdMaxid();
            System.out.print("++++++++++++++-------------"+u);
            int maxTbTaskID = ta.SelectTbTaskMaxid();//查询考核任务最大id
            List<Map> rolist =tbp.SelectTbpropleYghStaffid(maxTbTaskID);
            System.out.print("*************zz**************"+rolist);//通过TaskId查询TbDetailoneId
            System.out.print("*************zz**************");
            for (Map ro :rolist){
                Integer PropleYghid = Integer.parseInt(ro.get("tb_prople_ygkh_id").toString());
                System.out.print("*************aa**************"+PropleYghid);
                Integer TbStaffId = Integer.parseInt(ro.get("tb_staff_id").toString());
                System.out.print("*************66**************"+TbStaffId);
                TbAchresult ach = new TbAchresult();
                ach.setTbTaskId(maxTbTaskID);
                ach.setTbPropleYgkhId(PropleYghid);
                ach.setTbAchresultState(1);
                int ahr = tba.insert(ach);
                System.out.print("*************zz**************"+TbStaffId);
                int TbAchresultMaxid = tba.SelectTbAchresultMaxid();
                //循环添加结果详情
                System.out.print("*************bb**************");
                TbRecorddetails rec = new TbRecorddetails();
                rec.setTbStaffId(TbStaffId);
                rec.setTbDetailoneId(detailoneMax);
                rec.setTbAchresultId(TbAchresultMaxid);
                rec.setTbRecorddetailsState(1);
                int red = tbr.insert(rec);
                System.out.print("*************cc**************");
            }
        }
        int result = 1;
        return result;
    }*/
    //根据DetailoneId查询数据
    public Map SelectDetailoneBiId(Integer tbDetailoneId){
       return td.SelectDetailoneBiId(tbDetailoneId);
    }
    //修改
    public int UpdateDetailone(Map map){
       return td.UpdateDetailone(map);
    }
    //删除考核项
    public Integer Detailoneid(Integer tbDetailoneId){
       return td.Detailoneid(tbDetailoneId);
    }

    /*xiaoming*/
    //查询
    public List SelectTbTetailoneno(Map map){
        return td.SelectTbTetailoneno(map);
    }
    public int InsertTbAchresult(Map map) {
        Integer resultstate = Integer.parseInt(map.get("resultstate").toString());
        Integer State=0;
        if(resultstate==6){
            State=6;
            String sumoneself = map.get("sumoneself").toString();
            String sumothers  = map.get("sumothers").toString();
            double tachresultmak = (Integer.parseInt(sumoneself)*0.2+Integer.parseInt(sumothers)*0.8);
            System.out.print(tachresultmak);
            TbAchresult tbachersule = new TbAchresult();
            tbachersule.setTbAchresultState(State);
            tbachersule.setTbAchresultCount((int)(tachresultmak));
            tbachersule.setTbPropleYgkhId(Integer.parseInt(map.get("TbPropleId").toString()));
            tbachersule.setTbTaskId(Integer.parseInt(map.get("TbTaskId").toString()));
            tbachersule.setTbAchresultId(Integer.parseInt(map.get("Achresult").toString()));
            int i = tba.updateByPrimaryKeySelective(tbachersule);
        }else{
            if(resultstate==5){
                State=5;
            }else{
                if(resultstate==0){
                    String sumoneself = map.get("sumoneself").toString();
                    String sumothers  = map.get("sumothers").toString();
                    if(sumoneself!="" && sumothers==""){
                        State=2;
                    }
                    if(sumoneself=="" && sumothers!=""){
                        State=3;
                    }
                    if(sumoneself!="" && sumothers!=""){
                        State=4;
                    }
                }else {
                    State=6;
                }
            }
            TbAchresult tbachersule = new TbAchresult();
            tbachersule.setTbAchresultState(State);
            tbachersule.setTbPropleYgkhId(Integer.parseInt(map.get("TbPropleId").toString()));
            tbachersule.setTbTaskId(Integer.parseInt(map.get("TbTaskId").toString()));
            tbachersule.setTbAchresultId(Integer.parseInt(map.get("Achresult").toString()));
            int i = tba.updateByPrimaryKeySelective(tbachersule);
        }
        int result=1;
        return result;
    }
    //增加结果详情
    public int InsertTbOneRecorddetails(List list){
        for(int i=0;i<list.size();i++){
            Map map1 = new HashMap();
            Map map2 = new HashMap();
            map1 = (Map)list.get(i);
            map2.put("sumoneself",map1.get("sumoneself"));
            map2.put("sumothers",map1.get("sumothers"));
            map2.put("TbDetailoneId",map1.get("TbDetailoneId"));
            map2.put("TbStaffId",map1.get("TbStaffId"));
            map2.put("TbRecorddetailsId",map1.get("TbRecorddetailsId"));
            map2.put("AchresultId",map1.get("AchresultId"));
            map2.put("state",map1.get("state"));
            TbRecorddetails tbrecorddetails = new TbRecorddetails();
            Integer TbRecorddetailsId =Integer.parseInt(map2.get("TbRecorddetailsId").toString());
            tbrecorddetails.setTbDetailoneId(Integer.parseInt(map2.get("TbDetailoneId").toString()));
            Integer state =Integer.parseInt(map2.get("state").toString()) ;
            Integer State = 0;
            if(state==6){
                State=5;
                tbrecorddetails.setTbRecorddetailsState(State);
                tbrecorddetails.setTbStaffId(Integer.parseInt(map2.get("TbStaffId").toString()));
                tbrecorddetails.setTbRecorddetailsSrsmark(map2.get("sumoneself").toString());
                tbrecorddetails.setTbRecorddetailsHsmark(map2.get("sumothers").toString());
                tbrecorddetails.setTbAchresultId(Integer.parseInt(map2.get("AchresultId").toString()));
                tbrecorddetails.setTbRecorddetailsId(Integer.parseInt(map2.get("TbRecorddetailsId").toString()));
                int u = tbr.updateByPrimaryKeySelective(tbrecorddetails);
            }else{
                if(state==5){
                    State=1;
                    tbrecorddetails.setTbRecorddetailsState(State);
                    tbrecorddetails.setTbStaffId(Integer.parseInt(map2.get("TbStaffId").toString()));
                    tbrecorddetails.setTbRecorddetailsSrsmark(map2.get("sumoneself").toString());
                    tbrecorddetails.setTbRecorddetailsHsmark("");
                    tbrecorddetails.setTbAchresultId(Integer.parseInt(map2.get("AchresultId").toString()));
                    tbrecorddetails.setTbRecorddetailsId(Integer.parseInt(map2.get("TbRecorddetailsId").toString()));
                    int u = tbr.updateByPrimaryKeySelective(tbrecorddetails);
                }else{
                    String sumoneself = map2.get("sumoneself").toString();
                    String sumothers  = map2.get("sumothers").toString();
                    if(sumoneself!="" && sumothers==""){
                        State=2;
                    }
                    if(sumoneself!="" && sumothers!=""){
                        State=4;
                    }
                    if(sumoneself=="" && sumothers!=""){
                        State=3;
                    }
                    tbrecorddetails.setTbRecorddetailsState(State);
                    tbrecorddetails.setTbStaffId(Integer.parseInt(map2.get("TbStaffId").toString()));
                    tbrecorddetails.setTbRecorddetailsSrsmark(map2.get("sumoneself").toString());
                    tbrecorddetails.setTbRecorddetailsHsmark(map2.get("sumothers").toString());
                    tbrecorddetails.setTbAchresultId(Integer.parseInt(map2.get("AchresultId").toString()));
                    tbrecorddetails.setTbRecorddetailsId(Integer.parseInt(map2.get("TbRecorddetailsId").toString()));
                    int u = tbr.updateByPrimaryKeySelective(tbrecorddetails);
                }
            }
        }
        int resulit = 1;
        return resulit;
    }

}
