package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.DepDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class DepServiceImp implements DepService{

    @Autowired
        private DepDao dao;

    @Override
    public PageInfo<Map> selectDep(PageEntity page, Map map) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectDep(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
//        System.out.println(returnPage);
//        System.out.println(list);
        return returnPage;

    }

    @Override
    public int deleteDep(Map map) {
        return dao.deleteDep(map);
    }

    @Override
    public List selectByIdDep(Map map) {
        return dao.selectByIdDep(map);
    }

    @Override
    public int updateDep(Map map) {
        return dao.updateDep(map);
    }

    @Override
    public int addDep(Map map) {
        return dao.addDep(map);
    }

    @Override
    public List departmentFindTypeDep(Map map) {
        return dao.departmentFindTypeDep(map);
    }

    @Override
    //修改需求信息
    public int xiugaixuqiuxinxib(Map map) {
        return dao.xiugaixuqiuxinxib(map);
    }
}
