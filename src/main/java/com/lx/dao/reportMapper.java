package com.lx.dao;

import com.lx.entity.report;
import java.math.BigDecimal;

public interface reportMapper {
    int deleteByPrimaryKey(BigDecimal repId);

    int insert(report record);

    int insertSelective(report record);

    report selectByPrimaryKey(BigDecimal repId);

    int updateByPrimaryKeySelective(report record);

    int updateByPrimaryKey(report record);
}