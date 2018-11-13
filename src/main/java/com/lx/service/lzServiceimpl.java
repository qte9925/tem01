package com.lx.service;

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

    @Override
    public List lzdjselect(Map map) {
        return lzdao.lzdjselect(map);
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
