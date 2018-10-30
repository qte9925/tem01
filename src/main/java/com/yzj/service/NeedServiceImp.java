package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.NeedDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class NeedServiceImp implements NeedService{
@Autowired
    private NeedDao dao;

    @Override
    public PageInfo<Map> selectNeed(PageEntity page,Map map ) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectNeed(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
//        System.out.println(returnPage);
//        System.out.println(list);
        return returnPage;
    }

    @Override
    public int deleteNeed(Map map) {
        return dao.deleteNeed(map);
    }

    @Override
    public List selectById(Map map) {

        return dao.selectById(map);
    }

    @Override
    public int updateNeed(Map map) {
        return dao.updateNeed(map);
    }

    @Override
    public int addNeed(Map map) {
        return dao.addNeed(map);
    }

    @Override
    public List departmentFindType(Map map) {
        return dao.departmentFindType(map);
    }

    @Override
    public int xiugaixuqiuxinxia(Map map){
        return dao.xiugaixuqiuxinxia(map);
    }
}
