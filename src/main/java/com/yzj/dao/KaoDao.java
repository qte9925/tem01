package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface KaoDao {
    public List<Map> selectkaoheyzj(Map map);
    public int addkaoheyzj(Map map);
    public int deletekaoheyzj(Map map);
    public List selectkaoheByIdyzj(Map map);
    public int updatekaoheyzj(Map map);
    public List FindKaoHerenType(Map map);
}
