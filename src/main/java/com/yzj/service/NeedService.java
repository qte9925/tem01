package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;


public interface NeedService {

    public PageInfo<Map> selectNeed(PageEntity page, Map map);
    public int  deleteNeed(Map map);
    public List selectById(Map map);
    public int updateNeed(Map map);
    public int addNeed(Map map);
    public List departmentFindType(Map map);
    public int xiugaixuqiuxinxia(Map map);
}
