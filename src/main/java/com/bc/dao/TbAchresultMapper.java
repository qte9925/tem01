package com.bc.dao;

import com.bc.entity.TbAchresult;

public interface TbAchresultMapper {
    int deleteByPrimaryKey(Integer tbAchresultId);

    int insert(TbAchresult record);

    int insertSelective(TbAchresult record);

    TbAchresult selectByPrimaryKey(Integer tbAchresultId);

    int updateByPrimaryKeySelective(TbAchresult record);

    int updateByPrimaryKey(TbAchresult record);
    //查询结果最大值Id
    public int SelectTbAchresultMaxid();
}