package com.jds.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface NoticeMapper {
    public int insertN(Map map);
    public List<Map> selectN(Map map);
    public Map selectNa(int id);
}
