package com.bc.service;

import java.util.List;
import java.util.Map;

public interface TbDetailoneServices {
    //查询所有考核项详情
    public List<Map> selectTbDetailone(Map map);
    //查询绩效考核名称
    public List<Map> selectTaskName();
    //查询考核项目名称
    public List<Map> selectEventName();
    //添加结果表&&结果详情表
    public int insertresultAndrecorddetails(Map map);
    //根据DetailoneId查询数据
    public Map SelectDetailoneBiId(Integer tbDetailoneId);
    //修改
    public int UpdateDetailone(Map map);
    //删除考核项
    public Integer Detailoneid(Integer tbDetailoneId);
    /*小明*/
    List SelectTbTetailoneno(Map map);
    int InsertTbAchresult(Map map);
    int InsertTbOneRecorddetails(List list);

}
