package com.lx.dao;

import java.util.*;

public interface GoodsDao {
    public List gselect(Map map);
    public List gselect01(Map map);
    public int gupdate(Map map);
    public int gdelete(Map map);
    public int ginsert(Map map);
}
