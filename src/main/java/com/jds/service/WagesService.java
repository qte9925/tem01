package com.jds.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface WagesService {
    public Map selectWByid(int id);
    public List<Map> selectSl();
    public List<Map> selectBx();
    public int selectGz(Map map);
    public PageInfo<Map> selectX(Map map, PageEntity page);
    public int insertX(Map map);
    public int updateX(int id);
    public PageInfo<Map> selectX1(Map map, PageEntity page);
    public int updateXs(Map map);
    public int updateXb(Map map);
    public List selectXb(Map map);
    public PageInfo<Map> selectXf(Map map, PageEntity page);
    public int updateXf(Map map);
}
