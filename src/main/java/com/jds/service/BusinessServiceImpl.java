package com.jds.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.dao.BusinessMapper;
import com.jds.dao.NoticeMapper;
import com.jds.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class BusinessServiceImpl implements BusinessService {
    @Autowired
    private BusinessMapper bm;
    public List<Map> selectGz(Map map) {
        return bm.selectGz(map);
    }

    @Override
    public int insertGz(Map map) {
        return bm.insertGz(map);
    }

    @Override
    public int insertBf(Map map) {
        return bm.insertBf(map);
    }

    @Override
    public PageInfo<Map> selectBf(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=bm.selectBf(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public List<Map> selectGza(Map map) {
        return bm.selectGza(map);
    }

    @Override
    public Map selectGzId(int id) {
        return bm.selectGzId(id);
    }

    @Override
    public int updateGz(Map map) {
        return bm.updateGz(map);
    }

    @Override
    public int updateGza(Map map) {
        return bm.updateGza(map);
    }
    @Override
    public int updateGzb(Map map) {
        return bm.updateGzb(map);
    }

    @Override
    public List<Map> selectYj(Map map) {
        return bm.selectYj(map);
    }
    @Override
    public int updateGzc(Map map) {
        return bm.updateGzc(map);
    }
}
