package com.bc.dao;

import com.bc.entity.TbDetailone;

import java.util.List;
import java.util.Map;

public interface TbDetailoneMapper {
    int deleteByPrimaryKey(Integer tbDetailoneId);

    int insert(TbDetailone record);

    int insertSelective(TbDetailone record);

    TbDetailone selectByPrimaryKey(Integer tbDetailoneId);

    int updateByPrimaryKeySelective(TbDetailone record);

    int updateByPrimaryKey(TbDetailone record);
    //查询所有考核项详情
    public  List<Map> selectTbDetailone(Map map);
    //查询绩效考核名称
    public List<Map> selectTaskName();
    //查询考核项目名称
    public List<Map> selectEventName();
    //添加考核指标集
    public int insertDetailone(TbDetailone record);
    //根据DetailoneId查询数据
    public Map SelectDetailoneBiId(Integer tbDetailoneId);
    //修改
    public int UpdateDetailone(Map map);
    /*通过TaskId查询TbDetailoneId*/
    public List<Map> selectTaskByTbDetailoneId(Integer tbTaskId);
    //查询最大值考核项id
    public int SelectDetailoneIdMaxid();
    //删除考核项
    public Integer Detailoneid(Integer tbDetailoneId);
    //查询
    List SelectTbTetailoneno(Map map);

}