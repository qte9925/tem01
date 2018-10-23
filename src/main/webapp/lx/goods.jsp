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

    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/js/jquery-tagsinput.min.css" />

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/color/jquery.color.plus-names-2.1.2.min.js" integrity="sha256-Wp3wC/dKYQ/dCOUD7VUXXp4neLI5t0uUEF1pg0dFnAE=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" defer></script>
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    <%--<script type="text/javascript" src="'${path}'/js/jquery-1.8.3.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
    function getinfo(json) {
        $.ajax({
            url : "${path}/gselect",
            type : "post",
            dataType : "json",
            data : json,
            success : function(data) {
                $("#tbody").html('');
                for ( var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" +p.goods_id+"</td>";
                    html = html + "<td>" + p.goods_ber + "</td>";
                    html = html + "<td>" + p.goods_type + "</td>";
                    html = html + "<td>" + p.goods_name  + "</td>";
                    html = html + "<td>" + p.goods_num + "</td>";
                    html = html + "<td>" + p.goods_all + "</td>";
                    html = html + "<td><a onclick='deleteFoods(" + p.goods_id
                        + ")'>删除</a>   <a onclick='UpdateGoods("
                        + p.goods_id + ")'>修改</a></td>";
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
</script>
<body>

<table class="table">
    <tr class="active">
        <td>物品id</td>
        <td>物品类型</td>
        <td>物品编号</td>
        <td>物品名称</td>
        <td>物品数量</td>
        <td>物品调配</td>
    </tr>
    <tbody id="tbody">

    </tbody>
    ${path}
</table>

</body>
</html>
