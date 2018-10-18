<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'update.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script></head>
<script type="text/javascript">
    //增加
    $().ready(function(){

        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/insertrep",
                data:{
                    "rep_state":$("#rep_state").val(),
                    "rep_late_fre":$("#rep_late_fre").val(),
                    "rep_late_time":$("#rep_late_time").val(),
                    "rep_retreat_fre":$("#rep_retreat_fre ").val(),
                    "rep_retreat_time":$("#rep_retreat_time").val(),
                    "rep_bsen_time":$("#rep_bsen_time").val(),
                    "rep_Sign_fre":$("#rep_Sign_fre").val(),
                    "rep_service":$("#rep_service").val()
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    window.location.href="/lx/repselect.jsp";
                }
            });
        });
    });

</script>
<body>
<table>
    <tr>
        <td>考勤状态:<input type="text" id="rep_state"></td>
    </tr>
    <tr>
        <td>迟到次数:<input type="text" id="rep_late_fre"></td>
    </tr>
    <tr>
        <td>迟到时长:<input type="text" id="rep_late_time"></td>
    </tr>
    <tr>
        <td>早退次数:<input id="rep_retreat_fre"></td>
    </tr>
    <tr>
        <td>早退时长:<input id="rep_retreat_time"></td>
    </tr>
    <tr>
        <td>旷工时长:<input id="rep_bsen_time"></td>
    </tr>
    <tr>
        <td>签到次数:<input id="rep_Sign_fre"></td>
    </tr>
    <tr>
        <td>是否全勤:<input id="rep_service"></td>
    </tr>
    <tr>
        <td><button id="updateBtn">确认修改</button></td>
    </tr>
</table>
</body>
</html>
