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
            url : "${path}/select",
            type : "post",
            dataType : "json",
            data : json,
            success : function(data) {
                $("#tbody").html('');
                for ( var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" +p.staffName+"</td>";
                    html = html + "<td>" + p.department + "</td>";
                    html = html + "<td>" + p.post + "</td>";
                    html = html + "<td>" + p.shenpimode  + "</td>";
                    html = html + "<td>" + p.education + "</td>";
                    html = html + "<td>" + p.writePeople + "</td>";
                    html = html + "<td><a onclick='deleteFoods(" + p.Id
                        + ")'>删除</a>   <a onclick='UpdateGoods("
                        + p.Id + ")'>修改</a></td>";
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
    function UpdateGoods(Id){
        window.location.href="update.jsp?Id="+Id;
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
        <td>需求内容</td>
        <td>部门</td>
        <td>职务</td>
        <td>审批方式</td>
        <td>学历</td>
        <td>填单人</td>
    </tr>
    <tbody id="tbody">

    </tbody>
    ${path}
</table>
</body>
</html>
