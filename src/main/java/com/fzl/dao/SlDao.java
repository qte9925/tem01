package com.fzl.dao;
import org.springframework.stereotype.Controller;

import java.util.*;
@Controller
public interface SlDao {
    public List select(Map map);
    public int insert(Map map);
    public int delete(Integer type_id);
    public int update(Map map);
    public Map select01(int id);
}
