package com.jds.service;

import com.jds.dao.IncometaxMapper;
import com.jds.dao.InsuranceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InsuranceServiceImpl implements InsuranceService{
   @Autowired
   private InsuranceMapper in;
    public List<Map> selectIn(Map map) {
        return in.selectIn(map);
    }

    @Override
    public int insertIn(Map map) {
        return in.insertIn(map);
    }

    @Override
    public Map selectInByid(int id) {
        return in.selectInByid(id);
    }

    @Override
    public int updateIn(Map map) {
        return in.updateIn(map);
    }

    @Override
    public int deleteIn(int id) {
        return in.deleteIn(id);
    }
}
