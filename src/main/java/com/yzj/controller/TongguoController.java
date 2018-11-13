package com.yzj.controller;

import com.bc.entity.Message;
import com.yzj.service.TongguoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class TongguoController {
    @Autowired
    private TongguoService tgS;
    @RequestMapping("tongguo")
    @ResponseBody
    public List KaoheTongguo(@RequestParam Map map){
        List<Map> list=tgS.TongGuo(map);
        return list;
    }
    @RequestMapping("addnewbaoming")
    @ResponseBody
    public Message addnewbaoming(@RequestParam Map map){
        Message message=null;
        int a=tgS.addnewbaoming(map);
        if(a>0){
            message = new Message(true,"操作成功");
        }else{
            message = new Message(false,"操作失败");
        }
        return message;
    }
}
