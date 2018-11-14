package com.yzj.service;

import com.yzj.dao.BecomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class BecomeServiceImp implements BecomeService{
    @Autowired
    private BecomeDao dao;
    @Override
    public List<Map> selectZ(Map map) {
        return dao.selectZ(map);
    }

    @Override
    public int updateZ(Map map) {
        return dao.updateZ(map);
    }
}
