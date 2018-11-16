package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface BaoDao {
    public List selectBaomingstatu(Map map);
}
