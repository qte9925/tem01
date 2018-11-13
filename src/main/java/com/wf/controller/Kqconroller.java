package com.wf.controller;

import com.wf.service.Kq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.apache.solr.client.solrj.impl.XMLResponseParser.log;

@Controller
public class Kqconroller {
    @Autowired
    private Kq se;


    @RequestMapping("/selectwf_kqtj")
    @ResponseBody
    public List<Map> selectwf_kqtj(@RequestParam Map map) {
        return se.selectwf_kqtj(map);
    }
    @RequestMapping("/selectwf_qiandao")
    @ResponseBody
    public List<Map> selectwf_qiandao(@RequestParam Map map) {
        return se.selectwf_qiandao(map);
    }
    @RequestMapping("/cxqj03")
    @ResponseBody
    public List<Map> cxqj03(@RequestParam Map map) {
        return se.cxqj03(map);
    }
    @RequestMapping("/qjxqupdate")
    @ResponseBody
    public int qjxqupdate(@RequestParam Map map) {
        return se.qjxqupdate(map);
    }
    @RequestMapping("/cxqj02")
    @ResponseBody
    public List<Map> cxqj02(@RequestParam Map map) {
        return se.cxqj02(map);
    }
    @RequestMapping(value = "/InputExcel.do")
    @ResponseBody
    public String InputExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
        String flag = "02";// 上传标志
        if (!file.isEmpty()) {
            try {
                String originalFilename = file.getOriginalFilename();// 原文件名字
                log.info("文件名：" + originalFilename);
                InputStream is = file.getInputStream();// 获取输入流
                flag = se.InputExcel(is, originalFilename);
            } catch (Exception e) {
                flag = "03";// 上传出错
                e.printStackTrace();
            }
        }
        return flag;
    }

//    @RequestMapping(value = "/OutputExcel.do", produces = "application/form-data; charset=utf-8")
//    @ResponseBody
//    public String OutputExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html,charset=utf-8");
//
//        List<EmpT> list = excelService.OutputExcel();
//
//        String message = OutputExcel.OutExcel(request, response, list);
//        if (message.equals("fail")) {
//            ServletOutputStream out = response.getOutputStream();
//            message = "导出失败，请重试";
//            String s = "<!DOCTYPE HTML><html><head><script>alert('" + message + "');</script></head><body></body></html>";
//            out.print(s);
//        }
//        return null;
//    }


    @RequestMapping("/chuchaiinsert")
    @ResponseBody
    public int chuchaiinsert(@RequestParam Map map) {
        return se.chuchaiinsert(map);
    }
    @RequestMapping("/cxqbcc")
    @ResponseBody
    public List cxqbcc(@RequestParam Map map) {
        return se.cxqbcc(map);
    }
    @RequestMapping("/qjspxq")
    @ResponseBody
    public List qjspxq(@RequestParam Map map) {
        return se.qjspxq(map);
    }
    @RequestMapping("/qdinsert")
    @ResponseBody
    public int qdinsert(@RequestParam Map map) {
        return se.qdinsert(map);
    }
    @RequestMapping("/cxsxb02")
    @ResponseBody
    public List cxsxb02(@RequestParam Map map) {
        return se.cxsxb02(map);
    }
    @RequestMapping("/ygbrqd")
    @ResponseBody
    public List ygbrqd(@RequestParam Map map) {
        return se.ygbrqd(map);
    }

    @RequestMapping("/updateqj")
    @ResponseBody
    public int updateqj(@RequestParam Map map) {
        return se.updateqj(map);
    }
    @RequestMapping("/cxqinjiq02")
    @ResponseBody
    public List cxqinjiq02(@RequestParam Map map) {
        return se.cxqinjiq02(map);
    }
    @RequestMapping("/cxqinjiq")
    @ResponseBody
    public List cxqinjiq(@RequestParam Map map) {
        return se.cxqinjiq(map);
    }
    @RequestMapping("/qingjiainsert")
    @ResponseBody
    public int qingjiainsert(@RequestParam Map map) {
        return se.qingjiainsert(map);
    }

    @RequestMapping("/qjlxselect")
    @ResponseBody
    public List qjlxselect(@RequestParam Map map) {
        return se.qjlxselect(map);
    }
    @RequestMapping("/gzrl")
    @ResponseBody
    public List gzrl(@RequestParam Map map) {
        List list ;
        if(map==null){
            Date d = new Date();
            int month = d.getMonth();
            String cc = "2018"+month;
            map.put("id",cc);
            list = se.gzrl(map);
        }else{
//            System.out.println(map);
            Map map02 = new HashMap();
            map02.put("id","2018"+map.get("id"));
            list = se.gzrl(map02);
        }
        return list;
    }
}
