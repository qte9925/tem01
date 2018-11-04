package com.wf.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface Zpdao {
    int zpjhinsert(Map map);
    List<Map> zpcx01(Map map);
}
