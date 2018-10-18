package com.jds.service;


import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface StaffService {
    public PageInfo<Map> selectM(Map map, PageEntity page);
    public int insertM(Map map);
    public Map selectMByid(int id);
    public int updateM(Map map);
    public int deleteM(int id);
}
