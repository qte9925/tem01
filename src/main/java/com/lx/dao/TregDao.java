package com.lx.dao;

import org.springframework.stereotype.Component;

import java.util.*;

@Component
public interface TregDao {
    public List tselect(Map map);
    public List tselect01(Map map);
    public int tupdate(Map map);
    public int tdelete(Map map);
    public int tinsert(Map map);
}
