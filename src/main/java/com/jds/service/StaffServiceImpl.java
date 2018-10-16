package com.jds.service;

import com.jds.dao.StaffMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class StaffServiceImpl implements StaffService {
   @Autowired
   private StaffMapper sm;
    public List<Map> selectM(Map map) {
        return sm.selectM(map);
    }

    @Override
    public int insertM(Map map) {
        return sm.insertM(map);
    }

    @Override
    public Map selectMByid(int id) {
        return sm.selectMByid(id);
    }

    @Override
    public int updateM(Map map) {
        return sm.updateM(map);
    }

    @Override
    public int deleteM(int id) {
        return sm.deleteM(id);
    }
}
