package com.lx.contorller;

import com.lx.service.TregService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class Tregcontorller {
    @Autowired
    private TregService ts;
    @RequestMapping("tselect")
    @ResponseBody
    public List tselect(@RequestParam Map map){
        List list =ts.tselect(map);
        return list;
    }
    @RequestMapping("tselect01")
    @ResponseBody
    public List tselect01(@RequestParam Map map){
        List list =ts.tselect01(map);
        return list;
    }
    @RequestMapping("tupdate")
    @ResponseBody
    public int tupdate(@RequestParam Map map){
        int i = ts.tupdate(map);
        return i;
    }
    @RequestMapping("tdelete")
    @ResponseBody
    public int tdelete(@RequestParam Map map){
        int i=ts.tdelete(map);
        return i;
    }
    @RequestMapping("tinsert")
    @ResponseBody
    public int tinsert(@RequestParam Map map){
        int i=ts.tinsert(map);
        return i;
    }
}
