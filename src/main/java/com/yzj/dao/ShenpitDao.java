package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface ShenpitDao {
    /*查询状态未审批中得数据*/
    public List selectShenpit(Map map);
    /*通过驳回*/
    public int updateShenpit(Map map);
}
