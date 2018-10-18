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
    @Override
    public List repselect(Map map) {
        return dao.repselect(map);
    }

    @Override
    public List selectrep01(Map map) {
        return dao.selectrep01(map);
    }

    @Override
    public int updaterep(Map map) {
        return dao.updaterep(map);
    }

    @Override
    public int insertrep(Map map) {
        System.out.print("22");
        return dao.insertrep(map);
    }

    @Override
    public int delete(Map map) {
        return dao.delete(map);
    }


}
