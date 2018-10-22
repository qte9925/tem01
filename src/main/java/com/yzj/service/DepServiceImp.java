package com.yzj.service;

import com.yzj.dao.DepDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class DepServiceImp implements DepService{

    @Autowired
        private DepDao dao;
    public List<Map> selectdepNeed(Map map) {

        return dao.selectdepNeed(map);
    }
}
