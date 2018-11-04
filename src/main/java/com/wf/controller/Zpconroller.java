package com.wf.controller;

import com.wf.service.Zp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class Zpconroller {
    @Autowired
    private Zp se;


    @RequestMapping("/gjidcx")
    @ResponseBody
    public List<Map> gjidcx(@RequestParam Map map) {
        System.out.println(map);
        return se.gjidcx(map);
    }
    @RequestMapping("/daishenkecx")
    @ResponseBody
    public List<Map> daishenkecx(@RequestParam Map map) {
        System.out.println(map);
        return se.daishenkecx(map);
    }
    @RequestMapping("/zpsxiugai")
    @ResponseBody
    public int zpsxiugai(@RequestParam Map map) {
        System.out.println(map);
        return se.zpsxiugai(map);
    }
    @RequestMapping("/cxzjhs")
    @ResponseBody
    public List<Map> cxzjhs(@RequestParam Map map) {
        System.out.println(map);
        return se.cxzjhs(map);
    }
    @RequestMapping("/gwcx02")
    @ResponseBody
    public List<Map> gwcx02(@RequestParam Map map) {
        System.out.println(map);
        return se.gwcx02(map);
    }
    @RequestMapping("/zpbmxq02")
    @ResponseBody
    public List<Map> zpbmxq02(@RequestParam Map map) {
        System.out.println(map);
        return se.zpbmxq02(map);
    }
    @RequestMapping("/zpsinsert")
    @ResponseBody
    public int zpsinsert(@RequestParam Map map) {
        System.out.println(map);
        return se.zpsinsert(map);
    }
    @RequestMapping("/bmhcx")
    @ResponseBody
    public List<Map> bmhcx(@RequestParam Map map) {
        System.out.println(map);
        return se.bmhcx(map);
    }
    @RequestMapping("/gwrs")
    @ResponseBody
    public List<Map> gwrs(@RequestParam Map map) {
        return se.gwrs(map);
    }

    @RequestMapping("/wys")
    @ResponseBody
    public List<Map> wys(@RequestParam Map map) {
        return se.wys(map);
    }
    @RequestMapping("/gwcx01")
    @ResponseBody
    public List<Map> gwcx01(@RequestParam Map map) {
        return se.gwcx01(map);
    }
    @RequestMapping("/zpcxgrbm")
    @ResponseBody
    public List<Map> zpcxgrbm(@RequestParam Map map) {
        System.out.println(map);
        return se.zpcxgrbm(map);
    }
    @RequestMapping("/zpbmxq")
    @ResponseBody
    public List<Map> zpbmxq(@RequestParam Map map) {
        return se.zpbmxq(map);
    }
    @RequestMapping("/zpcx02")
    @ResponseBody
    public List<Map> zpcx02(@RequestParam Map map) {
        return se.zpcx02(map);
    }

    @RequestMapping("/zpcx01")
    @ResponseBody
    public List<Map> zpcx01(@RequestParam Map map) {
        return se.zpcx01(map);
    }

    @RequestMapping("/zpjhinsert")
    @ResponseBody
    public int zpjhinsert(@RequestParam Map map) {
        return se.zpjhinsert(map);
    }

    /*@RequestMapping("TbStaffLogin")
    @ResponseBody
    public Message TbStaffLogin(TbStaffLogin tbStaffLogin, HttpSession session){
        List list = Tb_SLS.TbStaffLogin(tbStaffLogin);
        if (list.size()>0) {
            session.setAttribute("list", list);
            message = new Message(true,"登陆成功");
        }else{
            message = new Message(false,"登陆失败");
        }
        System.out.println(session.getAttribute("list"));
        return message;
    }*/
}