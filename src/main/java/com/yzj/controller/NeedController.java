package com.yzj.controller;

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
    @RequestMapping("select")
    @ResponseBody
    public List selectNeedPeople(@RequestParam Map map){
    List list = ss.selectNeed(map);
    return list;
    }
    @RequestMapping("delete")
    @ResponseBody
    public int deleteNeedPeople(@RequestParam Map map){
        int i = ss.deleteNeed(map);
        return i;
    }
    @RequestMapping("selectById")
    @ResponseBody
    public List selectByIdPeople(@RequestParam Map map){
        List list = ss.selectById(map);
        return list;
    }
    @RequestMapping("update")
    @ResponseBody
    public int updateNeedPeople(@RequestParam Map map){
        int i = ss.updateNeed(map);
        return i;
    }
    @RequestMapping("Add")
    @ResponseBody
    public int AddNeedPeople(@RequestParam Map map){
     int i = ss.addNeed(map);
        return i;
    }
    @RequestMapping("FindDepartment")
    @ResponseBody
    public List Finddepartment(@RequestParam Map map){
       List  list  = ss.departmentFindType(map);
        return list;
    }
}
