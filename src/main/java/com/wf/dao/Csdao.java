package com.wf.dao;

import org.springframework.stereotype.Component;

import java.util.*;
@Component
public interface Csdao {
    List login(Map map);

    List jsbselect01();

    int yhinsert01(Map map);
    List selectyh01();
    List rlsq();
    List<Map> rybdleixingchaxun();
    List<Map> htlxcx(Map map);
    List<Map> gscx(Map map);
}
