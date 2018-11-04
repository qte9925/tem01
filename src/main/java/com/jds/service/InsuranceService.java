package com.jds.service;

import java.util.List;
import java.util.Map;

public interface InsuranceService {
    public List<Map> selectIn(Map map);
    public int insertIn(Map map);
    public Map selectInByid(int id);
    public int updateIn(Map map);
    public int deleteIn(int id);
}
