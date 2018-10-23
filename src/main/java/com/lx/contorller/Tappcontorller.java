package com.lx.contorller;

import com.lx.service.TaoolyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class Tappcontorller {
    @Autowired
    private TaoolyService ts;
    @RequestMapping("tappSelect")
    @ResponseBody
    public List tappSelect(@RequestParam Map map){
        List list=ts.tappSelect(map);
        return list;
    }
    @RequestMapping("tappinsert")
    @ResponseBody
    public int tappinsert(@RequestParam Map map){
        int i=ts.tappinsert(map);
        return i;
    }
}
