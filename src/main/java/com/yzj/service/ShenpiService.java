package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface ShenpiService {
    public PageInfo<Map> selectdaishenpiplan(PageEntity page, Map map);
    public int updateshenpiplanyzj(Map map);
    public int updatexinxiplan(Map map);
    /*报名*/
    public int AddBaomingyzj(Map map);
    /*已报名人数统计*/
    public List selectyibaoming(Map map);
}
