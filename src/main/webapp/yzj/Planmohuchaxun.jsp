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

<style>
    #aaa{
        width:500px;
    }
</style>

<script type="text/javascript">

    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/selectPlan",
            data:{"aa":$("#staff").val(),"Pid":$("#Pid").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
            }
        })

    }
   $().ready(function() {
        getinfo(1);
        $("#selectBtn").click(function() {
            getinfo(1);
        });
    });

</script>
<div id="aaa">
<table class="table table-bordered">
    <thead>
    <tr>

    </tr>
    </thead>
    <tbody>
    <tr><td>计划编码<input type="text" id="Pid"></td></tr>
    <tr><td>计划名称<input type="text" id="staff"></td></tr>
    <tr><td>培训地点<input type="text" id="Pdd"></td></tr>
    <tr></tr>
    <tr></tr>

    </tbody>
</table>
</div>
</html>
