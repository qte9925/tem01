package com.lx.service;

import java.util.List;
import java.util.Map;

public interface TregService {
    public List tselect(Map map);
    public List tselect01(Map map);
    public int tupdate(Map map);
    public int tdelete(Map map);
    public int tinsert(Map map);
}
