package com.bc.dao;

import com.bc.entity.TbPost;

import java.util.List;
import java.util.Map;

public interface TbPostMapper {
    //查询职位详情
    List<Map> selectAllTbPost(Map map);
    //通过部门编号查询职位
    List<Map> showTbPost(Map map);
    //查询没赋过权限的部门职位
    List<Map> showTbPostAndDeptNoFunction(Map map);
    //修改职位信息
    int updateTbDept(Map map);

    int deleteByPrimaryKey(Integer tbPostId);

    int insert(TbPost record);

    int insertSelective(TbPost record);

    TbPost selectByPrimaryKey(Integer tbPostId);


    int updateByPrimaryKey(TbPost record);
}