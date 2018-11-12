package com.yzj.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzj.dao.TeaDao;
import com.yzj.entity.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class TeaServiceImp implements TeaService{
@Autowired
private TeaDao dao;
    @Override
    public PageInfo<Map> selectYzjTeacher(PageEntity page, Map map) {
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list=dao.selectYzjTeacher(map);
        PageInfo<Map> returnPage;
        returnPage = new PageInfo<Map>(list);
//        System.out.println(returnPage);
//        System.out.println(list);
        return returnPage;

    }

    @Override
    public int addYzjTeacher(Map map) {
        return dao.addYzjTeacher(map);
    }

    @Override
    public int deleteYzjTeacher(Map map) {
        return dao.deleteYzjTeacher(map);
    }

    @Override
    public List SelectByIdYzjTeacher(Map map) {
        return dao.SelectByIdYzjTeacher(map);
    }

    @Override
    public int updateYzjTeacher(Map map) {
        return dao.updateYzjTeacher(map);
    }
}
