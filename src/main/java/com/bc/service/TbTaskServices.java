package com.bc.service;

import java.util.List;
import java.util.Map;

public interface TbTaskServices {
    //查询
    public List<Map> selectTbTask(Map map);
    //根据任务id查询被考核人部门
    public List<Map> selecttaskdept(int tbTaskId);
    //根据postid查询考核人
    public List<Map> selectPostid(String tbTaskName);
    //查询根据taskid考核项
    public List<Map> selectDetailone(int tbTaskId);
    //根据职位id查询员工
    public List<Map> SelectPostBytbPostId(Integer tbPostId);
    //添加部门员工
    public List<Map> SelectTbPostByid(Integer tbDeptId);
    //添加考核任务
    public int insertservice(Map map);
    //根据Staffid查询员工姓名
    public Integer DeleteTaskid(Integer tbTaskId);
    /*根据id查询数据*/
    public Map selectTaskID(Integer tbTaskId);
    /*修改*/
    public int UpdateTask(Map map);
    /*查询考核评价项*/
    public List<Map> selectStep();
    //对比系统时间修改状态
    public int UpdateTbTaskState();
    //根据tasking修改状态
    public Integer UpdateTaskState(Integer tbTaskId);
    /*验证考核任务唯一性*/
    public List<Map> selectTbTaskName(Map map);

    /*<!--小明写-->*/
    //查询自身绩效考核任务
    List SelectMyTask(Integer tbStaffId);
    //查询上级评价员工
    List SelectOtherStaff(Map map);
    //查询考核任务人数
    List  SelectOtherTask(Map map);
}
