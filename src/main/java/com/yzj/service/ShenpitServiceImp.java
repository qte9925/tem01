package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.ShenpitDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShenpitServiceImp implements ShenpitService{
    @Autowired
    private ShenpitDao dao;

    @Override
    public PageInfo<Map> selectShenpit(PageEntity page, Map map) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectShenpit(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
        System.out.print(returnPage+"a");
        return returnPage;
    }

    @Override
    public int updateShenpit(Map map) {
        return dao.updateShenpit(map);
    }
}
