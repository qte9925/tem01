package com.jds.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.Mail;
import com.jds.entity.MailUtil;
import com.jds.entity.PageEntity;
import com.jds.service.BusinessService;
import com.jds.service.NoticeService;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BusinessController {
    @Autowired
    private BusinessService bs;
    @RequestMapping("selectGzx")
    @ResponseBody
    public List<Map> selectGz( @RequestParam Map map){
        List<Map> list=bs.selectGz(map);

        return list;

    }
    @RequestMapping("insertGz")
    @ResponseBody
    public int insertN(@RequestParam Map map, HttpServletRequest request){
        Map map01 = new HashMap();
        map01.put("gzyf", request.getParameter("gzyf"));
        List<Map> list01= bs.selectGz(map01);
       System.out.print(list01+"aaa");
        for (int i=0;i<list01.size();i++){
            map.put("ydid",list01.get(i).get("ygid"));
            map.put("xz",list01.get(i).get("xz"));
            map.put("xm",list01.get(i).get("xm"));
            map.put("jx",list01.get(i).get("jx"));
            map.put("yanglaobx",list01.get(i).get("yanglaobx"));
            map.put("shiyebx",list01.get(i).get("shiyebx"));
            map.put("yiliaobx",list01.get(i).get("yiliaobx"));
            map.put("sybx",list01.get(i).get("sybx"));
            map.put("gsbx",list01.get(i).get("gsbx"));
            map.put("zfgjj",list01.get(i).get("zfgjj"));
            map.put("cd",list01.get(i).get("cd"));
            map.put("shijia",list01.get(i).get("shijia"));
            map.put("bingjia",list01.get(i).get("bingjia"));
            map.put("zt",list01.get(i).get("zt"));
            map.put("kg",list01.get(i).get("kg"));
            map.put("zz",list01.get(i).get("sx"));
            map.put("jiaban",list01.get(i).get("jiaban"));
            DecimalFormat df4 = new DecimalFormat("###.###");
            String aa;
             aa=df4.format(list01.get(i).get("sjgz"));
             int aa1=Integer.parseInt(aa.toString());
            System.out.print(aa1+"aaa");
            int bb=aa1-5000;
            double bb1;
            if(bb<0){
                bb1=0;
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);

            }else if(3000>=bb){
                bb1= (int)  (bb*0.03-0);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);

            }else if(12000>=bb){
                bb1= (int) (bb*0.1-210);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);
            }else if(25000>=bb){
                bb1= (int) (bb*0.2-1410);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);
            }else if(35000>=bb){
                bb1= (int) (bb*0.25-2660);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);
            }else if(55000>=bb){
                bb1= (int) (bb*0.3-4410);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);
            }else if(80000>=bb){
                bb1= (int) (bb*0.35-7160);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);
            }else{
                bb1= (int) (bb*0.4-15160);
                map.put("js",bb1);
                map.put("sjgz",aa1-bb1);
            }

            bs.insertGz(map);
            /*ydid,xz,jxjin,yanglaobx,shiyebx,yiliaobx,sybx,gsbx,zfgjj,cd,qj,zt,kg,sjgz,state,bz,bz1*/
        }
        return 0;
    }
    @RequestMapping("insertBf")
    @ResponseBody
    public int insertBf(@RequestParam Map map){
        int a=bs.insertBf(map);
        return a;
    }
    @RequestMapping("selectBf")
    @ResponseBody
    public PageInfo<Map> selectBf(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=bs.selectBf(map,page);
        return pageInfo;

    }
    @RequestMapping("selectGza")
    @ResponseBody
    public List<Map> selectGza( @RequestParam Map map){
        List<Map> list=bs.selectGza(map);

        return list;

    }
    @RequestMapping("selectGzId")
    @ResponseBody
    public Map selectGzId( @RequestParam Integer id){
        Map map=bs.selectGzId(id);
        return map;

    }
    @RequestMapping("updateGz")
    @ResponseBody
    public int updateGz(@RequestParam Map map){
        int a=bs.updateGz(map);
        System.out.print(a);
        System.out.print(map.size());
        System.out.print(map.get("cd1"));
        System.out.print(map.get("id"));
        return a;
    }
    @RequestMapping("updateGza")
    @ResponseBody
    public int updateGza(@RequestParam Map map,HttpServletRequest request){
        for (int i=0;i<map.size();i++){
            map.put("lcid",request.getParameter("lcid"));
            map.put("bz",request.getParameter("bz"));
            bs.updateGza(map);
            System.out.print(map);
        }
        return 0;
    }
    @RequestMapping("updateGzb")
    @ResponseBody
    public int updateGzb(@RequestParam Map map){
        int a=bs.updateGzb(map);
        return a;
    }
    @RequestMapping("selectYj")
    @ResponseBody
    public List<Map> selectYj( @RequestParam Map map){
        List<Map> list=bs.selectYj(map);
        for (int i=0;i<list.size();i++){
        Mail mail = new Mail();
        mail.setHost("smtp.qq.com"); // 设置邮件服务器,如果不用163的,自己找找看相关的
        mail.setSender("1047540375@qq.com");
        mail.setReceiver((String) list.get(i).get("email")); // 接收人
        mail.setUsername("1047540375@qq.com"); // 登录账号,一般都是和邮箱名一样吧
        mail.setPassword("ljongupqynxwbeee"); // 发件人邮箱的登录密码  此密码必须是你在邮箱设置打开pop3和SMTP之后设置的密码，否则收不到邮件的
        mail.setSubject("工资单");
        mail.setMessage(
                                "姓名"+"  "+(String) list.get(i).get("xm")+"  "+
                                "基本工资"+"  "+ list.get(i).get("xz")+"  "+
                                "绩效工资"+"  "+ list.get(i).get("jx")+"  "+
                                "养老保险"+"  "+ list.get(i).get("yanglaobx")+"  "+
                                "失业保险"+"  "+ list.get(i).get("shiyebx")+"  "+
                                "医疗保险"+"  "+ list.get(i).get("yiliaobx")+"  "+
                                "生育保险"+"  "+ list.get(i).get("sybx")+"  "+
                                "工伤保险"+"  "+ list.get(i).get("gsbx")+"  "+
                                "住房公积金"+"  "+ list.get(i).get("zfgjj")+"  "+
                                "迟到"+"  "+ list.get(i).get("cd")+"  "+
                                "事假"+"  "+ list.get(i).get("shijia")+"  "+
                                "病假"+"  "+ list.get(i).get("bingjia")+"  "+
                                "早退"+"  "+ list.get(i).get("zt")+"  "+
                                "旷工"+"  "+ list.get(i).get("kg")+"  "+
                                "缴税"+"  "+ list.get(i).get("js")+"  "+
                                "实际工资"+"  "+ list.get(i).get("sjgz")
                                /*"姓名"+"  "+(String) list.get(i).get("xm")+
                                "姓名"+"  "+(String) list.get(i).get("xm")+
                                "姓名"+"  "+(String) list.get(i).get("xm")+
                                "姓名"+"  "+(String) list.get(i).get("xm")+
                                "姓名"+"  "+(String) list.get(i).get("xm")+
                                "姓名"+"  "+(String) list.get(i).get("xm")*/



        );
        new MailUtil().send(mail);

        }
        return list;

    }
    @RequestMapping("updateGzc")
    @ResponseBody
    public int updateGzc(@RequestParam Map map){
        int a=bs.updateGzc(map);
        return a;
    }
    @RequestMapping("selectZc")
    @ResponseBody
    public PageInfo<Map> selectZc(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=bs.selectZc(map,page);
        return pageInfo;

    }
    @RequestMapping("updateZc")
    @ResponseBody
    public int updateZc(@RequestParam Map map){
        int a=bs.updateZc(map);
        return a;
    }
    @RequestMapping("selectZc1")
    @ResponseBody
    public PageInfo<Map> selectZc1(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=bs.selectZc1(map,page);
        return pageInfo;

    }

}
