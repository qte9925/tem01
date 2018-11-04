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

    //增加招聘需求
    public int zpjhinsert(Map map) {
        return dao.zpjhinsert(map);
    }

    //招聘需求查询
    public List<Map> zpcx01(Map map) {
        return dao.zpcx01(map);
    }
}
