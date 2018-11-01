package com.fzl.contorller;

import com.fzl.service.ResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
;


@Controller
public class ResContorller {
    @Autowired
  private ResService rss;
   /* @RequestMapping("select")
    @ResponseBody
    public List select(@RequestParam Map map){
        List list = rss.select(map);
        return list;
    }
    @RequestMapping("select01")
    @ResponseBody
    public List select01(@RequestParam Map map){
        List list = rss.select01(map);
        return  list;
    }
    @RequestMapping("update")
    @ResponseBody
    public int update(@RequestParam Map map){
        int i = rss.update(map);
        return i;
    }*/

}
