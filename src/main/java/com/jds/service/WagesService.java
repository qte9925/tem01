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
    public PageInfo<Map> selectXf1(Map map, PageEntity page);
    public int updateXf(Map map);
    public int insertS(Map map);
    public PageInfo<Map> selectS(Map map, PageEntity page);
    public Map selectSid(int id);
    public int updateS(Map map);
    public int deleteS(int id);
    public int updateSa(Map map);
    public PageInfo<Map> selectSa(Map map, PageEntity page);
    public int updateS1(Map map);
    public int updateS2(Map map);
    public Map selectSy(int id);
    public int updateSs(Map map);
}
