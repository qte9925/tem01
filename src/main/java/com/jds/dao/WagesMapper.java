package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface WagesMapper {
    public Map selectWByid(int id);
    public List<Map> selectSl();
    public List<Map> selectBx();
    public int insertGz(Map map);
    public List<Map> selectX(Map map);
    public int insertX(Map map);
    public int updateX(int id);
    public List<Map> selectX1(Map map);
    public int updateXs(Map map);
    public int updateXb(Map map);
    public List selectXb(Map map);
    public List<Map> selectXf(Map map);
    public List<Map> selectXf1(Map map);
    public int updateXf(Map map);
    public int insertS(Map map);
    public List<Map> selectS(Map map);
    public Map selectSid(int id);
    public int updateS(Map map);
    public int deleteS(int id);
    public int updateSa(Map map);
    public List<Map> selectSa(Map map);
    public int updateS1(Map map);
    public int updateS2(Map map);
    public Map selectSy(int id);
    public int updateSs(Map map);



}
