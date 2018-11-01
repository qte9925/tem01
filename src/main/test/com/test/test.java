package com.test;

import com.jds.dao.StaffMapper;
import com.jds.service.NoticeService;
import com.wf.service.Kq;
import com.wf.service.Se;
import com.yzj.dao.NeedDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
        NoticeService dao = ctx.getBean(NoticeService.class);
        Map map = new HashMap();
        Map map01 = new HashMap();
//        dao.cc01(map);
      /*  List<Map> list01= dao.cc02(map);
        for (int i=0;i<list01.size();i++){
            System.out.print(list01.get(i).get("ryxm"));
            map01.put("ryxm",list01.get(i).get("ryxm"));
            dao.cc01(map01);
        }*/
//        System.out.print(dao.gzrl(map));
    }
}
