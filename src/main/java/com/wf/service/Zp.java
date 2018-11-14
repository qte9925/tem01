package com.wf.service;

import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface Zp {

    int updatewf_tdjl01(Map map);
    int updateccwfjianli(Map map);
    int updatewfzps01(Map map);
    int xiugaizpxq(Map map);
    int deletesczpxq(Map map);
    int deletewfzps(Map map);
    int insert_wf_ms(Map map);
    int zxiugai0041(Map map);
    int insert_wf_tdjl(Map map);
    int insert_wf_jianli(Map map);
    List<Map> countwf_ms(Map map);
    List<Map> sxtdr(Map map);
    List<Map> zpcx03(Map map);
    PageInfo<Map> zpsqbcx02(Map map, PageEntity page);
    PageInfo<Map> cxtdjl003(Map map, PageEntity page);
    PageInfo<Map> zpcxgrbm(Map map, PageEntity page);
    PageInfo<Map> zpcx01(Map map, PageEntity page);
    PageInfo<Map> daishenkecx(Map map, PageEntity page);
    PageInfo<Map> cxzjhs(Map map, PageEntity page);
    PageInfo<Map> cxtdjl002(Map map, PageEntity page);
    List<Map> zpsqbcx03(Map map);
    List<Map> cxtdjl001(Map map);
    int xxcx(Map map);
    List<Map> xxcx02(Map map);
    int insert_wf_qtyh(Map map);

    List<Map> qtyh(Map map);

    List<Map> gjidcx(Map map);

    int zpjhinsert(Map map);
    List<Map> gwcx02(Map map);

    List<Map> zpcx02(Map map);
    List<Map> zpbmxq(Map map);
    List<Map> gwcx01(Map map);
    List<Map> wys(Map map);
    List<Map> gwrs(Map map);
    List<Map> bmhcx(Map map);
    int zpsinsert(Map map);
    List<Map> zpbmxq02(Map map);
    int zpsxiugai(Map map);


}
