package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface InsuranceMapper {
    public List<Map> selectIn(Map map);
    public int insertIn(Map map);
    public Map selectInByid(int id);
    public int updateIn(Map map);
    public int deleteIn(int id);

}
