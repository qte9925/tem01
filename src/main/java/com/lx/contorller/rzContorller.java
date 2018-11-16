package com.lx.contorller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
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

    @RequestMapping("rymssqselect011")
    @ResponseBody
    public List rymssqselect011(@RequestParam Map map){
        return rs.rymssqselect011(map);
    }
    @RequestMapping("rzselect")
    @ResponseBody
    public List rzselect(@RequestParam Map map){
        return rs.rzselect(map);
    }

    @RequestMapping("rymssqinccc")
    @ResponseBody
    public int rymssqinccc(@RequestParam Map map){
        return rs.rymssqinccc(map);
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
    /*public List rymssqselect2(Map map){
        return rs.rymssqselect2(map);
    }*/
    public PageInfo<Map> rymssqselect2(PageEntity page, Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=rs.rymssqselect2(map,page);
        return pageInfo;
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
