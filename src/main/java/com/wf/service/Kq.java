package com.wf.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface Kq {
    List<Map> gzrl(Map map);
    List<Map> qjlxselect(Map map);
    int qingjiainsert(Map map);
    List<Map> cxqinjiq02(Map map);
    List<Map> cxqinjiq(Map map);
    int updateqj(Map map);
    int qdinsert(Map map);
    List<Map> cxsxb02(Map map);
    List<Map> ygbrqd(Map map);
    List<Map> qjspxq(Map map);
    List<Map> cxqbcc(Map map);
    int chuchaiinsert(Map map );
    String InputExcel(InputStream is, String originalFilename);

}
