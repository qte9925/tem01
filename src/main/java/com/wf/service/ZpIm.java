package com.wf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
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

    @Override
    public int updatewf_tdjl01(Map map) {
        return dao.updatewf_tdjl01(map);
    }

    @Override
    public int updateccwfjianli(Map map) {
        return dao.updateccwfjianli(map);
    }

    @Override
    public int updatewfzps01(Map map) {
        return dao.updatewfzps01(map);
    }

    @Override
    public int xiugaizpxq(Map map) {
        return dao.xiugaizpxq(map);
    }

    @Override
    public int deletesczpxq(Map map) {
        return dao.deletesczpxq(map);
    }

    @Override
    public int deletewfzps(Map map) {
        return dao.deletewfzps(map);
    }

    //增加面试表
    public int insert_wf_ms(Map map) {
        return dao.insert_wf_ms(map);
    }

    @Override
    public int zxiugai0041(Map map) {
        return dao.zxiugai0041(map);
    }

    //增加添加简历表
    public int insert_wf_tdjl(Map map) {
        return dao.insert_wf_tdjl(map);
    }

    //添加简历
    public int insert_wf_jianli(Map map) {
        return dao.insert_wf_jianli(map);
    }

    //统计查询当前是第几次面试
    public List<Map> countwf_ms(Map map) {
        return dao.countwf_ms(map);
    }

    @Override
    public List<Map> sxtdr(Map map) {
        return dao.sxtdr(map);
    }

    @Override
    public List<Map> zpcx03(Map map) {
        return dao.zpcx03(map);
    }



    //招聘书全部查询
    public PageInfo<Map> zpsqbcx02(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.zpsqbcx02(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    //招聘书全部查询
    public PageInfo<Map> cxtdjl003(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.cxtdjl003(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    //各部门查看自己招聘计划
    public PageInfo<Map> zpcxgrbm(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.zpcxgrbm(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    //各部门查看自己招聘计划
    public PageInfo<Map> zpcx01(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.zpcx01(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    //各部门查看自己招聘计划
    public PageInfo<Map> cxzjhs(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.cxzjhs(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    //各部门查看自己招聘计划
    public PageInfo<Map> daishenkecx(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.daishenkecx(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }
    //查询已经投递简历
    public PageInfo<Map> cxtdjl002(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=dao.cxtdjl002(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }


    @Override
    public List<Map> zpsqbcx03(Map map) {
        return dao.zpsqbcx03(map);
    }

    //查询员工是否已经投递过简历
    public List<Map> cxtdjl001(Map map) {
        return dao.cxtdjl001(map);
    }

    //查询该前台用户是否注册了个人简历
    public int xxcx(Map map) {
        List<Map> list = dao.xxcx(map);
        if(list.size()>0){
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public List<Map> xxcx02(Map map) {
        return dao.xxcx02(map);
    }

    //招聘前台注册
    public int insert_wf_qtyh(Map map) {
        return dao.insert_wf_qtyh(map);
    }

    //招聘前台登录
    public List<Map> qtyh(Map map) {
        return dao.qtyh(map);
    }

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




    public List<Map> zpcx02(Map map) {
        return dao.zpcx02(map);
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


    //修改待审核状态
    public int zpsxiugai(Map map) {
        return dao.zpsxiugai(map);
    }



    @Override
    public int zpsinsert(Map map) {
        return dao.zpsinsert(map);
    }

}
