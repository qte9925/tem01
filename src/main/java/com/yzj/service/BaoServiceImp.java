package com.yzj.service;

import com.yzj.dao.BaoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class BaoServiceImp implements BaoService{
    @Autowired
    private BaoDao dao;
    @Override
    public List selectBaomingstatu(Map map) {
        return dao.selectBaomingstatu(map);
    }
}
