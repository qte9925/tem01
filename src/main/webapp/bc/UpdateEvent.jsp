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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
      <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
      <link href="${path}/css/bootstrap-select.min.css" rel="stylesheet">
      <script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="${path}/js/vue.min.js"></script>
      <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
      <script type="text/javascript" src = "${path}/css/bootstrap.min.css"></script>
      <script type="text/javascript" src = "${path}/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="${path }/js/bootstrap-select.min.js"></script>

  </head>
  
  <body>
  <table class="table table-bordered" border="1px" style="text-align: center;">
      <tr>
          <td ><input type="hidden" id = "tbDetailoneId" /></td></tr>
      <tr>
          <td>考核指标集名称：<input type = "text" id = "tbDetailoneValue" /></td></tr>
      <tr>
          <td>考核指标集说明：<input type = "text" id = "tbDetailoneName"/></td></tr>
      <tr>
          <td>考核项：<select  id = "tbEventId" ></select></td>
      </tr>
      <tr>
          <td>考核任务名称：<select id = "tbTaskId" ></select></td></tr>
      <tr>
          <td>考核任务分值：<input id = "tbDetailoneMark" /></td></tr>
      <tr>
          <td><input type = "Button" id = "Btn"  value = "添加"/></td></tr>
  </table>
  </body>
  <script type="text/javascript" >
      var Deid = '${param.eidOne}';
      //查询类别Task
      $(document).ready(function(){
          $.ajax({
              url:'${path }/selectTaskName',
              data:{},
              dataType:'json',
              type:'post',
              success:function(data){
                  $("#tbTaskId").html("");
                  for(var i=0;i<data.length;i++){
                      var t = data[i];
                      var op = "<option value = '"+t.tb_task_id+"'>"+t.tb_task_name+"</option>";
                      $("#tbTaskId").append(op);
                  }
              }
          });
      });
      $(document).ready(function(){
          $.ajax({
              url:'${path }/selectEventName',
              data:{},
              dataType:'json',
              type:'post',
              success:function(data){
                  $("#tbEventId").html("");
                  for(var i=0;i<data.length;i++){
                      var t = data[i];
                      var op = "<option value = '"+t.tb_event_id+"'>"+t.tb_event_value+"</option>";
                      $("#tbEventId").append(op);
                  }
              }
          });
     });
      //根据id修改
      $.ajax({
          url:'${path}/SelectDetailoneBiId',
          data:{
              "tbDetailoneId":Deid
          },
          type:'post',
          dataType:'json',
          ansy:false,
          success:function(data){
              $("#tbDetailoneId").val(Deid);
              $("#tbDetailoneValue").val(data.tb_detailone_value);
              $("#tbDetailoneName").val(data.tb_detailone_name);
              $("#tbEventId").val(data.tb_event_id);
              $("#tbTaskId").val(data.tb_task_id);
              $("#tbDetailoneMark").val(data.tb_detailone_mark);
          }
      });
      $(document).ready(function(){
          $("#Btn").click(function(){
              alert("++++++++++++++++++++");
              $.ajax({
                  url:'${path}/UpdateDetailone',
                  data:{
                      "tbDetailoneId":$("#tbDetailoneId").val(),
                      "tbDetailoneValue":$("#tbDetailoneValue").val(),
                      "tbDetailoneName":$("#tbDetailoneName").val(),
                      "tbEventId":$("#tbEventId").val(),
                      "tbTaskId":$("#tbTaskId").val(),
                      "tbDetailoneMark":$("#tbDetailoneMark").val()
                  },
                  dataType:'json',
                  type:'post',
                  success:function(data){
                      console.log(data);
                      if(data.state){
                          alert(data.message);
                          window.location.href="${path}/bc/SelectTbDetailone.jsp";
                      }else{
                          alert(data.message);
                      }
                  }
              });
          });
      });
  </script>
</html>
