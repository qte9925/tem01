package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface StaffMapper {
    public List<Map> selectM(Map map);
    public int insertM(Map map);
    public Map selectMByid(int id);
    public int updateM(Map map);
    public int deleteM(int id);

}
