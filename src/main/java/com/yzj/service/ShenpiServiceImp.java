package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.ShenpiDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ShenpiServiceImp implements ShenpiService{

    @Autowired
    private ShenpiDao dao;
    @Override
    public PageInfo<Map> selectdaishenpiplan(PageEntity page, Map map) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectdaishenpiplan(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
        System.out.print(returnPage+"a");
        return returnPage;

    }

    @Override
    public int updateshenpiplanyzj(Map map) {
        return dao.updateshenpiplanyzj(map);
    }

    @Override
    public int updatexinxiplan(Map map) {
        return dao.updatexinxiplan(map);
    }

    @Override
    public int AddBaomingyzj(Map map) {
        return dao.AddBaomingyzj(map);
    }

    @Override
    public List selectyibaoming(Map map) {
        return dao.selectyibaoming(map);
    }
}
