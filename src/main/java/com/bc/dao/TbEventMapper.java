package com.bc.dao;

import com.bc.entity.TbEvent;

import java.util.List;
import java.util.Map;

public interface TbEventMapper {
    int deleteByPrimaryKey(Integer tdEventId);

    int insert(TbEvent record);

    int insertSelective(TbEvent record);

    TbEvent selectByPrimaryKey(Integer tdEventId);

    int updateByPrimaryKeySelective(TbEvent record);

    int updateByPrimaryKey(TbEvent record);
    //根据taskid查询所有项目
    public List<Map> selectEvent(int tbTaskId);
    //添加查询项
    public int insertEvent(Map map);
    //查询Eid最大值
    public int SelectTbEventId();
    //根据id查询考核任务项
    public Map selectTbEventId(Integer tbEventId);
    //修改考核任务项
    public int UpdateEvent(Map map);
    //删除修改状态
    public Integer DeleteEvent(int tdEventId);
}