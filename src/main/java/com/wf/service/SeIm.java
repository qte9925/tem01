package com.wf.service;

import com.wf.dao.Csdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class SeIm implements Se {
    @Autowired
    private Csdao dao;
    @Override
    public List login(Map map) {
        return dao.login(map);
    }

    @Override
    public List jsbselect01() {
        return dao.jsbselect01();
    }

    @Override
    public int yhinsert01(Map map) {
        return dao.yhinsert01(map);
    }

    //查询用户列表
    public List selectyh01() {
        return dao.selectyh01();
    }
    //查询入职离职表
    public List rlsq() {
        return dao.rlsq();
    }

    @Override
    public List<Map> rybdleixingchaxun() {
        return dao.rybdleixingchaxun();
    }

    //合同类型查询
    public List<Map> htlxcx(Map map) {
        return dao.htlxcx(map);
    }
    //公司查询
    public List<Map> gscx(Map map) {
        return gscx(map);
    }
}
