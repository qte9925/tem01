package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface BusinessMapper {

    public List<Map> selectGz(Map map);
    public int insertGz(Map map);
    public int insertBf(Map map);
    public List<Map> selectBf(Map map);
    public List<Map> selectGza(Map map);
    public Map selectGzId(int id);
    public int updateGz(Map map);
    public int updateGza(Map map);
    public int updateGzb(Map map);
    public List<Map> selectYj(Map map);
    public int updateGzc(Map map);
    public List<Map> selectZc(Map map);
    public int updateZc(Map map);
    public List<Map> selectZc1(Map map);
    //投递简历人员按查询自己的简历状态
    public List<Map> selectJl(Map map);
    public Map selectJl1(int id);
    public List<Map> selectBm(Map map);
}
