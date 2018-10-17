package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface NeedDao {
    public List selectNeed(Map map);
    public int  deleteNeed(Map map);
    public List selectById(Map map);
    public int updateNeed(Map map);
    public int addNeed(Map map);
    public List departmentFindType(Map map);
}
