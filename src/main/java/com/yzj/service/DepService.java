package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface DepService {
    public PageInfo<Map> selectDep(PageEntity page, Map map );
    public int  deleteDep(Map map);
    public List selectByIdDep(Map map);
    public int updateDep(Map map);
    public int addDep(Map map);
    public List departmentFindTypeDep(Map map);
    public int xiugaixuqiuxinxib(Map map);

}
