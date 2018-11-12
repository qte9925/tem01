package com.bc.contorller;

import com.bc.service.TbDeptServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
//部门
@Controller
public class TbDeptController {
    @Autowired
    private TbDeptServices tds;
    @RequestMapping("showTbDept")
    @ResponseBody
    public List showTbpost(@RequestParam Map map){
        return tds.showTbpost(map);
    }
}
