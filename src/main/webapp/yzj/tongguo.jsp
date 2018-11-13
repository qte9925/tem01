<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    <%--<script type="text/javascript" src="'${path}'/js/jquery-1.8.3.min.js"></script>--%>
    <link rel="stylesheet" href="js/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script></head>
    <script src="${path}/yzj/laydate/laydate.js"></script>
</head>
<!-- 模态框（Modal） -->

<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改信息
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                  <tr>
                      <td>考核结果:<select id="jieguo">
                          <option value="0">通过</option>
                          <option value="1">不通过</option>
                      </select></td>
                  </tr>
                    <tr>
                        <td>备注:<textarea type="text"id="beizhu"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateBtn">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<table class="table table-bordered">
    <tr>
        <th>员工姓名</th>
        <th>员工部门</th>
        <th>计划编码</th>
        <th>课时</th>
        <th>结果</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    <tbody id="tbody">

    </tbody>
</table>
</html>
<script>
  $().ready(function(){
      $.ajax({
          url:"${path}/tongguo",
          type:"post",
          dataType:"json",
          success:function(data){
              $("#tbody").html("");
              for(var i=0;i<data.length;i++){
                   var p=data[i];
                   var html="<tr>";
                   html=html+"<td>"+p.ryxm+"</td>";
                   html=html+"<td>"+p.bmname+"</td>";
                   html=html+"<td>"+p.planid+"</td>";
                   html=html+"<td>"+p.totalhours+"</td>";
                   if(p.jieguo==undefined){
                       html=html+"<td>未录入结果</td>";
                       html=html+"<td>未录入备注</td>";
                       html=html+"<td><button onclick='jieguo("+p.id+")' data-toggle='modal' data-target='#myModala'>录入考核结果</button></td>";
                   }else if(p.jieguo==0){
                       html=html+"<td>通过</td>";
                       html=html+"<td>"+p.beizhu+"</td>";
                       html=html+"<td><font color='lightgreen'>已通过</font></td>";
                   }else if(p.jieguo==1){
                       html=html+"<td>未通过</td>";
                       html=html+"<td>"+p.beizhu+"</td>";
                       html=html+"<td><button onclick='jieguo("+p.id+")' data-toggle='modal' data-target='#myModala'>重新录入</button></td>";
                   }
                   html=html+"</tr>";
                   $("#tbody").append(html);
              }
          }
      })
  })
    function jieguo(id){
      $("#updateBtn").val(id);
    }
    $("#updateBtn").click(function(){
        $.ajax({
            url:"${path}/addnewbaoming",
            type:"post",
            dataType:"json",
            data:{
                "id":$("#updateBtn").val(),
                "jieguo":$('#jieguo option:selected').val(),
                "beizhu":$("#beizhu").val()
            },
            success:function(data){
               if(data.state){
                   alert(data.message);
                   window.location.reload();
               }
            }
        })
    })
</script>