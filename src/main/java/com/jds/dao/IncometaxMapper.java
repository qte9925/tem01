package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface IncometaxMapper {
    public List<Map> selectI(Map map);
    public int insertI(Map map);
    public Map selectIByid(int id);
    public int updateI(Map map);
    public int deleteI(int id);

}
