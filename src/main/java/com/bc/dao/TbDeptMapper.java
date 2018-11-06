package com.bc.dao;

import com.bc.entity.TbDept;

import java.util.List;
import java.util.Map;

public interface TbDeptMapper {
    int deleteByPrimaryKey(Integer tbDeptId);

    int insert(TbDept record);

    int insertSelective(TbDept record);

    TbDept selectByPrimaryKey(Integer tbDeptId);

    int updateByPrimaryKeySelective(TbDept record);

    int updateByPrimaryKey(TbDept record);
    //查询所有部门
    List<Map> showTbpost(Map map);
 }