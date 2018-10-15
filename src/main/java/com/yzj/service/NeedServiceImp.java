package com.yzj.service;

import com.yzj.dao.NeedDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class NeedServiceImp implements NeedService{
@Autowired
    private NeedDao dao;

    @Override
    public List selectNeed(Map map) {
        return dao.selectNeed(map);
    }
}
