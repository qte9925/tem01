package com.test;

import com.jds.dao.StaffMapper;
import com.wf.service.Se;
import com.yzj.dao.NeedDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;

public class test {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
        Se dao = ctx.getBean(Se.class);
        Map map = new HashMap();
        System.out.print(dao.selectyh01());
    }
}
