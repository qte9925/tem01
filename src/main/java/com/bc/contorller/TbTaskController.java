package com.bc.contorller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.bc.service.TbDeptServices;
import com.bc.service.TbTaskServices;
import com.bc.entity.TbTask;
import com.bc.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
@Controller
public class TbTaskController {
 @Autowired
 private TbTaskServices tt;
 @Autowired
 private TbDeptServices tds;
 @RequestMapping("/selectTbTask")
 @ResponseBody
 public PageInfo selectTbTask(@RequestParam  Map map){
     int [] state = new int[] {1,2,3};
     map.put("state",state);
     PageHelper.startPage(Integer.parseInt(map.get("pageNow").toString()), 5);
     List list = tt.selectTbTask(map);
     PageInfo pageInfo = new PageInfo<TbTask>(list);
     return pageInfo;
  }
    //根据任务id查询被考核人部门
    @RequestMapping("/selecttaskdept")
    @ResponseBody
    public List<Map> selecttaskdept(@RequestParam Map map){
        List list = tt.selecttaskdept(Integer.parseInt(map.get("TbTaskId").toString()));
        return  list;
    }
    //根据任务Postid查询考核人部门
    @RequestMapping("/selectPostid")
    @ResponseBody
    public List<Map> selectPostid(@RequestParam Map map){
        List list = tt.selectPostid(map.get("tbTaskName").toString());
        return  list;
    }
   /* <!--查询根据taskid考核项-->*/
    @RequestMapping("/selectDetailone")
    @ResponseBody
    public List<Map> selectDetailone(@RequestParam Map map){
        List list = tt.selectDetailone(Integer.parseInt(map.get("TbTaskId").toString()));
        return  list;
    }
    //根据职位id查询员工
    @RequestMapping("/SelectPostBytbPostId")
    @ResponseBody
    public List SelectPostBytbPostId(Integer tbPostId) {
        List list = tt.SelectPostBytbPostId(tbPostId);
        return list;
    }
    @RequestMapping("/SelectTbPostByid")
    @ResponseBody
    public List SelectTbPostByid(Integer tbDeptId) {
        List list = tt.SelectTbPostByid(tbDeptId);
        return list;
    }
    //查询部门
    @RequestMapping("/showTbDeptOne")
    @ResponseBody
    public List showTbpost(@RequestParam Map map){
        return tds.showTbpost(map);
    }
    //添加考核任务
    @RequestMapping("/InsertTbTask")
    @ResponseBody
    public Message InsertTbTask(@RequestParam Map map){
        int result = tt.insertservice(map);
        Message me = null;
        if(result>0){
            return new Message(true,"添加成功");
        }else{
            return new Message(false,"添加失败");
        }
    }
    /*
     *获取类别
     **/
    @RequestMapping("/selectStep")
    @ResponseBody
    public List selectStep(){
        List list = tt.selectStep();
        System.out.print("++++++++++"+list);
        return list;
    }
    /*
     *根据id获取
     **/
    @RequestMapping("/selectTaskID")
    @ResponseBody
    public Map selectTaskID(@RequestParam Map map){
        Map map1 =  tt.selectTaskID(Integer.parseInt(map.get("tbTaskId").toString()));
        System.out.println(map1);
        return map1;
    }
    /*
     *修改
     **/
    @RequestMapping("/UpdateTask")
    @ResponseBody
    public Message UpdateTask(@RequestParam Map map){
        int a = tt.UpdateTask(map);
        Message mes = null;
        if(a>0){
            mes=new Message(true, "修改成功");
        }else{
            mes=new Message(false, "修改失败");
        }
        return mes;
    }
    //查询时间
    @RequestMapping("/UpdateTbTaskState")
    @ResponseBody
    public int UpdateTbTaskState(){
        int a = tt.UpdateTbTaskState();
        System.out.print("===================="+a);
        return a;
    }
    //删除修改状态
    @RequestMapping("/DeleteTaskid")
    @ResponseBody
    public Message DeleteTaskid(@RequestParam Map map){
        int a = tt.DeleteTaskid(Integer.parseInt(map.get("TbTaskId").toString()));
        Message message=null;
        if(a>0){
            message = new Message(true,"操作成功");
        }else{
            message = new Message(false,"操作失败");
        }
        return message ;
    }
    /*修改*/
    @RequestMapping("/UpdateTaskState")
    @ResponseBody
    public Message UpdateTaskState(@RequestParam Map map){
        int a = tt.UpdateTaskState(Integer.parseInt(map.get("TbTaskId").toString()));
        Message message=null;
        if(a>0){
            message = new Message(true,"操作成功");
        }else{
            message = new Message(false,"操作失败");
        }
        return message ;
    }
    /*判断考核任务是否存在*/
    @RequestMapping("/selectTbTaskName")
    @ResponseBody
    public Message selectTbTaskName(@RequestParam Map map){
        Message message=null;
        int a =tt.selectTbTaskName(map).size();
        if(a>0){
            message = new Message(false,"已存在");
        }else{
            message = new Message(true,"可以使用");
        }
        return message;
    }

    /*<!--小明写-->*/
    //查询自身绩效考核任务
    @RequestMapping("/SelectMyTask")
    @ResponseBody
    public List SelectMyTask(Integer tbStaffId){
        List list = tt.SelectMyTask(tbStaffId);
        return list;
    }
    //查询上级评价员工
    @RequestMapping("/SelectOtherTask")
    @ResponseBody
    public List SelectOtherTask(@RequestParam Map map){
        List list = tt.SelectOtherTask(map);
        return list;
    }
    //查询考核任务人数
    @RequestMapping("/SelectOtherStaff")
    @ResponseBody
    public List SelectOtherStaff(@RequestParam Map map) {
        List list = tt.SelectOtherStaff(map);
        return list;
    }
    //审核查询
    @RequestMapping("/SelectendTask")
    @ResponseBody
    public List SelectendTask(){
        List list = tt.SelectendTask();
        return list;
    }


}
