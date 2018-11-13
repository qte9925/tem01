package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface BecomeDao {
    public List<Map> selectZ(Map map);
    public int updateZ(Map map);
}
