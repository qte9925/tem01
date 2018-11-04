package com.jds.service;

import com.jds.dao.IncometaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class IncometaxServiceImpl implements IncometaxService{
   @Autowired
   private IncometaxMapper im;
    public List<Map> selectI(Map map) {
        return im.selectI(map);
    }

    @Override
    public int insertI(Map map) {
        return im.insertI(map);
    }

    @Override
    public Map selectIByid(int id) {
        return im.selectIByid(id);
    }

    @Override
    public int updateI(Map map) {
        return im.updateI(map);
    }

    @Override
    public int deleteI(int id) {
        return im.deleteI(id);
    }
}
