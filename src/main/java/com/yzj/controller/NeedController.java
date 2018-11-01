package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import com.yzj.service.NeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class NeedController {
    @Autowired
    private NeedService ss;
    @RequestMapping("xiugaixuqiuxinxia")
    @ResponseBody
    public int xiugaixuqiuxinxi(@RequestParam Map map){
        System.out.print(map);
        return ss.xiugaixuqiuxinxia(map);
    }
    @RequestMapping("selectaa")
    @ResponseBody
    public PageInfo<Map> selectNeedPeople(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = ss.selectNeed(page,map);
        System.out.print(map);
        return pageinfo;
    }
    @RequestMapping("deleteaa")
    @ResponseBody
    public int deleteNeedPeople(@RequestParam Map map){
        int i = ss.deleteNeed(map);
        return i;
    }
    @RequestMapping("selectByIdaa")
    @ResponseBody
    public List selectByIdPeople(@RequestParam Map map){
        List list = ss.selectById(map);
        System.out.print(list+"aaaaaaaaaaa");
        return list;
    }
    @RequestMapping("updateaa")
    @ResponseBody
    public int updateNeedPeople(@RequestParam Map map){
        int i = ss.updateNeed(map);
        return i;
    }
    @RequestMapping("Addaa")
    @ResponseBody
    public int AddNeedPeople(@RequestParam Map map){
     int i = ss.addNeed(map);
        return i;
    }
    @RequestMapping("FindDepartmentaa")
    @ResponseBody
    public List Finddepartment(@RequestParam Map map){
       List  list  = ss.departmentFindType(map);
        return list;
    }
}
