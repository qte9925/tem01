package com.wf.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface Kqdao {
    List<Map> gzrl(Map map);
    List<Map> qjlxselect(Map map);
    int qingjiainsert(Map map);
    List<Map> cxqinjiq(Map map);
    List<Map> cxqinjiq02(Map map);
    int updateqj(Map map);
    int qdinsert(Map map);
    List<Map> cxsxb02(Map map);
    List<Map> ygbrqd(Map map);

}
