package com.wf.service;

import com.wf.dao.Kqdao;
import com.wf.util.Excel001;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.*;

@Transactional
@Service
public class KqIm implements Kq {
    @Autowired
    private Kqdao dao;
    @Autowired
    private Excel001 Excel001;


    @Override
    public List<Map> cxqj03(Map map) {
        return dao.cxqj03(map);
    }

    @Override
    public List cxqj02(Map map) {
        return dao.cxqj02(map);
    }

    @Override
    public int qjxqupdate(Map map) {
        return dao.qjxqupdate(map);
    }

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

    //查询请假详情
    public List<Map> qjspxq(Map map) {
        return dao.qjspxq(map);
    }

    //查询全部出差
    public List<Map> cxqbcc(Map map) {
        return dao.cxqbcc(map);
    }

   //增加出差表
    public int chuchaiinsert(Map map) {
        return dao.chuchaiinsert(map);
    }
    @Override
    public String InputExcel(InputStream is, String originalFilename) {
        Map<String,Object> ginsengMap = new HashMap<String,Object>();
        List<ArrayList<Object>> list;
        if (originalFilename.endsWith(".xls")) {
//            list = Excel001.readExcel2003(is);
            list = null;
        } else {
            list = Excel001.readExcel2007(is);
        }
        for (int i=0,j=list.size();i<j;i++){
            List<Object> row = list.get(i);
            for(int c=0;c<row.size();c++){
                System.out.println(row.get(c));
            }
//            System.out.println(row.get(0));
//            ginsengMap.put("name", row.get(0).toString());
//            ginsengMap.put("sex", row.get(1).toString());
//            ginsengMap.put("email", row.get(2).toString());
//            ginsengMap.put("dept_id", row.get(3).toString());
//            dao.InputExcel(ginsengMap);
        }
        return "01";
    }
}
