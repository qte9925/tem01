package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface PlanDao {
    public List<Map> selectPlan(Map map);
    public int  deletePlan(Map map);
    public List selectByIdPlan(Map map);
    public int updatePlana(Map map);
    public int addPlan(Map map);
    public List departmentFindTypePlan(Map map);
    public List shenpirenFindType(Map map);
    public List qvdaoFindType(Map map);
    public List XingshiFindType(Map map);
    public int xiugaixuqiuxinxic(Map map);
}
