package com.test;

import com.jds.dao.StaffMapper;
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
        Se dao = ctx.getBean(Se.class);
        Map map = new HashMap();
        map.put("yhid",1);
        List<Map> list= dao.index01(map);
        List<Map> list02= dao.index01(map);
        for(int i=0;i<list.size();i++){
//            System.out.println(list.get(i).get("dj9999"));
            int cc = (int)list.get(i).get("dj9999");
            int dd = (int)list.get(i).get("qxid");
            if(cc==0){
                System.out.println("list01:"+list.get(i).get("qxname"));
                        for(int i02=0;i02<list02.size();i02++){
                            if((int)list02.get(i02).get("dj9999")!=0){
                                if((int)list02.get(i02).get("dj9999")==dd){
                                int aa = (int) list02.get(i02).get("qxid");
                                System.out.println("list02:"+list02.get(i02).get("qxname"));
                                }
                            }
                        }
                }
            }

        }
    }

