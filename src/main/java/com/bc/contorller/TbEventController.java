package com.bc.contorller;

import com.bc.service.TbEventServices;
import com.bc.entity.Message;
import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class TbEventController {
    @Autowired
    private TbEventServices te;
    @RequestMapping("/selectEvent")
    @ResponseBody
    public List<Map> selectEvent(@RequestParam Map map){
        List list = te.selectEvent(Integer.parseInt(map.get("TbTaskId").toString()));
       /* System.out.print("=============="+list);*/
        return  list;
    };
    /*添加查询项*/
      @RequestMapping("/insertEventOne")
      @ResponseBody
      public Message insertEventOne(@RequestParam Map map){
          Message message = null;
          int a = te.insertEventOne(map);
          if(a>0){
              message = new Message(true,"操作成功");
          }else{
              message = new Message(false,"操作失败");
          }
          return  message;
       }
       /*根据id查询考核任务项*/
    @RequestMapping("/selectTbEventId")
    @ResponseBody
    public Map selectTbEventId(@RequestParam Map map){
        System.out.println("id为"+Integer.parseInt(map.get("tbEventId").toString()));
        Map map1 =  te.selectTbEventId(Integer.parseInt(map.get("tbEventId").toString()));
        /*System.out.println("++++++++++++++++++++"+map1);*/
        return map1;
    }
    /*修改考核任务项*/
    @RequestMapping("/UpdateEvent")
    @ResponseBody
    public Message UpdateEvent(@RequestParam Map map){
        int a = te.UpdateEvent(map);
        Message mes = null;
        if(a>0){
            mes=new Message(true, "修改成功");
        }else{
            mes=new Message(false, "修改失败");
        }
        return mes;
    }
    /*删除修改状态*/
    @RequestMapping("/DeleteEvent")
    @ResponseBody
    public Message DeleteEvent(@RequestParam Map map){
        Message message = null;
        int a = te.DeleteEvent(Integer.parseInt(map.get("tdEventId").toString()));
        if(a>0){
            message = new Message(true,"确定要删除吗？");
        }else{
            message = new Message(false,"操作失败");
        }
        return  message;
    }
}
