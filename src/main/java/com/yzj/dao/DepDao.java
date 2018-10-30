package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface DepDao {
    public List<Map> selectDep(Map map);
    public int  deleteDep(Map map);
    public List selectByIdDep(Map map);
    public int updateDep(Map map);
    public int addDep(Map map);
    public List departmentFindTypeDep(Map map);
}

