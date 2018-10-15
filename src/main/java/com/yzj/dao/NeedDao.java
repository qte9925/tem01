package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface NeedDao {
    public List selectNeed(Map map);
}
