package com.bc.service;

import com.bc.dao.TbDetailoneMapper;
import com.bc.dao.TbEventMapper;
import com.bc.entity.TbDetailone;
import com.bc.entity.TbEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TbEventServicesImpl implements TbEventServices{
    @Autowired
    private TbEventMapper te;
    @Autowired
    private TbDetailoneMapper de;
    //根据taskid查询所有项目
    public List<Map> selectEvent(int tbTaskId){
        return  te.selectEvent(tbTaskId);
    }
    //删除修改状态
    public Integer DeleteEvent(int tdEventId){
        return te.DeleteEvent(tdEventId);
    }
    //添加查询项
    public int insertEvent(Map map){
        return te.insertEvent(map);
    }
    /*TaskId*/
    public int insertEventOne(Map map){
        TbEvent tv = new TbEvent();
        tv.setTbEventName(map.get("tb_event_name").toString());
        tv.setTbEventValue(map.get("tb_event_value").toString());
        tv.setTbEventMark(Integer.parseInt(map.get("tb_event_mark").toString()));
        int e =  te.insert(tv);
        int maxeid = te.SelectTbEventId();
        System.out.print(maxeid+"*******************02**");
        TbDetailone tl = new TbDetailone();
        tl.setTbDetailoneMark(map.get("tb_event_mark").toString());
        tl.setTbEventId(maxeid);
        System.out.print("*******************02**");
        tl.setTbTaskId(Integer.parseInt(map.get("TaskId").toString()));
        System.out.print(Integer.parseInt(map.get("TaskId").toString())+"*******************02**");
        int d = de.insert(tl);
        int result = 1;
        return  result;
    }
    //根据id查询考核任务项
    public Map selectTbEventId(Integer tbEventId){
        return te.selectTbEventId(tbEventId);
    }
    //修改考核任务项
    public int UpdateEvent(Map map){
        return te.UpdateEvent(map);
    }
}
