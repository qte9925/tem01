package com.lx.service;

import com.lx.dao.TapplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class TapplyServcieimpl implements TaoolyService{
    @Autowired
    private TapplyDao dao;

    @Override
    public List tappSelect(Map map) {
        return dao.tappSelect(map);
    }

    @Override
    public int tappinsert(Map map) {
        return dao.tappinsert(map);
    }
}
