package com.wf.service;

import com.wf.dao.Kqdao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class KqIm implements Kq {
    @Autowired
    private Kqdao dao;

    //查询工作日历
    public List<Map> gzrl(Map map) {
        return dao.gzrl(map);
    }

   //查询请假类型
    public List<Map> qjlxselect(Map map) {
        return dao.qjlxselect(map);
    }

    //增加请假时间
    public int qingjiainsert(Map map) {
        return dao.qingjiainsert(map);
    }

    //带条件查询请假详情
    public List<Map> cxqinjiq02(Map map) {
        return dao.cxqinjiq02(map);
    }

    //查询请假详情
    public List<Map> cxqinjiq(Map map) {
        return dao.cxqinjiq(map);
    }

    //审批请假
    public int updateqj(Map map) {
        return dao.updateqj(map);
    }

    //增加签到表
    public int qdinsert(Map map) {
        return dao.qdinsert(map);
    }

    //查询当日工作时间
    public List<Map> cxsxb02(Map map) {
        return dao.cxsxb02(map);
    }

    //查询用户签到详情
    public List<Map> ygbrqd(Map map) {
        return dao.ygbrqd(map);
    }
}
