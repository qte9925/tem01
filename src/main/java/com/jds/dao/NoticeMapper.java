package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface NoticeMapper {
    public int insertN(Map map);
    public List<Map> selectN(Map map);
    public Map selectNa(int id);
    public int updateN(Map map);
    public List<Map> cc02(Map map);
    public List<Map> selectG(Map map);
    public List<Map> selectG1(Map map);
}
