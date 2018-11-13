package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.Message;
import com.yzj.entity.PageEntity;
import com.yzj.service.ShenpiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class ShenpiController {
    @Autowired
    private ShenpiService sp;
    @RequestMapping("shenpirendechaxun")
    @ResponseBody
    public PageInfo<Map> selectshenpiren(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = sp.selectdaishenpiplan(page,map);
        return pageinfo;
    }
    @RequestMapping("updatestatu")
    @ResponseBody
    public int xiugaizhuantai(@RequestParam Map map){
        System.out.print(map+"----------------------------------------------");
        return sp.updateshenpiplanyzj(map);
    }
   /* @RequestMapping("updatexinxi")
    @ResponseBody
    public int updatebohuixinxi(@RequestParam Map map){
        System.out.print(map);
        return sp.updatexinxiplan(map);
    }*/
    /*报名*/
    @RequestMapping("AddBaomingYzj01")
    @ResponseBody
    public Message AddBaoming(@RequestParam Map map){
        Message message=null;
        int i = sp.AddBaomingyzj(map);
        if(i>0){
            message = new Message(true,"报名成功");
        }else{
            message = new Message(false,"报名失败");
        }
        return message;
    }
    /*已经报名人数*/
    @RequestMapping("selectyijingbaoming")
    @ResponseBody
    public List tongjishuren(@RequestParam Map map){
       List<Map> list = sp.selectyibaoming(map);
        return list;
    }
}
