package com.wf.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface Zpdao {

    int updatewf_tdjl01(Map map);
    int updateccwfjianli(Map map);
    int xiugaizpxq(Map map);
    int deletesczpxq(Map map);
    int updatewfzps01(Map map);
    int deletewfzps(Map map);
    int insert_wf_ms(Map map);
    int zxiugai0041(Map map);
    int insert_wf_tdjl(Map map);
    int insert_wf_jianli(Map map);
    List<Map> zpcx03(Map map);
    List<Map> sxtdr(Map map);
    List<Map> countwf_ms(Map map);
    List<Map> zpsqbcx02(Map map);
    List<Map> cxtdjl003(Map map);
    List<Map> cxtdjl002(Map map);
    List<Map> zpsqbcx03(Map map);
    List<Map> cxtdjl001(Map map);
    List<Map> xxcx(Map map);
    List<Map> xxcx02(Map map);
    int insert_wf_qtyh(Map map);
    List<Map> qtyh(Map map);
    List<Map> gjidcx(Map map);

    int zpjhinsert(Map map);
    List<Map> gwcx02(Map map);
    List<Map> zpcx01(Map map);
    List<Map> zpcx02(Map map);
    List<Map> zpcxgrbm(Map map);
    List<Map> zpbmxq(Map map);
    List<Map> gwcx01(Map map);
    List<Map> wys(Map map);
    List<Map> gwrs(Map map);
    List<Map> bmhcx(Map map);
    int zpsinsert(Map map);
    List<Map> zpbmxq02(Map map);
    List<Map> cxzjhs(Map map);
    int zpsxiugai(Map map);
    List<Map> daishenkecx(Map map);



}
