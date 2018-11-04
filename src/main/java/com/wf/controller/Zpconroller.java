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