package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import com.yzj.service.DepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class DepController {
@Autowired
        private DepService ds ;

    @RequestMapping("xiugaixuqiuxinxib")
    @ResponseBody
    public int xiugaixuqiuxinxi(@RequestParam Map map){
        System.out.print(map);
        return ds.xiugaixuqiuxinxib(map);
    }
    @RequestMapping("selectDepartment")
    @ResponseBody
    public PageInfo<Map> selectNeedPeople(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = ds.selectDep(page,map);
        System.out.print(map);
        return pageinfo;
    }
    @RequestMapping("deleteDepartment")
    @ResponseBody
    public int deleteNeedPeople(@RequestParam Map map){
        int i = ds.deleteDep(map);
        return i;
    }
    @RequestMapping("selectByIdDepartment")
    @ResponseBody
    public List selectByIdPeople(@RequestParam Map map){
        List list = ds.selectByIdDep(map);
        System.out.print(list+"aaaaaaaaaaa");
        return list;
    }
    @RequestMapping("updateDepartment")
    @ResponseBody
    public int updateNeedPeople(@RequestParam Map map){
        int i = ds.updateDep(map);
        return i;
    }
    @RequestMapping("AddDepartmentYZJ")
    @ResponseBody
    public int AddDepartmentNeed(@RequestParam Map map){
        int i = ds.addDep(map);
        return i;
    }
    @RequestMapping("FindDepartmentYzj")
    @ResponseBody
    public List Finddepartment(@RequestParam Map map){
        List  list  = ds.departmentFindTypeDep(map);
        return list;
    }
}

