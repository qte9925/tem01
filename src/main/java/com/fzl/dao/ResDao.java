package com.fzl.dao;

import java.util.*;

public interface ResDao {
    public List<Map> select(Map map);
    public List select01(Map map);
    public int update(Map map);
    public int delete(Map map);
    public int insert(Map map);
}
