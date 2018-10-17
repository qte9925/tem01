package com.lx.service;


import com.lx.dao.reportdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class repServiceimpl implements repService{
@Autowired
private reportdao dao;

    public List selectrep(Map map) {

        return dao.selectreport(map);
    }
}
