package com.jds.service;

import java.util.List;
import java.util.Map;

public interface IncometaxService {
    public List<Map> selectI(Map map);
    public int insertI(Map map);
    public Map selectIByid(int id);
    public int updateI(Map map);
    public int deleteI(int id);
}
