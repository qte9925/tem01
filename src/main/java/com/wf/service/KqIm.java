package com.wf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.wf.dao.Kqdao;
import com.wf.util.Excel001;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Transactional
@Service
public class KqIm implements Kq {
    @Autowired
    private Kqdao dao;
    @Autowired
    private Excel001 Excel001;








    @Override
    public List cxqj02(Map map) {
        return dao.cxqj02(map);
    }

    @Override
    public int qjxqupdate(Map map) {
        return dao.qjxqupdate(map);
    }

    //查询工作日历
    public List<Map> gzrl(Map map) {
        return dao.gzrl(map);
    }

   //查询请假类型
    public List<Map> qjlxselect(Map map) {
        return dao.qjlxselect(map);
    }

    //增加请假时间
    public int qingjiainsert(Map map) {
        return dao.qingjiainsert(map);
    }

    //带条件查询请假详情
    public List<Map> cxqinjiq02(Map map) {
        return dao.cxqinjiq02(map);
    }

    //查询请假详情
    public List<Map> cxqinjiq(Map map) {
        return dao.cxqinjiq(map);
    }

    //审批请假
    public int updateqj(Map map) {
        return dao.updateqj(map);
    }

    //增加签到表
    public int qdinsert(Map map) {
        return dao.qdinsert(map);
    }

    //查询当日工作时间
    public List<Map> cxsxb02(Map map) {
        return dao.cxsxb02(map);
    }

    //查询用户签到详情
    public List<Map> ygbrqd(Map map) {
        return dao.ygbrqd(map);
    }
    //查询请假详情
    public PageInfo<Map> qjspxq(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.qjspxq(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    public PageInfo<Map> cxqj0334(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.cxqj0334(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    public PageInfo<Map> selectwf_kqtj(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.selectwf_kqtj(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    @Override//查询签到表
    public PageInfo<Map> selectwf_qiandao(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.selectwf_qiandao(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    //查询全部出差
    public PageInfo<Map> cxqbcc(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.cxqbcc(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

   //增加出差表
    public int chuchaiinsert(Map map) {
        return dao.chuchaiinsert(map);
    }
    @Override
    public String InputExcel(InputStream is, String originalFilename) {
        Map<String,Object> ginsengMap = new HashMap<String,Object>();
        List<ArrayList<Object>> list;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map map01 = new HashMap();
        Map map02 = new HashMap();
        int sxbsj = 0; //正常上班时间
        long bingjia = 0; //病假
        long shijia = 0; //事假
        int kuanggong = 0; //旷工天数
        int zhuanzhengtianshu = 0; //旷工天数
        int gzyf = 10; //旷工天数
        int ryid =2;
        long chidao  =0;
        long zaotui  =0;
        long jiaban = 0;
        if (originalFilename.endsWith(".xls")) {
//            list = Excel001.readExcel2003(is);
            list = null;
        } else {
            list = Excel001.readExcel2007(is);
        }
        for (int i=0,j=list.size();i<j;i++){
            gzyf =Integer.parseInt((String) list.get(0).get(7));
            ryid =Integer.parseInt((String) list.get(0).get(1));
            map02.put("gzyf",gzyf);
            map02.put("ryid",ryid);
            List<Object> row = list.get(i);
            for(int c=0;c<row.size();c++){
                //增加签到表
                map01.put("qdryid",row.get(1));
                map01.put("qdsj01",row.get(2));
                map01.put("qdsj02",row.get(3));
                map01.put("qdstatic",row.get(4));

            }
            //判断转正状态
            int get01 = Integer.parseInt((String) row.get(0));
            //判断上班状态
            int get04 = Integer.parseInt((String) row.get(4));
            //判断正常上班的时间（包含病假，事假，出差）
            if(get04==0||get04==1||get04==2||get04==3||get01==1){
                sxbsj=sxbsj+1;
                map02.put("dysbts",sxbsj);//正常上下班天数
                if(get01==1){//转正天数
                    zhuanzhengtianshu =zhuanzhengtianshu+1;
                    map02.put("zhuanzhengtianshu",zhuanzhengtianshu);//转正天数
                }
                if(get04==0){ //判断正常上班的迟到，早退
                    Date sj01= null;
                    Date sj02= null;
                    Date sj03= null;
                    Date sj04= null;
                    try {
                        sj01=sdf.parse((String) row.get(3));//打卡下班时间
                        sj02=sdf.parse((String) row.get(2));//打卡上班时间
                        sj03=sdf.parse((String) row.get(5));//正常上班时间
                        sj04=sdf.parse((String) row.get(6));//正常下班时间
                        if(sj02.getTime()-sj03.getTime() > 0){
                            long l = sj02.getTime()-sj03.getTime();
                            chidao = (l/1000)/60/60;
                            map02.put("chidao",chidao);//迟到时间
                        }
                        if(sj04.getTime()-sj01.getTime() > 0){
                            long l = sj04.getTime()-sj01.getTime();
                            zaotui = (l/1000)/60/60;
                            map02.put("zaotui",zaotui);//早退时长
                        }
                        if(sj01.getTime()-sj04.getTime() > 0){
                            long l = sj01.getTime()-sj04.getTime();
                            jiaban = (l/1000)/60/60;
                            map02.put("jiaban",jiaban);//早退时长
                        }
                    } catch (ParseException e) {
                        System.out.println("执行异常");
                        e.printStackTrace();
                    }
                }
                if(get04==2){ //判断病假时长
                    Date sj01= null;
                    Date sj02= null;
                    try {
                        sj01=sdf.parse((String) row.get(3));
                        sj02=sdf.parse((String) row.get(2));
                        long l = sj01.getTime()-sj02.getTime();
                        bingjia = (l/1000)/60/60;
                        map02.put("bingjia",bingjia);//病假时长
                    } catch (ParseException e) {
                        System.out.println("执行异常");
                        e.printStackTrace();
                    }
                }
                if(get04==3){ //判断事假时长
                    Date sj01= null;
                    Date sj02= null;
                    try {
                        sj01=sdf.parse((String) row.get(3));
                        sj02=sdf.parse((String) row.get(2));
                        long l = sj01.getTime()-sj02.getTime();
                        shijia=(l/1000)/60/60;
                        map02.put("shijia",shijia);//事假时长
                    } catch (ParseException e) {
                        System.out.println("执行异常");
                        e.printStackTrace();
                    }
                }

            }
            //判断旷工
            if(get04==5){
                kuanggong=kuanggong+1;
                map02.put("kuanggong",kuanggong);
            }
            //增加签到表
            int fanhui = dao.insertqiandao(map01);
            System.out.println(fanhui);
        }
        //增肌签到统计表
        int fanhui02 = dao.insertwf_kqtj(map02);
        System.out.println(fanhui02);
        System.out.println(map01);
        System.out.println(map02);
        return "01";
    }
}
