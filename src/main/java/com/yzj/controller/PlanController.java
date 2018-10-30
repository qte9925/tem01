package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import com.yzj.service.DepService;
import com.yzj.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class PlanController {
@Autowired
        private PlanService ps;
    @RequestMapping("xiugaixuqiuxinxic")
    @ResponseBody
    public int xiugaixuqiuxinxiplan(@RequestParam Map map){
        System.out.print(map);
        return ps.xiugaixuqiuxinxic(map);
    }
    @RequestMapping("selectPlan")
    @ResponseBody
    public PageInfo<Map> selectNeedPeople(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = ps.selectPlan(page,map);
        System.out.print(map);
        return pageinfo;
    }
    @RequestMapping("deletePlan")
    @ResponseBody
    public int deleteNeedPeople(@RequestParam Map map){
        int i = ps.deletePlan(map);
        return i;
    }
    @RequestMapping("selectByIdPlan")
    @ResponseBody
    public List selectByIdPeople(@RequestParam Map map){
        List list = ps.selectByIdPlan(map);
        System.out.print(list+"aaaaaaaaaaa");
        return list;
    }
    @RequestMapping("updatePlan")
    @ResponseBody
    public int updateNeedPeople(@RequestParam Map map){
        int i = ps.updatePlana(map);
        return i;
    }
    @RequestMapping("AddPlan")
    @ResponseBody
    public int AddDepartmentNeed(@RequestParam Map map){
        int i = ps.addPlan(map);
        return i;
    }
    @RequestMapping("Findshenpiren")
    @ResponseBody
    public List shenpirenFindType(@RequestParam Map map){
        List  list  = ps.shenpirenFindType(map);
        return list;
    }
    @RequestMapping("Findqvdao")
    @ResponseBody
    public List Findqvdaotype(@RequestParam Map map){
        List  list  = ps.qvdaoFindType(map);
        return list;
    }
    @RequestMapping("FindXingshi")
    @ResponseBody
    public List FindxingshiType(@RequestParam Map map){
        List  list  = ps.XingshiFindType(map);
        return list;
    }
    @RequestMapping("FindDepartmentTypePlan")
    @ResponseBody
    public List FindDepartmentType(@RequestParam Map map){
        List  list  = ps.departmentFindTypePlan(map);
        return list;
    }
}

