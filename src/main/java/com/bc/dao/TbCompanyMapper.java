package com.bc.dao;

import com.bc.entity.TbCompany;

public interface TbCompanyMapper {
    int deleteByPrimaryKey(Integer tbCompanyId);

    int insert(TbCompany record);

    int insertSelective(TbCompany record);

    TbCompany selectByPrimaryKey(Integer tbCompanyId);

    int updateByPrimaryKeySelective(TbCompany record);

    int updateByPrimaryKey(TbCompany record);
}