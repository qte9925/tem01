package com.jds.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.dao.WagesMapper;
import com.jds.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class WagesServiceImpl implements WagesService{
    @Autowired
    private WagesMapper wm;
    public Map selectWByid(int id) {
        return wm.selectWByid(id);
    }

    @Override
    public List<Map> selectSl() {
        return wm.selectSl();
    }

    @Override
    public List<Map> selectBx() {
        return wm.selectBx();
    }

    @Override
    public int selectGz(Map map) {
        return wm.insertGz(map);
    }

    @Override
    public PageInfo<Map> selectX(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=wm.selectX(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public int insertX(Map map) {
        return wm.insertX(map);
    }

    @Override
    public int updateX(int id) {
        return wm.updateX(id);
    }

    @Override
    public PageInfo<Map> selectX1(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=wm.selectX1(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public int updateXs(Map map) {
        return wm.updateXs(map);
    }

    @Override
    public int updateXb(Map map) {
        return wm.updateXb(map);
    }

    @Override
    public List selectXb(Map map) {
        return wm.selectXb(map);
    }

    @Override
    public PageInfo<Map> selectXf(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=wm.selectXf(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public int updateXf(Map map) {
        return wm.updateXf(map);
    }


}
