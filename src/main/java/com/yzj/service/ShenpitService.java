package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface ShenpitService {
    /*查询状态未审批中得数据*/
    public PageInfo<Map> selectShenpit(PageEntity page, Map map);
    /*通过驳回*/
    public int updateShenpit(Map map);
}
