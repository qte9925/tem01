package com.yzj.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface TeaDao {
    public List<Map> selectYzjTeacher(Map map);
    public int addYzjTeacher(Map map);
    public int deleteYzjTeacher(Map map);
    public List SelectByIdYzjTeacher(Map map);
    public int updateYzjTeacher(Map map);
}
