package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface StaffMapper {
    public List<Map> selectM(Map map);
  /*  public List<Map> selectT();
    public Map selectFByid(int id);
    public int update(Map map);*/

}
