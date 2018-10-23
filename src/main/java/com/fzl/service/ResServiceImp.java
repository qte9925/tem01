package com.fzl.service;

import com.fzl.dao.ResDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ResServiceImp implements ResService {
    @Autowired
    private ResDao dao;
    @Override
    public List select(Map map) {
        return dao.select(map);
    }

    @Override
    public List select01(Map map) {

        return dao.select01(map);
    }

    @Override
    public int update(Map map) {
        return dao.update(map);
    }

    @Override
    public int delete(Map map) {
        return dao.insert(map);
    }

    @Override
    public int insert(Map map) {
        return dao.delete(map);
    }
}
