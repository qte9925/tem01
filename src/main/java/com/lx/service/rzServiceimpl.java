package com.lx.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.lx.dao.rzdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class rzServiceimpl implements rzService{
    @Autowired
    private rzdao dao;
    @Override
    public List rzselect(Map map) {
        return dao.rzselect(map);
    }

    @Override
    public List rymssqselect011(Map map) {
        return dao.rymssqselect011(map);
    }

    @Override
    public int rzsq(Map map) {
        return dao.rzsq(map);
    }

    @Override
    public int rymssqinccc(Map map) {
        return dao.rymssqinccc(map);
    }

    @Override
    public List rymssqselect(Map map) {
        return dao.rymssqselect(map);
    }

    @Override
    /*public List rymssqselect2(Map map) {
        return dao.rymssqselect2(map);
    }*/
    public PageInfo<Map> rymssqselect2(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.rymssqselect2(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public int rzzx(Map map) {
        return dao.rzzx(map);
    }

    @Override
    public int rzzj(Map map) {
        return dao.rzzj(map);
    }
}
