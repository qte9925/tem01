package com.wf.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface Kq {
    List cxqj02(Map map);
    List cxqinjiq021(Map map);
    int qjxqupdate(Map map );
    List<Map> gzrl(Map map);
    List<Map> qjlxselect(Map map);
    int qingjiainsert(Map map);
    List<Map> cxqinjiq02(Map map);
    List<Map> cxqinjiq(Map map);
    int updateqj(Map map);
    int qdinsert(Map map);
    List<Map> cxsxb02(Map map);
    List<Map> ygbrqd(Map map);
    PageInfo<Map> qjspxq(Map map, PageEntity page);
    PageInfo<Map> cxqj0334(Map map, PageEntity page);
    PageInfo<Map> selectwf_kqtj(Map map, PageEntity page);
    PageInfo<Map> selectwf_qiandao(Map map, PageEntity page);
    PageInfo<Map> cxqbcc(Map map, PageEntity page);
    int chuchaiinsert(Map map );
    String InputExcel(InputStream is, String originalFilename);

}
