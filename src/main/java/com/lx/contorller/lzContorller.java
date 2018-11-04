package com.lx.contorller;

import com.lx.service.lzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class lzContorller {
    @Autowired
    private lzService ls;
    @RequestMapping("lzinsetes")
    @ResponseBody
    public int lzinsetes(@RequestParam Map map){
        return ls.lzinsetes(map);
    }
    @RequestMapping("lzselect")
    @ResponseBody
    public List lzselect(@RequestParam Map map){
        return ls.lzselect(map);
    }
    @RequestMapping("lzdjselect")
    @ResponseBody
    public List lzdjselect(Map map){
        return ls.lzdjselect(map);
    }
    @RequestMapping("lzdjupdate")
    @ResponseBody
    public int lzdjupdate(@RequestParam Map map){
        return ls.lzdjupdate(map);
    }
}
