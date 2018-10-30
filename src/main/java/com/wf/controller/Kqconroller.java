package com.wf.controller;

import com.wf.service.Kq;
import com.wf.service.Se;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Kqconroller {
    @Autowired
    private Kq se;

    @RequestMapping("/qdinsert")
    @ResponseBody
    public int qdinsert(@RequestParam Map map) {
        System.out.println(map);
        return se.qdinsert(map);
    }
    @RequestMapping("/cxsxb02")
    @ResponseBody
    public List cxsxb02(@RequestParam Map map) {
        return se.cxsxb02(map);
    }
    @RequestMapping("/ygbrqd")
    @ResponseBody
    public List ygbrqd(@RequestParam Map map) {
        return se.ygbrqd(map);
    }

    @RequestMapping("/updateqj")
    @ResponseBody
    public int updateqj(@RequestParam Map map) {
        return se.updateqj(map);
    }
    @RequestMapping("/cxqinjiq02")
    @ResponseBody
    public List cxqinjiq02(@RequestParam Map map) {
        return se.cxqinjiq02(map);
    }
    @RequestMapping("/cxqinjiq")
    @ResponseBody
    public List cxqinjiq(@RequestParam Map map) {
        return se.cxqinjiq(map);
    }
    @RequestMapping("/qingjiainsert")
    @ResponseBody
    public int qingjiainsert(@RequestParam Map map) {
        return se.qingjiainsert(map);
    }

    @RequestMapping("/qjlxselect")
    @ResponseBody
    public List qjlxselect(@RequestParam Map map) {
        return se.qjlxselect(map);
    }
    @RequestMapping("/gzrl")
    @ResponseBody
    public List gzrl(@RequestParam Map map) {
        List list ;
        if(map==null){
            Date d = new Date();
            int month = d.getMonth();
            String cc = "2018"+month;
            map.put("id",cc);
            list = se.gzrl(map);
        }else{
//            System.out.println(map);
            Map map02 = new HashMap();
            map02.put("id","2018"+map.get("id"));
            list = se.gzrl(map02);
        }
        return list;
    }
}
