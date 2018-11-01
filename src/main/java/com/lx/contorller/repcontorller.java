package com.lx.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.lx.service.repService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
@Controller
public class repcontorller {
    @Autowired
    private repService rs;
    @RequestMapping("repselect")
    @ResponseBody
    public List repselect(@RequestParam Map map){
        List list = rs.repselect(map);
        return list;
    }
    @RequestMapping("selectrep01")
    @ResponseBody
    public List selectrep01(@RequestParam Map map){
        List list =rs.selectrep01(map);
        return list;
    }
    @RequestMapping("updaterep")
    @ResponseBody
    public int updaterep(@RequestParam Map map){
        int i=rs.updaterep(map);
        return i;
    }
    @RequestMapping("insertrep")
    @ResponseBody
    public int insertrep(@RequestParam Map map){
        int i =rs.insertrep(map);
        System.out.print(11);
        return i;
    }
//    @RequestMapping("delete")
//    @ResponseBody
//    public int delete(@RequestParam Map map){
//        int i=rs.delete(map);
//        return i;
//    }
}
