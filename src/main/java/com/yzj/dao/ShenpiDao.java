package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface ShenpiDao {
    public List<Map> selectdaishenpiplan(Map map);
    public int updateshenpiplanyzj(Map map);
    /*审批 通过-不通过*/
   /* public int updatexinxiplan(Map map);*/
    /*报名*/
    public int AddBaomingyzj(Map map);
    /*已报名人数统计*/
    public List<Map> selectyibaoming(Map map);
}
