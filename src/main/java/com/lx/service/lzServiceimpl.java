package com.lx.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.lx.dao.lzdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class lzServiceimpl implements lzService{
    @Autowired
    private lzdao lzdao;
    @Override
    public int lzinsetes(Map map) {
        return lzdao.lzinsetes(map);
    }

    @Override
    public List lzselect(Map map) {
        return lzdao.lzselect(map);
    }

    public PageInfo<Map> lzdjselect(Map map, PageEntity page){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        List list1=lzdao.lzdjselect(map);
        PageInfo<Map> returnPage=new PageInfo<Map>(list1);
        return returnPage;
    }

    @Override
    public int lzdjupdate(Map map) {
        return lzdao.lzdjupdate(map);
    }

    @Override
    public List lzzxselect(Map map) {
        return lzdao.lzzxselect(map);
    }

    @Override
    public int lzzxdelete(Map map) {
        return lzdao.lzzxdelete(map);
    }

}
