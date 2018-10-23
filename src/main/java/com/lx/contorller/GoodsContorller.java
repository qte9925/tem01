package com.lx.contorller;

import com.lx.service.GoodsSersert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class GoodsContorller {
    @Autowired
    private GoodsSersert gs;
    @RequestMapping("gselect")
    @ResponseBody
    public List gselect(@RequestParam Map map){
        List list =gs.gselect(map);
        return list;
    }
    @RequestMapping("gselect01")
    @ResponseBody
    public List gselect01(@RequestParam Map map){
        List list =gs.gselect01(map);
        return list;
    }
    @RequestMapping("gupdate")
    @ResponseBody
    public int gupdate(@RequestParam Map map){
        int i=gs.gupdate(map);
        return i;
    }
    @RequestMapping("gdelect")
    @ResponseBody
    public int gdelect(@RequestParam Map map){
        int i=gs.gdelete(map);
        return i;
    }
    @RequestMapping("ginsert")
    @ResponseBody
    public int ginsert(@RequestParam Map map){
        int i=gs.ginsert(map);
        return i;
    }
}
