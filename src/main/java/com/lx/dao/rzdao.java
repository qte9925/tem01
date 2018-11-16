package com.lx.dao;

import java.util.List;
import java.util.Map;

public interface rzdao {
    List rzselect(Map map);
    List rymssqselect011(Map map);
    int rzsq(Map map);
    int rymssqinccc(Map map);
    //入职人员查询
    List rymssqselect(Map map);
    List rymssqselect2(Map map);
    int rzzx(Map map);
    int rzzj(Map map);
}
