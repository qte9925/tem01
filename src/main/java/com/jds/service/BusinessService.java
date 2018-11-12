package com.jds.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface BusinessService {
    public List<Map> selectGz(Map map);
    public int insertGz(Map map);
    public int insertBf(Map map);
    public PageInfo<Map> selectBf(Map map, PageEntity page);
    public List<Map> selectGza(Map map);
    public Map selectGzId(int id);
    public int updateGz(Map map);
    public int updateGza(Map map);
    public int updateGzb(Map map);
    public List<Map> selectYj(Map map);
}
