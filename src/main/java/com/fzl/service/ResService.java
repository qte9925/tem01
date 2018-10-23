package com.fzl.service;

import java.util.*;

public interface ResService {
    public List select(Map map);
    public List select01(Map map);
    public int update(Map map);
    public int delete(Map map);
    public  int  insert(Map map);

}
