package com.test;

import com.yzj.dao.NeedDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;

public class test {
    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
        NeedDao dao = ctx.getBean(NeedDao.class);
        Map map = new HashMap();
        System.out.print(dao.selectNeed(map));
    }
}
