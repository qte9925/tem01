<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改考核任务</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
      <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
      <link href="${path}/css/bootstrap-select.min.css" rel="stylesheet">
      <link rel="stylesheet" href="${path}/css/bootstrap-datetimepicker.min.css">
      <script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="${path}/js/vue.min.js"></script>
      <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
      <script type="text/javascript" src = "${path}/css/bootstrap.min.css"></script>
      <script type="text/javascript" src = "${path}/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="${path }/js/bootstrap-select.min.js"></script>
      <script type="text/javascript" src="${path}/js/bootstrap-datetimepicker.min.js"></script>
      <script type="text/javascript" src="${path}/js/bootstrap-datetimepicker.zh-CN.js"></script>
  </head>
  <style>
      body{
          background-color: #E0E0E0;
      }
      .showTbpost{
          width:100%;
          height:auto;
          border:1px solid #f7f7f7;
      }
  </style>
  <body>
  <table class="table table-bordered showTbpost" border="1px">
      <tr>
          <td><input type="hidden" class="form-control " id="tbTaskId"  ></td>
      </tr>
      <tr>
          <td >考核计划名称</td>
          <td><input type="text" class="form-control " style="width: 44%" id="tbTaskName"   ></td>
      </tr>
      <tr>
          <td>考核计划说明</td>
          <td><input type="text" class="form-control "  style="width: 44%"  id="tbTaskText"></td>
      </tr>
      <tr>
          <td>考核人</td>
          <td>
              <select name="level1"  id="level1"  style="width:149px;">
              </select>
              <select name="level2" id="level2" style="width:149px;">
              </select>
              <select name="level3" id="level3" style="width:149px;">
              </select>
          </td>
      </tr>
      <tr>
          <td>被考核人</td>
          <td>
              <select id="slpk" class="selectpicker" data-live-search="true" multiple onchange="showvalue()" style="width: 44%" ></select>
              <input type="hidden" id="deptinput">
          </td>
      </tr>
      <tr>
          <td>考核优先级</td>
          <td><select type="text" class="form-control "  style="width: 44%"  id="tbStepId"></select></td>
      </tr>
      <tr>
          <td>考核生效时间</td>
          <td><input type="text" class="form-control "  style="width: 44%" id="tbTaskStarttime"></td>
      </tr>
      <tr>
          <td>考核截止时间</td>
          <td><input type="text" class="form-control "  style="width: 44%" id="tbTaskEndtime"></td>
      </tr>
      <tr>
          <td><input type="hidden" class="form-control "  style="width: 44%"  id="tbTaskState"></td>
      </tr>
      <tr>
          <td colspan="3" style="cursor: pointer;background-color: #E0E0E0;text-align: center"  id="edBtn">考核项</td>
      </tr>
      <tr style="display: none">
          <td >考核项</td>
          <td >分值</td>
          <td >考核项说明</td>
          <td><img src="${path}/images/jia.jpg" id="addReBtn" style="cursor: pointer;width: 30px;background-color: #F6F6F6"></td>
      </tr>
      <tbody id="edTbody" style="display: none">
      </tbody>
      <tr>
          <td><input type="Button" class="btn btn-info"   id="Btn" value = "提交"></td>
      </tr>
  </table>

  </body>
  <script type="text/javascript" >
      var tid = '${param.tidOne}';
      var sid ;
      var did;
      var pid;
      $(document).ready(
          function(){
              //根据id修改
              $.ajax({
                  url:'${path}/selectTaskID',
                  data:{
                      "tbTaskId":tid
                  },
                  type:'post',
                  dataType:'json',
                  ansy:false,
                  success:function(data){
                      $("#tbTaskId").val(tid);
                      $("#tbStepId").val(data.tb_step_id);
                      sid =data.tb_staff_id;
                      did= data.tb_post_id;
                      pid =data.tb_dept_id;
                      $("#tbTaskName").val(data.tb_task_name);
                      $("#tbTaskName").val(data.tb_task_name);
                      $("#tbTaskText").val(data.tb_task_text);
                      $("#tbTaskStarttime").val(data.startT);
                      $("#tbTaskEndtime").val(data.entT);
                      $("#tbTaskState").val(data.tb_task_state);
                  }
              });
              $.ajax({
                  url:"${path}/showTbDept",
                  data:{},
                  dataType:"json",
                  type:"post",
                  ansy:false,
                  success:function(data){
                      for(var i=0;i<data.length;i++){
                          var obj=data[i];
                          $("#level1").append("<option value='"+obj.tb_dept_id+"'>"+obj.tb_dept_name+"</option>");
                      }
                      $("#level1").val(did);
                  }
              });
          });
      $("#level1").change(function(){
          $.ajax({
              url:"${path}/SelectTbPostByid",
              data:{tbDeptId:$("#level1").val()},
              dataType:"json",
              type:"post",
              success:function(data){
                  $("#level2").html("");
                  $("#level3").html("");
                  for(var i=0;i<data.length;i++){
                      var obj=data[i];
                      $("#level2").append("<option value='"+obj.tb_post_id+"'>"+obj.tb_post_name+"</option>");
                  }
                  $("#level2").val(pid);
              }
          })
      });
      $("#level2").change(function(){
          $.ajax({
              url:"${path}/SelectPostBytbPostId",
              data:{tbPostId:$("#level2").val()},
              dataType:"json",
              type:"post",
              success:function(data){
                  $("#level3").html("");
                  for(var i=0;i<data.length;i++){
                      var obj=data[i];
                      $("#level3").append("<option value='"+obj.tb_staff_id+"'>"+obj.tb_staff_name+"</option>");
                  }
                  $("#level3").val(sid);
              }
          })
      });
      $(".selectpicker").selectpicker({
          noneSelectedText : '请选择'
      });
      $(window).on('load', function() {
          $('.selectpicker').selectpicker('val', '');
          $('.selectpicker').selectpicker('refresh');
      });
      //下拉数据加载
      $.ajax({
          type : 'post',
          url : "${path}/showTbDept",
          dataType : 'json',
          success : function(datas) {//返回list数据并循环获取
              var select = $("#slpk");
              for (var i = 0; i < datas.length; i++) {
                  select.append("<option value='"+datas[i].tb_dept_id+"'>"
                      + datas[i].tb_dept_name + "</option>");
              }
              $('.selectpicker').selectpicker('val', '');
              $('.selectpicker').selectpicker('refresh');
          }
      });
      function showvalue(){
          var arrayselectdept = $("#slpk").val();
          $("#deptinput").val(arrayselectdept);
      }
      //获取评价类别
      $().ready(function(){
          $.ajax({
              url:'${path }/selectStep',
              data:{},
              dataType:'json',
              type:'post',
              success:function(data){
                  console.log(data);
                  $("#tbStepId").html('');
                  for(var i=0;i<data.length;i++){
                      var t = data[i];
                      var op = "<option value = '"+t.tb_step_id+"'>"+t.tb_step_nam+"</option>";
                      $("#tbStepId").append(op);
                  }
              }
          });
      });

      //获取考核项
      function registereim() {
          var trinfo = '';
          trinfo = trinfo +'';
          trinfo = trinfo +'<tr class="trs">';
          trinfo = trinfo +'<td><select  class="form-control tbEventId3" ></select></td>';
          trinfo = trinfo +'<td><input  class="form-control tbEventId1" /></td>';
          trinfo = trinfo +'<td><input  class="form-control tbEventId2" /></td>';
          trinfo = trinfo +'<td style="cursor: pointer;"><img src="${path}/images/jian.jpg" id="delReBtn" style="width: 30px;height: 30px"></td>';
          trinfo = trinfo +'</tr>';
          $("#edTbody").append(trinfo);
      }

      $("#edBtn").click(function(){
          $(this).parent().next().toggle();
          $("#edTbody").toggle();
      })
      //添加一栏
      $("#addReBtn").click(function(){
          registereim();
      })
      //删除一栏
      $("#edTbody").on("click","#delReBtn",function(){
          $(this).parent().parent().remove();
      })
      $(document).ready(function(){
          $("#Btn").click(function(){
              alert("++++++++++++++++++++");
              $.ajax({
                  url:'${path}/UpdateTask',
                  data:{
                      "tbTaskId":$("#tbTaskId").val(),
                      "tbTaskName":$("#tbTaskName").val(),
                      "tbTaskText":$("#tbTaskText").val(),
                      /*"tbdeptId":$("#level1").val,
                      "tbpostId":$("#level2").val,*/
                      "tbStaffId":$("#level3").val(),
                      "tbStepId":$("#tbStepId").val(),
                      "tbTaskStarttime":$("#tbTaskStarttime").val(),
                      "tbTaskEndtime":$("#tbTaskEndtime").val(),
                      "tbTaskState":$("#tbTaskState").val(),
                      "deptString":$("#deptinput").val()
                  },
                  dataType:'json',
                  type:'post',
                  success:function(data){
                      console.log(data);
                      if(data.state){
                          alert(data.message);
                          window.location.href="${path}/bc/management.jsp";
                      }else{
                          alert(data.message);
                      }
                  }
              });
          });
      });
      $(function () {
          $('#tbTaskStarttime').datetimepicker({
              format:    'yyyy-mm-dd hh:mm',     // 设置时间年月日时分的格式 如: 2016/11/15 18:00 */
              autoclose:true,//选中关闭
              language:"zh-CN"
          });
      });
      $(function () {
          $('#tbTaskEndtime').datetimepicker({
              format:    'yyyy-mm-dd hh:mm',     // 设置时间年月日时分的格式 如: 2016/11/15 18:00 */
              autoclose:true,//选中关闭
              language:"zh-CN"
          });
      });
  </script>
</html>
