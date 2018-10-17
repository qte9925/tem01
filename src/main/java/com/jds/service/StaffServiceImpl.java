package com.jds.service;

import com.github.pagehelper.PageHelper;

import com.github.pagehelper.PageInfo;
import com.jds.dao.StaffMapper;
import com.jds.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class StaffServiceImpl implements StaffService {
   @Autowired
   private StaffMapper sm;
    public PageInfo<Map> selectM(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=sm.selectM(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        System.out.print(returnPage+"a"+page.getRowSize());
        return returnPage;
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
