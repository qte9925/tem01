package com.bc.service;
import com.bc.dao.TbDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
//部门操作
@Service
public class TbDeptServicesImpl implements TbDeptServices{
    @Autowired
    private TbDeptMapper tdm;
    //查询所有部门
    public List<Map> showTbpost(Map map){
        return tdm.showTbpost(map);
    }

}
