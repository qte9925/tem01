package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface KaoheTongguo {
    public List<Map> TongGuo(Map map);
    public int addnewbaoming(Map map);
}
