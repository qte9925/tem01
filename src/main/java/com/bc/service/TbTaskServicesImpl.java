package com.bc.service;

import com.bc.dao.*;
import com.bc.entity.*;
import com.bc.entity.BaseDao;
import com.bc.service.TbTaskServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class TbTaskServicesImpl implements TbTaskServices {
   @Autowired
   private TbTaskMapper ta;
   @Autowired
   private TbDeptKhMapper tdkm;
   @Autowired
   private TbPropleYgkhMapper tpykhm;
    @Autowired
    private TbAchresultMapper tba;
    @Autowired
    private TbRecorddetailsMapper tbr;
    @Autowired
    private TbDetailoneMapper tda;
    //查询
    public List<Map> selectTbTask(Map map){
        return ta.selectTbTask(map);
    }
    //根据任务id查询被考核人部门
    public List<Map> selecttaskdept(int tbTaskId){
        return ta.selecttaskdept(tbTaskId);
    }
    //根据postid查询考核人
    public List<Map> selectPostid(String tbTaskName){
        return  ta.selectPostid(tbTaskName);
    }
    //查询根据taskid考核项
    public List<Map> selectDetailone(int tbTaskId){
        return  ta.selectDetailone(tbTaskId);
    }
    //根据职位id查询员工
    public List<Map> SelectPostBytbPostId(Integer tbPostId){return ta.SelectPostBytbPostId(tbPostId);}
    //增加任务表 关联添加考核部门表，考核人员表 ,考核项目表
    public int insertservice(Map map) {
        TbTask tbd = new TbTask();
        tbd.setTbTaskName(map.get("tbTaskName").toString());
        tbd.setTbTaskText(map.get("tbTaskText").toString());
        tbd.setTbStaffId(Integer.parseInt(map.get("tbStaffId").toString()));
        tbd.setTbStepId(Integer.parseInt(map.get("tbStepId").toString()));
        tbd.setTbTaskStarttime(BaseDao.setDate(map.get("tbTaskStarttime").toString()));
        tbd.setTbTaskEndtime(BaseDao.setDate(map.get("tbTaskEndtime").toString()));
        tbd.setTbTaskState(Integer.parseInt(map.get("tdTaskState").toString()));
        int i = ta.insert(tbd);
        int maxTbTaskID = ta.SelectTbTaskMaxid();//查询考核任务最大id
        String tbEventIdOne = map.get("tbEventIdOne").toString();
        List<String> eventlist = Arrays.asList(tbEventIdOne.split(","));
        int everycount = 0;
        for(int r=0;r<eventlist.size();r++){
            Integer eventid = Integer.valueOf(eventlist.get(r));
            Integer eventmark = ta.SelectEventMark(eventid);
            everycount = eventmark+everycount;
        }
        double everymark = 100.00/everycount;
        int endmark = 0;
        int ccmark = 0;
        double ccmark1 = 0.00;
        double csmark;
        for(int r=0;r<eventlist.size();r++){
            Integer eventid = Integer.valueOf(eventlist.get(r));
            Integer eventmark = ta.SelectEventMark(eventid);
            if(r ==eventlist.size()-1){
                if((100-ccmark1)%1 == 0 ){
                    endmark = 100-ccmark;
                }else{
                    endmark = 100-ccmark;
                }
            }else{
                csmark = everymark*eventmark;
                ccmark1 = everymark *eventmark +ccmark1;
                ccmark = (int)csmark+ccmark;
            }
        }
        for(int t = 0;t<eventlist.size();t++){
            Integer eventid = Integer.valueOf(eventlist.get(t));
            Integer eventmark = ta.SelectEventMark(eventid);
            String DetailoneMark ="";
            double detamark = everymark*eventmark;
            DetailoneMark = String.valueOf((int)detamark);
            if(t==eventlist.size()-1){
                DetailoneMark = String.valueOf(endmark);
            }
            TbDetailone tbde  =new TbDetailone();
            tbde.setTbEventId(eventid);
            tbde.setTbTaskId(maxTbTaskID);
            tbde.setTbDetailoneState(1);
            tbde.setTbDetailoneMark(DetailoneMark);
            int u = tda.insertDetailone(tbde);
        }
        String deptString = map.get("deptString").toString();


        List<String> deptlist = Arrays.asList(deptString.split(","));
        for(int s= 0 ; s < deptlist.size() ; s++) {
            TbDeptKh tbdeptkh = new TbDeptKh();
            Integer tbdeptid = Integer.valueOf(deptlist.get(s));
            tbdeptkh.setTbDeptId(tbdeptid);
            tbdeptkh.setTbTaskId(maxTbTaskID);
            tbdeptkh.setTbDeptKhState(1);
            int m = tdkm.insert(tbdeptkh);
            int tbdeptkhid = ta.SelectTbDeptKhId();
            List sflist = ta.SelectStaffBytbPostId(tbdeptid);//查询职位
            for(int h=0;h<sflist.size();h++){
                TbPropleYgkh tbprople = new TbPropleYgkh();
                Integer tbtbstaffid = Integer.parseInt(sflist.get(h).toString());
                Map mapp =ta.SelectUpXx(tbtbstaffid);
                System.out.print(mapp+"*****************************************************************");
                Integer upid=0;
                if(mapp!=null){
                    upid = Integer.parseInt(mapp.get("tb__tb_staff_id").toString());
                }else{
                    upid= 0;
                }
                tbprople.setTbPropleYgkhName(ta.SelectStaffId(tbtbstaffid));
                tbprople.settbStaffId(tbtbstaffid);
                tbprople.setTbTbStaffId(upid);
                tbprople.setTbTaskId(maxTbTaskID);
                tbprople.setTbDeptKhId(tbdeptkhid);
                tbprople.setTbPropleYgkhState(1);
                int tpykhi = tpykhm.insert(tbprople);//添加职位下人员
            }
        }
        List<Map> rolist =tpykhm.SelectTbpropleYghStaffid(maxTbTaskID);
        for (Map ro :rolist) {
            Integer PropleYghid = Integer.parseInt(ro.get("tb_prople_ygkh_id").toString());
            Integer TbStaffId = Integer.parseInt(ro.get("tb_staff_id").toString());
            TbAchresult ach = new TbAchresult();
            ach.setTbTaskId(maxTbTaskID);
            ach.setTbPropleYgkhId(PropleYghid);
            ach.setTbAchresultState(1);
            int ahr = tba.insert(ach);
            int TbAchresultMaxid = tba.SelectTbAchresultMaxid();
            List<Map> list = tda.selectTaskByTbDetailoneId(maxTbTaskID);
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
    //
    public List<Map> SelectTbPostByid(Integer tbPostId){
       return  ta.SelectTbPostByid(tbPostId);
    }
    /*查询考核评价项*/
    public List<Map> selectStep(){
         return ta.selectStep();
    }
    /*根据id查询数据*/
    public Map selectTaskID(Integer tbTaskId){
        return ta.selectTaskID(tbTaskId);
    }
    /*修改*/
    public int UpdateTask(Map map){
        return  ta.UpdateTask(map);
    }
    //对比系统时间修改状态
    public int UpdateTbTaskState(){
            Date dd = new Date();
            List<Map> list = ta.selectTaskId();//查询id
            for(Map aa :list){//通过for循环获取多个id
                Integer taskid = Integer.parseInt(aa.get("tb_task_id").toString());
                List<Map> elist = ta.selectEndTime(taskid);
                for(Map uu :elist){
                    Date time = BaseDao.setDate(uu.get("tb_task_endTime").toString());//获取任务截至时间
                    long daT = time.getTime() - dd.getTime();
                    int Cz = (int)((daT/(1000*3600*24)));
                    if(Cz < 0){
                        TbTask tt = new TbTask();
                        tt.setTbTaskId(taskid);
                        tt.setTbTaskState(1);
                        ta.updateByPrimaryKeySelective(tt);
                    }
                }
            }
        int result = 1;
        return result;
    }
    //根据id删除考核任务
    public Integer DeleteTaskid(Integer tbTaskId){
        return ta.DeleteTaskid(tbTaskId);
    }
    //根据tasking修改状态
    public Integer UpdateTaskState(Integer tbTaskId){
        return  ta.UpdateTaskState(tbTaskId);
    }
    /*验证考核任务唯一性*/
    public List<Map> selectTbTaskName(Map map){
        TbTask tk = new TbTask();
        tk.setTbTaskName(map.get("tbTaskName").toString());
        List list = ta.selectAllTbTask(tk);
        return list;
    }

    /*<!--小明写-->*/
    //查询自身绩效考核任务
    public List SelectMyTask(Integer tbStaffId) {
        return ta.SelectMyTask(tbStaffId);
    }
    //查询上级评价员工
    public List SelectOtherStaff(Map map) {
        return ta.SelectOtherStaff(map);
    }
    //查询考核任务人数
    public List SelectOtherTask(Map map) {
        return ta.SelectOtherTask(map);
    }

    @Override
    public Map SelectUpXx(Integer StaffId) {
        return null;
    }

    //审核查询
    public List SelectendTask(){
        return ta.SelectendTask();
    }

}
