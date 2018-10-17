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

    @Override
    public int deleteNeed(Map map) {
        return dao.deleteNeed(map);
    }

    @Override
    public List selectById(Map map) {

        return dao.selectById(map);
    }

    @Override
    public int updateNeed(Map map) {
        return dao.updateNeed(map);
    }

    @Override
    public int addNeed(Map map) {
        return dao.addNeed(map);
    }

    @Override
    public List departmentFindType(Map map) {
        return dao.departmentFindType(map);
    }
}
