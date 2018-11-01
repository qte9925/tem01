package com.jds.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.Map;

public interface NoticeService {
    public int insertN(Map map);
    public PageInfo<Map> selectN(Map map, PageEntity page);
    public Map selectNa(int id);
}
