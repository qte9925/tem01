package com.yzj.controller;

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
@RequestMapping("select")
@ResponseBody
    public List<Map> select(@RequestParam Map map){
    List list = ds.selectdepNeed(map);
    return list;
}
}
