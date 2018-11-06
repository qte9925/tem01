package com.jds.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.dao.NoticeMapper;
import com.jds.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    private NoticeMapper nm;

    @Override
    public int insertN(Map map) {
        return nm.insertN(map);
    }

    @Override
    public PageInfo<Map> selectN(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=nm.selectN(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public Map selectNa(int id) {
        return nm.selectNa(id);
    }

    @Override
    public int updateN(Map map) {
        return nm.updateN(map);
    }

    @Override
    public List<Map> cc02(Map map) {
        return nm.cc02(map);
    }

    @Override
    public PageInfo<Map> selectG(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=nm.selectG(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public PageInfo<Map> selectG1(Map map, PageEntity page) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=nm.selectG1(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }


}
