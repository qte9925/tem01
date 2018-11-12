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

    @RequestMapping("/updatewf_tdjl01")
    @ResponseBody
    public int updatewf_tdjl01(@RequestParam Map map) {
        return se.updatewf_tdjl01(map);
    }

    @RequestMapping("/cxtdjl003")
    @ResponseBody
    public List<Map> cxtdjl003(@RequestParam Map map) {
        return se.cxtdjl003(map);
    }

    @RequestMapping("/countwf_ms")
    @ResponseBody
    public List<Map> countwf_ms(@RequestParam Map map) {
        return se.countwf_ms(map);
    }
    @RequestMapping("/insert_wf_ms")
    @ResponseBody
    public int insert_wf_ms(@RequestParam Map map) {
        return se.insert_wf_ms(map);
    }
    @RequestMapping("/zxiugai0041")
    @ResponseBody
    public int zxiugai0041(@RequestParam Map map) {
        return se.zxiugai0041(map);
    }
    @RequestMapping("/cxtdjl002")
    @ResponseBody
    public List<Map> cxtdjl002(@RequestParam Map map) {
        return se.cxtdjl002(map);
    }
    @RequestMapping("/zpsqbcx03")
    @ResponseBody
    public List<Map> zpsqbcx03(@RequestParam Map map) {
        return se.zpsqbcx03(map);
    }
    @RequestMapping("/cxtdjl001")
    @ResponseBody
    public List<Map> cxtdjl001(@RequestParam Map map) {
        return se.cxtdjl001(map);
    }
    @RequestMapping("/insert_wf_tdjl")
    @ResponseBody
    public int insert_wf_tdjl(@RequestParam Map map) {
        return se.insert_wf_tdjl(map);
    }
    @RequestMapping("/insert_wf_jianli")
    @ResponseBody
    public int insert_wf_jianli(@RequestParam Map map) {
        return se.insert_wf_jianli(map);
    }
    @RequestMapping("/xxcx02")
    @ResponseBody
    public List<Map> xxcx02(@RequestParam Map map) {
        return se.xxcx02(map);
    }
    @RequestMapping("/zpsqbcx02")
    @ResponseBody
    public List<Map> zpsqbcx02(@RequestParam Map map) {
        System.out.println(map);
        return se.zpsqbcx02(map);
    }
    //查询该前台用户是否注册了个人简历
    @RequestMapping("/xxcx")
    @ResponseBody
    public int xxcx(@RequestParam Map map) {
        return se.xxcx(map);
    }
    //招聘前台注册
    @RequestMapping("/insert_wf_qtyh")
    @ResponseBody
    public int insert_wf_qtyh(@RequestParam Map map) {
        return se.insert_wf_qtyh(map);
    }
    //前台招聘登录
    @RequestMapping("/qtyh")
    @ResponseBody
    public int qtyh(@RequestParam Map map,HttpSession session){
        List list = se.qtyh(map);
        if (list!=null){
            if (list.size()>0){
                session.setMaxInactiveInterval(30*60);
                session.setAttribute("list", list);
                return  0;
            }else{
                return  1;
            }
        }
        return 1;
    }
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