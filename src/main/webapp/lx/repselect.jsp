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
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
    function getinfo(json) {
        $.ajax({
            url : "${path}/repselectA",
            type : "post",
            dataType : "json",
            data : json,
            success : function(data) {
                $("#tbody").html('');
                for ( var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" +p.rep_id+"</td>";
                    html = html + "<td>" + p.rep_patha + "</td>";
                    html = html + "<td>" + p.rep_yuangong_id + "</td>";
                    html = html + "<td>" + p.rep_yuangong_name  + "</td>";
                    html = html + "<td>" + p.rep_state + "</td>";
                    html = html + "<td>" + p.rep_late_fre + "</td>";
                    html = html + "<td>" + p.rep_late_time + "</td>";
                    html = html + "<td>" + p.rep_retreat_fre + "</td>";
                    html = html + "<td>" + p.rep_retreat_time + "</td>";
                    html = html + "<td>" + p.rep_bsen_time + "</td>";
                    html = html + "<td>" + p.rep_Sign_fre + "</td>";
                    html = html + "<td>" + p.rep_service + "</td>";
                    html = html + "<td><a onclick='deleteFoods(" + p.rep_id
                        + ")'>删除</a>   <a onclick='UpdateGoods("
                        + p.rep_id + ")'>修改</a></td>";
                    html = html + "</tr>";
                    $("#tbody").append(html);
                }
            }
        })
    }
    $().ready(function() {
        getinfo({});
        $("#selectBtn").click(function() {
            getinfo({
                "staff":$("#staffName").val(),
            });
        });

    });
    function deleteFoods(Id){
        $.ajax({
            url:"${path}/delete",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    function UpdateGoods(rep_id){
        window.location.href="/lx/repupdate.jsp?rep_id="+rep_id;
    }
</script>
<body>
<div style="text-align:left;">
    需求名<input type="text" id="staff">
    <button id="selectBtn">查询</button>
    <button id="addBtn">添加需求</button>
</div>
<table>
    <tr>
        <td>报表ID</td>
        <td>所在部门</td>
        <td>员工编号</td>
        <td>员工姓名</td>
        <td>考勤状态</td>
        <td>迟到次数</td>
        <td>迟到时长</td>
        <td>早退次数</td>
        <td>早退时长</td>
        <td>旷工时长</td>
        <td>签到次数</td>
        <td>是否全勤</td>
    </tr>
    <tbody id="tbody">

    </tbody>
    ${path}
</table>
</body>
</html>
