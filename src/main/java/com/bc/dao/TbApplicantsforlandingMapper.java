package com.bc.dao;

import com.bc.entity.TbApplicantsforlanding;

import java.util.List;
import java.util.Map;

public interface TbApplicantsforlandingMapper {
    int deleteByPrimaryKey(Integer tbApplicantsforlandingId);
//添加  注册
    int insert(Map map);
//查询  登陆
    List<Map> selectLogin(TbApplicantsforlanding record);
    int insertSelective(TbApplicantsforlanding record);

    TbApplicantsforlanding selectByPrimaryKey(Integer tbApplicantsforlandingId);

    int updateByPrimaryKeySelective(TbApplicantsforlanding record);

    int updateByPrimaryKey(TbApplicantsforlanding record);

}