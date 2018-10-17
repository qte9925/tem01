package com.yzj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface NeedService {

    public List selectNeed(Map map);
    public int  deleteNeed(Map map);
    public List selectById(Map map);
    public int updateNeed(Map map);
    public int addNeed(Map map);
    public List departmentFindType(Map map);
}
