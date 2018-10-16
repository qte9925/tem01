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
    //下拉框

    $().ready(function(){
        //修改前查询
        var idd=${param.rep_id}
        $.ajax({
            url:"${path}/selectrep01",
            type:"post",
            dataType:"json",
            data:{"rep_id":idd},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    // $("#rep_patha").val(p.rep_patha);
                    // $("#rep_yuangong_id").val(p.rep_yuangong_id);
                    // $("#rep_yuangong_name").val(p.rep_yuangong_name);
                    $("#rep_state").val(p.rep_state);
                    $("#rep_late_fre").val(p.rep_late_fre);
                    $("#rep_late_time").val(p.rep_late_time);
                    $("#rep_retreat_fre").val(p.rep_retreat_fre);
                    $("#rep_retreat_time").val(p.rep_retreat_time);
                    $("#rep_bsen_time").val(p.rep_bsen_time);
                    $("#rep_Sign_fre").val(p.rep_Sign_fre);
                    $("#rep_service").val(p.rep_service);
                }
            }
        })
        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/updaterep",
                type:"post",
                dataType:"json",
                data:{
                    "rep_state":$("#rep_state").val(),
                    "rep_late_fre":$("#rep_late_fre").val(),
                    "rep_late_time":$("#rep_late_time").val(),
                    "rep_retreat_fre":$("#rep_retreat_fre").val(),
                    "rep_retreat_time":$("#rep_retreat_time").val(),
                    "rep_bsen_time":$("#rep_bsen_time").val(),
                    "rep_Sign_fre":$("#rep_Sign_fre").val(),
                    "rep_service":$("#rep_service").val(),
                    "rep_id":rep_id
                },
                success:function(data){
                    window.location.href="/lx/repselect.jsp";
                }
            })
        })
    })
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
