package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import com.yzj.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class TeacherController {
    @Autowired
    private TeaService ts;
    /*分页查询*/
    @RequestMapping("selectYzjTeachera")
    @ResponseBody
    public PageInfo<Map> selectTeacherYzj(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = ts.selectYzjTeacher(page,map);
        System.out.print(map);
        return pageinfo;
    }
    /*删除*/
    @RequestMapping("deleteYzjTeachera")
    @ResponseBody
    public int deleteTeacherYzj(@RequestParam Map map){
        int i = ts.deleteYzjTeacher(map);
        return i;
    }
    /*添加*/
    @RequestMapping("addYzjTeachera")
    @ResponseBody
    public int addTeacherYzj(@RequestParam Map map){
        int i = ts.addYzjTeacher(map);
        return i;
    }
    /*修改前查询*/
    @RequestMapping("selectByIdYzjTeachera")
    @ResponseBody
    public List selectByIdTeacherYzj(@RequestParam Map map){
       List list = ts.SelectByIdYzjTeacher(map);
        return list;
    }
    /*修改*/
    @RequestMapping("updateYzjTeachera")
    @ResponseBody
    public int updateTeacherYzj(@RequestParam Map map){
        int i = ts.updateYzjTeacher(map);
        return i;
    }
}
