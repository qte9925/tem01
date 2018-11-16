package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface ShenpiService {
    public PageInfo<Map> selectdaishenpiplan(PageEntity page, Map map);

    public int updateshenpiplanyzj(Map map);
    /*审批 通过-不通过*/
  /*  public int updatexinxiplan(Map map);*/
    /*报名*/
    public int AddBaomingyzj(Map map);
    /*已报名人数统计*/
    public List<Map> selectyibaoming(Map map);
    /*送审*/
    public int updatestatu(Map map);
}
