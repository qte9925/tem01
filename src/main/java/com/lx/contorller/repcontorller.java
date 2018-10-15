package com.lx.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.lx.service.repService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class repcontorller {
    @Autowired
    private repService rs;
    @RequestMapping("repselect")
    @ResponseBody
    public List repselect(@RequestParam  Map map){
        List list =rs.selectrep(map);
        return list;
    }
}
