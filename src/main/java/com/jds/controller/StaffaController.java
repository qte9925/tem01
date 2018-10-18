package com.jds.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.jds.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import java.util.Map;

@Controller
public class StaffaController {
    @Autowired
    private StaffService ss;
    @RequestMapping("selectM")
    @ResponseBody
    public PageInfo<Map> selectM(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ss.selectM(map,page);
        return pageInfo;

    }
    @RequestMapping("insertM")
    @ResponseBody
    public int insertM(@RequestParam Map map){
    int a=ss.insertM(map);
    System.out.print("查询");
        return a;
    }
    @RequestMapping("selectMByid")
    @ResponseBody
    public Map selectMByid(@RequestParam Integer id){
        Map map=ss.selectMByid(id);
        System.out.print("根据id查询");
        return map;
    }
    @RequestMapping("updateM")
    @ResponseBody
    public int updateM(@RequestParam Map map){
      int  a=ss.updateM(map);
        System.out.print("修改");
        return a;
    }
    @RequestMapping("deleteM")
    @ResponseBody
    public int deleteM(@RequestParam Integer id){
        int  a=ss.deleteM(id);
        System.out.print("删除");
        return a;
    }
}
