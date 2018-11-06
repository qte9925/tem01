package com.bc.dao;

import com.bc.entity.TbStaff;

import java.util.List;
import java.util.Map;

public interface TbStaffMapper {
    //查询员工信息
    List<Map> showStaff(Map map);
    //修改员工信息
    int updStaffById(Map map);
    //添加
    int insertStaff(Map map);
    //获取当前最大id
    int showStaffMaxId();
    //获取领导层
    List<Map> showUpMen(Map map);


    int deleteByPrimaryKey(Integer tbStaffId);

    int insert(TbStaff record);


    TbStaff selectByPrimaryKey(Integer tbStaffId);

    int updateByPrimaryKeySelective(TbStaff record);

    int updateByPrimaryKey(TbStaff record);
}