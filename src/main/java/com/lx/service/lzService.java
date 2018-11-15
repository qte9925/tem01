package com.lx.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface lzService {
    int lzinsetes(Map map);
    List lzselect(Map map);
    int lzdjupdate(Map map);
    PageInfo<Map> lzdjselect(Map map, PageEntity page);
    List lzzxselect(Map map);
    int lzzxdelete(Map map);
}
