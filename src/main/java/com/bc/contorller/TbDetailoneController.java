package com.bc.contorller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.bc.entity.TbDetailone;
import com.bc.service.TbDetailoneServices;
import com.bc.entity.Message;
import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

//考核项详情
@Controller
public class TbDetailoneController {
    @Autowired
    private TbDetailoneServices tb;
    @RequestMapping("/selectTbDetailone")
    @ResponseBody
    public PageInfo selectTbDetailone(@RequestParam Map map){
        PageHelper.startPage(Integer.parseInt(map.get("pageNow").toString()), 5);
        List list = tb.selectTbDetailone(map);
        PageInfo pageInfo = new PageInfo<TbDetailone>(list);
        return  pageInfo;
    }
    /*查询绩效名称*/
    @RequestMapping("/selectTaskName")
    @ResponseBody
    public List selectTaskName(){
        List list = tb.selectTaskName();
        return list;
    }
    /*查询考核项目名称*/
    @RequestMapping("/selectEventName")
    @ResponseBody
    public List selectEventName(){
        List list = tb.selectEventName();
        return list;
    }
    //添加
    //
    @RequestMapping("/insertresultAndrecorddetails")
    @ResponseBody
    public Message insertresultAndrecorddetails(@RequestParam Map map){
        Message message = null;
        int result = tb.insertresultAndrecorddetails(map);
        if(result>0){
            message = new Message(true,"操作成功");
        }else{
            message = new Message(false,"操作失败");
        }
        return  message;
    }
    /*根据id查询考核任务项*/
    @RequestMapping("/SelectDetailoneBiId")
    @ResponseBody
    public Map SelectDetailoneBiId(@RequestParam Map map){
        System.out.println("id为"+Integer.parseInt(map.get("tbDetailoneId").toString()));
        Map map1 =  tb.SelectDetailoneBiId(Integer.parseInt(map.get("tbDetailoneId").toString()));
        System.out.println("++++++++++++++++++++"+map1);
        return map1;
    }
    /*
     *修改
     **/
    @RequestMapping("/UpdateDetailone")
    @ResponseBody
    public Message UpdateDetailone(@RequestParam Map map){
        int a = tb.UpdateDetailone(map);
        Message mes = null;
        if(a>0){
            mes=new Message(true, "修改成功");
        }else{
            mes=new Message(false, "修改失败");
        }
        return mes;
    }
    //删除修改状态
    @RequestMapping("/Detailoneid")
    @ResponseBody
    public Message Detailoneid(@RequestParam Map map){
        int a = tb.Detailoneid(Integer.parseInt(map.get("TbTaskId").toString()));
        Message message=null;
        if(a>0){
            message = new Message(true,"操作成功!");
        }else{
            message = new Message(false,"操作失败");
        }
        return message ;
    }
    /*小名*/
    //查询自评
    @RequestMapping("/SelectTbTetailone")
    @ResponseBody
    public List SelectTbTetailoneno(@RequestParam Map map){
        List list = tb.SelectTbTetailoneno(map);
        return list;
    }

    //添加所有（考核项）
    @RequestMapping("/InsertTbOneRecorddetails")
    @ResponseBody
    public Message InsertTbOneRecorddetails(@RequestBody List<Map> list){
        int result=tb.InsertTbOneRecorddetails(list);
        Message me = null;
        if(result>0){
            return new Message(true,"添加成功");
        }else{
            return new Message(false,"添加失败");
        }
    }
    //添加所有评价结果
    @RequestMapping("/InsertTbAchresult")
    @ResponseBody
    public Message InsertTbAchresult(@RequestParam Map map){
        int result=tb.InsertTbAchresult(map);
        Message me = null;
        if(result>0){
            return new Message(true,"添加成功");
        }else{
            return new Message(false,"添加失败");
        }
    }

}
