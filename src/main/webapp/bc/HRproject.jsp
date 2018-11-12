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
    
    <title>考核任务管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
      <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
      <script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="${path}/js/vue.min.js"></script>
      <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
      <script type="text/javascript" src = "${path}/css/bootstrap.min.css"></script>
      <script type="text/javascript" src = "${path}/js/bootstrap.min.js"></script>
  </head>

  <body style="padding: 0px;margin: 0px">
  <ul id="myTab" class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">
          考核任务管理</a></li>
      <li><a href="#ios" data-toggle="tab">新建考核任务</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="home">
          <div style="width: 700px;height: 30px;border: 1px solid white;">考核名称<input type="text" id = "tname"/>
              <input type="button" id = "Btn" value = "查询" class="btn btn-default" style="margin-top: -10px"/></div>
          <table border="1px" class="table table-bordered" style="text-align: center;">
              <tr style="text-align: center;">
                  <td>考核任务名称</td>
                  <td>考核人</td>
                  <td>被考核人</td>
                  <td>考核生效时间</td>
                  <td>考核结束时间</td>
                  <td>本人考核状态</td>
                  <td>操作</td>
              </tr>
              <tbody id = "tbody">
              <tr v-for="post in plist">
                  <td>{{post.tb_task_name}}</td>
                  <td style="cursor: pointer;"><type data-toggle="modal" data-target="#Nameid "/>{{post.tb_staff_name}}</td>
                  <td>{{post.tb_prople_ygkh_name}}</td>
                  <td>{{post.tb_task_startTime}}</td>
                  <td>{{post.tb_task_endTime}}</td>
                  <td>{{post.tb_task_state>0 ? "已考核":"未考核" }}</td>
                  <td  class="DetailBtn" id="{{post.tb_task_id}}">
                      <type data-toggle="modal" data-target="#Taskmodel" />考核情况</td>
              </tr>
          </tbody>
          </table>
          <div id="Page">
              <button id="upPage" class="btn btn-default">上一页</button>&nbsp;
              第<span id="pageNow" class="btn btn-default"></span>页  /  共<span id="allPage"></span>页&nbsp;
              <button id="downPage" class="btn btn-default">下一页</button>&nbsp;&nbsp;
          </div>
      </div>

      <div class="tab-pane fade" id="ios">
          <p>iOSssss</p>
      </div>

  </div>
  <script>
      var vueModel = {plist:[]};
      var vueModels = new Vue({
          el:'#tbody',
          data :vueModel
      });
      getTbTask({"pageNow":1});
      function getTbTask(json){
          $.ajax({
              data:json,
              dataType:'json',
              type:'post',
              success:function(data){
                  vueModels.plist=data.list;
                  $("#pageNow").html(data.pageNum);
                  $("#allPage").html(data.pages);
                  nextPage = data.nextPage;
                  prePage = data.prePage;
                  if(data.isLastPage){
                      $("#downPage").attr("disabled","disabled");
                  }else{
                      $("#downPage").removeAttr("disabled");
                  }
                  if(data.isFirstPage){
                      $("#upPage").attr("disabled","disabled");
                  }else{
                      $("#upPage").removeAttr("disabled");
                  }
              }
          })
      }
      $("#Btn").click(function(){
          getTbTask({"tbTaskName":$("#tname").val(),"pageNow":1});
      });
      $("#upPage").click(function(){
          getTbTask({"tbTaskName":$("#tname").val(),"pageNow":prePage});
      });
      $("#downPage").click(function(){
          getTbTask({"tbTaskName":$("#tname").val(),"pageNow":nextPage});
      });
      //切换卡js
      $(function(){
          $('a[data-toggle="tab"]').on('shown.bs.tab', function (e){
              var activeTab = $(e.target).text();
              var previousTab = $(e.relatedTarget).text();
              $(".active-tab span").html(activeTab);
              $(".previous-tab span").html(previousTab);
          });
      });
      $(function(){
          $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
              var activeTab = $(e.target).text();
              var previousTab = $(e.relatedTarget).text();
              $(".active-tab span").html(activeTab);
              $(".previous-tab span").html(previousTab);
          });
      });
  </script>
  </body>
</html>
