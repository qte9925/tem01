package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface PlanService {
    public PageInfo<Map> selectPlan(PageEntity page, Map map );
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
