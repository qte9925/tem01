package com.bc.dao;

import com.bc.entity.TbTask;
import javafx.concurrent.Task;

import java.util.List;
import java.util.Map;

public interface TbTaskMapper {
    int deleteByPrimaryKey(Integer tbTaskId);

    int insert(TbTask record);

    int insertSelective(TbTask record);

    TbTask selectByPrimaryKey(Integer tbTaskId);

    int updateByPrimaryKeySelective(TbTask record);

    int updateByPrimaryKey(TbTask record);
    //查询考核任务
    public List<Map> selectTbTask(Map map);
    //根据任务id查询被考核人部门
    public List<Map> selecttaskdept(int tbTaskId);
    //根据postid查询考核人
    public List<Map> selectPostid(String tbTaskName);
    //查询根据taskid考核项
    public List<Map> selectDetailone(int tbTaskId);
    //根据职位id查询员工
   public List<Map> SelectPostBytbPostId(Integer tbPostId);
    public List SelectStaffBytbPostId(Integer tbPostId);
   //添加部门员工
    public List<Map> SelectTbPostByid(Integer tbDeptId);
   //添加考核任务数据
   public int SelectTbDeptKhId();
   public int SelectTbTaskMaxid();
   //根据Staffid查询员工姓名
    public String SelectStaffId(Integer tbStaffId);
    /*查询考核评价项*/
    public List<Map> selectStep();
    /*根据id查询数据*/
    public Map selectTaskID(Integer tbTaskId);
    /*修改i*/
    public int UpdateTask(Map map);
    //查询截至时间
    public List<Map> selectEndTime(Integer tbTaskId);
    //查询taskid
    public List<Map> selectTaskId();
    //根据id删除考核任务
    public Integer DeleteTaskid(Integer tbTaskId);
    List<Map> selectAllTbTask(TbTask record);
    //根据tasking修改状态
    public Integer UpdateTaskState(Integer tbTaskId);
    public Integer SelectEventMark(Integer TbEventId);

    //查询自身绩效考核任务
    List SelectMyTask(Integer tbStaffId);
    //查询上级评价员工
    List SelectOtherStaff(Map map);
    //查询考核任务人数
    List  SelectOtherTask(Map map);
    //查看上级信息
    Map SelectUpXx(Integer StaffId);
    //审核查询
    List SelectendTask(Map map);

}