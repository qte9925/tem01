package com.bc.dao;

import com.bc.entity.TbDeptKh;

public interface TbDeptKhMapper {
    int deleteByPrimaryKey(Integer tbDeptKhId);

    int insert(TbDeptKh record);

    int insertSelective(TbDeptKh record);

    TbDeptKh selectByPrimaryKey(Integer tbDeptKhId);

    int updateByPrimaryKeySelective(TbDeptKh record);

    int updateByPrimaryKey(TbDeptKh record);
}