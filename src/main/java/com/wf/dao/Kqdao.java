package com.wf.dao;

import org.springframework.stereotype.Component;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Component
public interface Kqdao {
    List<Map> selectwf_qiandao(Map map);
    List<Map> cxqinjiq021(Map map);
    List<Map> selectwf_kqtj(Map map);
    List<Map> cxqj0334(Map map);
    int insertqiandao(Map map );
    int insertwf_kqtj(Map map );
    int qjxqupdate(Map map );
    List cxqj02(Map map);
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

}
