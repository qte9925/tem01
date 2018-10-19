<%--
  Created by IntelliJ IDEA.
  User: zizz
  Date: 2018/10/17
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>查询用户</title>
</head>
<body>
<table class="table table-striped">
    <caption>用户列表</caption>
    <thead>
    <tr>
        <th>用户编号</th>
        <th>用户名称</th>
        <th>用户职位</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="yhid01">

    </tbody>
</table>
<script type="text/javascript">
    $().ready(function () {
        // console.log("111");
        $.ajax({
            url: "${path}/selectyh01",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#yhid01").html('');
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.yhid + "</td>";
                    html = html + "<td>" + p.yhname + "</td>";
                    html = html + "<td>" + p.jsname + "</td>";
                    html = html + "<td><a onclick='deleteFoods(" + p.yhid
                        + ")'>详情</a>   ";
                    +"";
                    html = html + "</tr>";
                    $("#yhid01").append(html);
                }
            }
        });
    });
</script>
</body>
</html>
