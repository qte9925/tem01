package com.wf.service;

import com.wf.dao.Csdao;
import com.wf.dao.Zpdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
@Service
public class ZpIm implements Zp{
    @Autowired
    private Zpdao dao;

    //根据ID查询任务书详情
    public List<Map> gjidcx(Map map) {
        return dao.gjidcx(map);
    }

    //增加招聘需求
    public int zpjhinsert(Map map) {
        return dao.zpjhinsert(map);
    }

    @Override
    public List<Map> gwcx02(Map map) {
        return dao.gwcx02(map);
    }

    //招聘需求查询
    public List<Map> zpcx01(Map map) {
        return dao.zpcx01(map);
    }


    public List<Map> zpcx02(Map map) {
        return dao.zpcx02(map);
    }

    //各部门查看自己招聘计划
    public List<Map> zpcxgrbm(Map map) {
        return dao.zpcxgrbm(map);
    }

    //招聘目标需求
    public List<Map> zpbmxq(Map map) {
        return dao.zpbmxq(map);
    }

    //招聘根据所选择的部门ID选择角色（岗位）
    public List<Map> gwcx01(Map map) {
        return dao.gwcx01(map);
    }

    //查询部门是否达到限制人数
    public List<Map> wys(Map map) {
        return dao.wys(map);
    }

    //查询岗位人数
    public List<Map> gwrs(Map map) {
        return dao.gwrs(map);
    }

    //查询部门号
    public List<Map> bmhcx(Map map) {
        return dao.bmhcx(map);
    }

    @Override
    public List<Map> zpbmxq02(Map map) {
        return dao.zpbmxq02(map);
    }

    //查询招聘书
    public List<Map> cxzjhs(Map map) {
        return dao.cxzjhs(map);
    }

    //修改待审核状态
    public int zpsxiugai(Map map) {
        return dao.zpsxiugai(map);
    }

    //根据审核状态查询任务书
    public List<Map> daishenkecx(Map map) {
        return dao.daishenkecx(map);
    }

    @Override
    public int zpsinsert(Map map) {
        return dao.zpsinsert(map);
    }

}
