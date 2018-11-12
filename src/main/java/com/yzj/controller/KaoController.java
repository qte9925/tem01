package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import com.yzj.service.KaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class KaoController {
    @Autowired
    private KaoService ks;
    @RequestMapping("selectKaoHeYzj")
    @ResponseBody
    public PageInfo<Map> selectKao(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = ks.selectkaoheyzj(page,map);
        System.out.print(map);
        return pageinfo;
    }
    @RequestMapping("deleteKaoHeYzj")
    @ResponseBody
    public int deleteKao(@RequestParam Map map){
        int i = ks.deletekaoheyzj(map);
        System.out.print("sdpifjodshfgduhgkdfhu");
        return i;
    }
    @RequestMapping("selectByIdKaoHeYzj")
    @ResponseBody
    public List selectByIKaoHe(@RequestParam Map map){
        List list = ks.selectkaoheByIdyzj(map);
        System.out.print(list+"aaaaaaaaaaa");
        return list;
    }
    @RequestMapping("updateKaoHeYzj")
    @ResponseBody
    public int updateKaoHe(@RequestParam Map map){
        int i = ks.updatekaoheyzj(map);
        return i;
    }
    @RequestMapping("AddKaoHeYZJ")
    @ResponseBody
    public int AddKaoHe(@RequestParam Map map){
        int i = ks.addkaoheyzj(map);
        return i;
    }
    @RequestMapping("FindKaoHerenType")
    @ResponseBody
    public List FindType(@RequestParam Map map){
        List list   = ks.FindKaoHerenType(map);
        return list;
    }
}
