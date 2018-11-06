package com.bc.dao;

import com.bc.entity.TbPropleYgkh;

import java.util.List;
import java.util.Map;

public interface TbPropleYgkhMapper {
    int deleteByPrimaryKey(Integer tbPropleYgkhId);

    int insert(TbPropleYgkh record);

    int insertSelective(TbPropleYgkh record);

    TbPropleYgkh selectByPrimaryKey(Integer tbPropleYgkhId);

    int updateByPrimaryKeySelective(TbPropleYgkh record);

    int updateByPrimaryKey(TbPropleYgkh record);
    //查询最大值部门考核人Id
    public int SelectTbPropleYghMaxid();
    //通过Taskid查询Staffid
    public List<Map> SelectTbpropleYghStaffid(Integer tbTaskId);
}