package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.KaoDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class KaoServiceImp implements KaoService{
    @Autowired
    private KaoDao dao;
    @Override
    public PageInfo<Map> selectkaoheyzj(PageEntity page, Map map) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectkaoheyzj(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
//        System.out.println(returnPage);
//        System.out.println(list);
        return returnPage;
    }

    @Override
    public int addkaoheyzj(Map map) {
        return dao.addkaoheyzj(map);
    }

    @Override
    public int deletekaoheyzj(Map map) {
        return dao.deletekaoheyzj(map);
    }

    @Override
    public List selectkaoheByIdyzj(Map map) {
        return dao.selectkaoheByIdyzj(map);
    }

    @Override
    public int updatekaoheyzj(Map map) {
        return dao.updatekaoheyzj(map);
    }

    @Override
    public List FindKaoHerenType(Map map) {
        return dao.FindKaoHerenType(map);
    }
}
