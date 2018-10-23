package com.lx.service;

import com.lx.dao.GoodsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class GoodsService implements GoodsSersert{
    @Autowired
    private GoodsDao gdao;
    @Override
    public List gselect(Map map) {
        return gdao.gselect(map);
    }
    @Override
    public List gselect01(Map map) {
        return gdao.gselect01(map);
    }

    @Override
    public int gupdate(Map map) {
        return gdao.gupdate(map);
    }

    @Override
    public int gdelete(Map map) {
        return gdao.gdelete(map);
    }

    @Override
    public int ginsert(Map map) {
        return gdao.ginsert(map);
    }
}
