package com.lx.contorller;

import com.lx.service.rzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
@Controller
public class rzContorller {
    @Autowired
    private rzService rs;
    @RequestMapping("rzselect")
    @ResponseBody
    public List rzselect(@RequestParam Map map){
        return rs.rzselect(map);
    }
    @RequestMapping("rzsq")
    @ResponseBody
    public int rzsq(@RequestParam Map map){
        return rs.rzsq(map);
    }
    @RequestMapping("rymssqselect")
    @ResponseBody
    public List rymssqselect(@RequestParam Map map){
        return rs.rymssqselect(map);
    }
    @RequestMapping("rymssqselect2")
    @ResponseBody
    public List rymssqselect2(Map map){
        return rs.rymssqselect2(map);
    }
    @RequestMapping("rzzx")
    @ResponseBody
    public int rzzx(@RequestParam Map map){
        return rs.rzzx(map);
    }
    @RequestMapping("rzzj")
    @ResponseBody
    public int rzzj(@RequestParam Map map){
        return rs.rzzj(map);
    }
}
