package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;

import java.util.List;
import java.util.Map;

public interface TeaService {
    public PageInfo<Map> selectYzjTeacher(PageEntity page, Map map);
    public int addYzjTeacher(Map map);
    public int deleteYzjTeacher(Map map);
    public List SelectByIdYzjTeacher(Map map);
    public int updateYzjTeacher(Map map);
}
