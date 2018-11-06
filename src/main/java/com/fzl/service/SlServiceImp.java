package com.fzl.service;

import com.fzl.dao.SlDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class SlServiceImp  implements  SlService{
    @Autowired
    private SlDao dao;
    @Override
    public List select(Map map) {
        return dao.select(map);
    }

    @Override
    public int insert(Map map) {
        return dao.insert(map);
    }

    @Override
    public int delete(Integer type_id) {
        return dao.delete(type_id);
    }

    @Override
    public int update(Map map) {
        return dao.update(map);
    }

    @Override
    public Map select01(int id) {
        return dao.select01(id);
    }


}
