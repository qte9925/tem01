package com.lx.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface rzService {
    List rzselect(Map map);
    int rzsq(Map map);
    List rymssqselect(Map map);
    //List rymssqselect2(Map map);
    PageInfo<Map> rymssqselect2(Map map, PageEntity page);
    int rzzx(Map map);
    int rzzj(Map map);
}
