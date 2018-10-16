package com.jds.service;

import java.util.List;
import java.util.Map;

public interface StaffService {
    public List<Map> selectM(Map map);
    public int insertM(Map map);
    public Map selectMByid(int id);
    public int updateM(Map map);
    public int deleteM(int id);
}
