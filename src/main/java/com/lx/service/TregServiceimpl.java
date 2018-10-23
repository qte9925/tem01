package com.lx.service;

import com.lx.dao.TregDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class TregServiceimpl implements TregService{
    @Autowired
    private TregDao dao;
    @Override
    public List tselect(Map map) {
        return dao.tselect(map);
    }

    @Override
    public List tselect01(Map map) {
        return dao.tselect01(map);
    }

    @Override
    public int tupdate(Map map) {
        System.out.print(121);
        return dao.tupdate(map);
    }

    @Override
    public int tdelete(Map map) {
        return dao.tdelete(map);
    }

    @Override
    public int tinsert(Map map) {
        return dao.tinsert(map);
    }
}
