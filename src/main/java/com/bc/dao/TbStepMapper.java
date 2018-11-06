package com.bc.dao;

import com.bc.entity.TbStep;

public interface TbStepMapper {
    int deleteByPrimaryKey(Integer tbStepId);

    int insert(TbStep record);

    int insertSelective(TbStep record);

    TbStep selectByPrimaryKey(Integer tbStepId);

    int updateByPrimaryKeySelective(TbStep record);

    int updateByPrimaryKey(TbStep record);
}