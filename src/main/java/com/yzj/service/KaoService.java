package com.yzj.service;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
public interface KaoService {
    public PageInfo<Map> selectkaoheyzj(PageEntity page, Map map);
    public int addkaoheyzj(Map map);
    public int deletekaoheyzj(Map map);
    public List selectkaoheByIdyzj(Map map);
    public int updatekaoheyzj(Map map);
    public List FindKaoHerenType(Map map);
}
