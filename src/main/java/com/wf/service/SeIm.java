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

    //查询用户列表
    public List selectyh01() {
        return dao.selectyh01();
    }
}
