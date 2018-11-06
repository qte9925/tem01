package com.bc.dao;

import com.bc.entity.TbRecorddetails;

public interface TbRecorddetailsMapper {
    int deleteByPrimaryKey(Integer tbRecorddetailsId);

    int insert(TbRecorddetails record);

    int insertSelective(TbRecorddetails record);

    TbRecorddetails selectByPrimaryKey(Integer tbRecorddetailsId);

    int updateByPrimaryKeySelective(TbRecorddetails record);

    int updateByPrimaryKey(TbRecorddetails record);
}