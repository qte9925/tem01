package com.yzj.service;

import com.yzj.dao.BaomingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class BaomingServiceImp implements BaomingService{
    @Autowired
    private BaomingDao dao;
    @Override
    public int AddBaomingyzj(Map map) {
        return dao.AddBaomingyzj(map);
    }
}
