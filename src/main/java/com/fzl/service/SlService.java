package com.fzl.service;
import java.util.List;
import java.util.Map;

public interface SlService {
    public List select(Map map);
    public int insert(Map map);
    public int delete(Integer type_id);
    public int update(Map map);
    public Map select01(int id);

}
