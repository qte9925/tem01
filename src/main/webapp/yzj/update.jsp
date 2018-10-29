<%--
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
    var Id = ${param.Id};
    $().ready(function(){
       $.ajax({
            url:"${path}/FindDepartment",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#type").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.bmid+"'>"+p.bmname+"</option>";
                    $("#type").append(html);
                }
            }
        })
        //修改前查询
        $.ajax({
            url:"${path}/selectById",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    $("#staffName").val(p.staffName);
                    $("#department").val(p.department);
                    $("#post").val(p.post);
                    $("#shenpimode").val(p.shenpimode);
                    $("#education").val(p.education);
                    $("#writePeople").val(p.writePeople);
                    $("#bmid").val(p.bmid);
                }
            }
        })
        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/update",
                type:"post",
                dataType:"json",
                data:{
                    "staffName":$("#staffName").val(),
                    "departmentid":$("#type").val(),
                    "post":$("#post").val(),
                    "shenpimode":$("#shenpimode").val(),
                    "education":$("#education").val(),
                    "writePeople":$("#writePeople").val(),
                    "Id":Id
                },
                success:function(data){
                    window.location.href="/yzj/chaxun.jsp";
                }
            })
        })
    })
</script>
<body>
<table>
    <tr>
        <td>需求内容:</td>
        <td><input type="text" id="staffName"></td>
    </tr>
    <tr>
        <td>部门:</td>
        <td><select id="type"></select></td>
    </tr>
    <tr>
        <td>职位:</td>
        <td><input type="text" id="post"></td>
    </tr>
    <tr>
        <td>审批方式</td>
        <td><input id="shenpimode"></td>
    </tr>
    <tr>
        <td>学历:</td>
        <td><input id="education"></td>
    </tr>
    <tr>
        <td>审批人:</td>
        <td><input id="writePeople"></td>
    </tr>

    <tr>
        <td><button id="updateBtn">确认修改</button></td>

    </tr>
</table>
</body>
</html>

--%>
