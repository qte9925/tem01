package com.yzj.service;

import com.yzj.dao.KaoheTongguo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class TongguoServiceImp implements TongguoService{
    @Autowired
    private KaoheTongguo ktg;
    public List<Map> TongGuo(Map map) {
        return ktg.TongGuo(map);
    }
    public int addnewbaoming(Map map) {
        return ktg.addnewbaoming(map);
    }
}
