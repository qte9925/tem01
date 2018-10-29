package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.PlanDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PlanServiceImp implements PlanService{
    @Autowired
    private PlanDao dao;


    @Override
    public PageInfo<Map> selectPlan(PageEntity page, Map map) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectPlan(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
//        System.out.println(returnPage);
//        System.out.println(list);
        return returnPage;

    }

    @Override
    public int deletePlan(Map map) {
        return dao.deletePlan(map);
    }

    @Override
    public List selectByIdPlan(Map map) {
        return dao.selectByIdPlan(map);
    }

    @Override
    public int updatePlana(Map map) {
        return dao.updatePlana(map);
    }

    @Override
    public int addPlan(Map map) {
        return dao.addPlan(map);
    }

    @Override
    public List departmentFindTypePlan(Map map) {
        return dao.departmentFindTypePlan(map);
    }

    @Override
    public List shenpirenFindType(Map map) {
        return dao.shenpirenFindType(map);
    }

    @Override
    public List qvdaoFindType(Map map) {
        return dao.qvdaoFindType(map);
    }

    @Override
    public List XingshiFindType(Map map) {
        return dao.XingshiFindType(map);
    }



}
