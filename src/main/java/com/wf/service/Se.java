package com.wf.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.*;

public interface Se {
    List login(Map map);
    List jsbselect01();
    int insert_wf_hetong(Map map);
    int updatewfstafftablerzht(Map map);
    int yhinsert01(Map map);
    List selectyh01();
    List rlsq();
    List<Map> rybdleixingchaxun();
    List<Map> htlxcx(Map map);
    List<Map> gscx(Map map);
    List<Map> cxqxb(Map map);
    List<Map> cxjsb02(Map map);
    List<Map> cxjsqx01(Map map);
    List<Map> ygbid(Map map);
    int zjht(Map map);
    PageInfo<Map> htnrcx(Map map, PageEntity page);
    int yhinsert02(Map map);
    int cxqxb30(Map map);
    List<Map> index01(Map map);

}
