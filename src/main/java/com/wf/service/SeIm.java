package com.wf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.wf.dao.Csdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
@Transactional
@Service
public class SeIm implements Se{
    @Autowired
    private Csdao dao;
    @Override
    public List login(Map map) {
        return dao.login(map);
    }

    @Override
    public List jsbselect01() {
        return dao.jsbselect01();
    }

    //增加合同
    public int insert_wf_hetong(Map map) {
        return dao.insert_wf_hetong(map);
    }

    //updatewfstafftablerzht
    public int updatewfstafftablerzht(Map map) {
        return dao.updatewfstafftablerzht(map);
    }

    @Override
    public int yhinsert01(Map map) {
        return dao.yhinsert01(map);
    }

    //查询用户列表
    public List selectyh01() {
        return dao.selectyh01();
    }
    //查询入职离职表
    public List rlsq() {
        return dao.rlsq();
    }

    @Override
    public List<Map> rybdleixingchaxun() {
        return dao.rybdleixingchaxun();
    }

    //合同类型查询
    public List<Map> htlxcx(Map map) {
        return dao.htlxcx(map);
    }
    //公司查询
    public List<Map> gscx(Map map) {
        return dao.gscx(map);
    }

    //查询权限表
    public List<Map> cxqxb(Map map) {
        return dao.cxqxb(map);
    }

    //查询角色表
    public List<Map> cxjsb02(Map map) {
        return dao.cxjsb02(map);
    }

    //查询角色权限
    public List<Map> cxjsqx01(Map map) {
        return dao.cxjsqx01(map);
    }

    //查询员工表id和name、
    public List<Map> ygbid(Map map) {
        return dao.ygbid(map);
    }

    //增加合同
    public int zjht(Map map) {
        return dao.zjht(map);
    }

    //查询合同内容
    public PageInfo<Map> htnrcx(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.htnrcx(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public int yhinsert02(Map map) {
        return dao.yhinsert02(map);
    }

    @Override
    public int cxqxb30(Map map) {
        return dao.cxqxb30(map);
    }

    @Override
    public List<Map> index01(Map map) {
        return dao.index01(map);
    }
}
