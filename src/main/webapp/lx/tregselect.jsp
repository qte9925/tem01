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
            url : "${path}/tselect",
            type : "post",
            dataType : "json",
            data : json,
            success : function(data) {
                $("#tbody").html('');
                for ( var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" +p.reg_id+"</td>";
                    html = html + "<td>" + p.reg_bem + "</td>";
                    html = html + "<td>" + p.reg_type + "</td>";
                    html = html + "<td>" + p.reg_path  + "</td>";
                    html = html + "<td>" + p.reg_name + "</td>";
                    html = html + "<td>" + p.reg_baes + "</td>";
                    html = html + "<td>" + p.reg_end + "</td>";
                    html = html + "<td>" + p.reg_zijin + "</td>";
                    html = html + "<td>" + p.reg_jiaojie + "</td>";
                    html = html + "<td>" + p.reg_qk + "</td>";
                    html = html + "<td><a onclick='deleteFoods(" + p.reg_id
                        + ")'>删除</a>   <a onclick='UpdateGoods("
                        + p.reg_id + ")'>修改</a></td>";
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

    function deleteFoods(reg_id){
        $.ajax({
            url:"${path}/tdelete",
            type:"post",
            dataType:"json",
            data:{"reg_id":reg_id},
            success:function(data){
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    function UpdateGoods(reg_id){
        window.location.href="/lx/tregupdate.jsp?reg_id="+reg_id;
    }


    //增加
    $().ready(function(){

        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/tinsert",
                data:{
                    "reg_bem":$("#reg_bem").val(),
                    "reg_type":$("#reg_type").val(),
                    "reg_path":$("#reg_path").val(),
                    "reg_name":$("#reg_name ").val(),
                    "reg_baes":$("#reg_baes").val(),
                    "reg_end":$("#reg_end").val(),
                    "reg_zijin":$("#reg_zijin").val(),
                    "reg_jiaojie":$("#reg_jiaojie").val(),
                    "reg_qk":$("#reg_qk").val()
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    window.location.reload();
                }
            });
        });
    });


</script>
<body>

<table class="table">
    <tr class="active">
        <td>出差数据ID</td>
        <td>出差员工编码</td>
        <td>出差类别名称</td>
        <td>出差部门</td>
        <td>出差员工姓名</td>
        <td>出差开始时间</td>
        <td>出差结束时间</td>
        <td>出差资金</td>
        <td>出差工作交接</td>
        <td>出差交接情况</td>
    </tr>
    <tbody id="tbody">

    </tbody>
    ${path}
</table>


<table>
    <tr>
        <td>出差员工编码:<input type="text" id="reg_bem"></td>
    </tr>
    <tr>
        <td>出差类别名称:<input type="text" id="reg_type"></td>
    </tr>
    <tr>
        <td>出差部门:<input type="text" id="reg_path"></td>
    </tr>
    <tr>
        <td>出差员工姓名:<input id="reg_name"></td>
    </tr>
    <tr>
        <td>出差开始时间:<input id="reg_baes"></td>
    </tr>
    <tr>
        <td>出差结束时间:<input id="reg_end"></td>
    </tr>
    <tr>
        <td>出差资金:<input id="reg_zijin"></td>
    </tr>
    <tr>
        <td>出差工作交接:<input id="reg_jiaojie"></td>
    </tr>
    <tr>
        <td>出差交接情况:<input id="reg_qk"></td>
    </tr>
    <tr>
        <td><button id="updateBtn">确认修改</button></td>
    </tr>
</table>

</body>
</html>
