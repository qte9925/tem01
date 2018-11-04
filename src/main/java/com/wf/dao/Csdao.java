package com.wf.dao;

import org.springframework.stereotype.Component;

import java.util.*;
@Component
public interface Csdao {
    List login(Map map);
    int zjht(Map map);
    List jsbselect01();
    List htnrcx(Map map);
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
    int yhinsert02(Map map);
    int cxqxb30(Map map);
    List<Map> index01(Map map);
}
