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


    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/js/jquery-tagsinput.min.css" />

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/color/jquery.color.plus-names-2.1.2.min.js" integrity="sha256-Wp3wC/dKYQ/dCOUD7VUXXp4neLI5t0uUEF1pg0dFnAE=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" defer></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script></head>
<script type="text/javascript">
    //增加
    $().ready(function(){

        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/tappinsert",
                data:{
                    "tapp_name":$("#tapp_name").val(),
                    "taap_cat":$("#taap_cat").val(),
                    "taap_licant":$("#taap_licant").val(),
                    "taap_data":$("#taap_data ").val(),
                    "taap_time":$("#taap_time").val(),
                    "taap_appt":$("#taap_appt").val(),
                    "taap_state":$("#taap_state").val(),
                    "taap_sdata":$("#taap_sdata").val(),
                    "taap_rea":$("#taap_rea").val()
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    window.location.reload();
                }
            });
        });
    });

//查询
    function getinfo(json) {
        $.ajax({
            url : "${path}/tappSelect",
            type : "post",
            dataType : "json",
            data : json,
            success : function(data) {
                $("#tbody").html('');
                for ( var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" +p.tapp_id+"</td>";
                    html = html + "<td>" + p.tapp_name + "</td>";
                    html = html + "<td>" + p.taap_cat + "</td>";
                    html = html + "<td>" + p.taap_licant  + "</td>";
                    html = html + "<td>" + p.taap_data + "</td>";
                    html = html + "<td>" + p.taap_time + "</td>";
                    html = html + "<td>" + p.taap_appt + "</td>";
                    html = html + "<td>" + p.taap_state + "</td>";
                    html = html + "<td>" + p.taap_sdata + "</td>";
                    html = html + "<td>" + p.taap_rea + "</td>";
                    html = html + "<td><a onclick='deleteFoods(" + p.tapp_id
                        + ")'>删除</a>   <a onclick='UpdateGoods("
                        + p.tapp_id + ")'>修改</a></td>";
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
<table>
    <tr>
        <td>出差单位</td>
        <td id="tapp_name"><input type="text"></td>
    </tr>
    <tr>
        <td>出差类型</td>
        <td id="taap_cat"><input type="text"></td>
    </tr>
    <tr>
        <td>申请人</td>
        <td id="taap_licant"><input type="text"></td>
    </tr>

    <%--<tr>
        <td>开始时间</td>
        <td id="11"><input type="text"></td>
    </tr>
    <tr>
        <td>结束时间</td>
        <td id="12"><input type="text"></td>
    </tr>--%>

    <tr>
        <td>申请日期</td>
        <td id="taap_data"><input type="text" class="demo-input" placeholder="请选择日期" id="test1"></td>
    </tr>
    <tr>
        <td>提交日期</td>
        <td id="taap_time"><input type="text" class="demo-input" placeholder="请选择日期" id="test2"></td>
    </tr>
    <tr>
        <td>审批人</td>
        <td id="taap_appt"><input type="text"></td>
    </tr>
    <tr>
        <td>审批状态</td>
        <td id="taap_state"><input type="text"></td>
    </tr>
    <tr>
        <td>审批时间</td>
        <td id="taap_sdata"><input type="text" class="demo-input" placeholder="请选择日期" id="test3"></td>
    </tr>
    <tr>
        <td>出差原因</td>
        <td id="taap_rea"><input type="text"></td>
    </tr>

    <tr>
        <td><button id="updateBtn">确认修改</button></td>
    </tr>
</table>
<table class="table">
    <tr>
        <td>出差单位</td>
        <td>出差类型</td>
        <td>申请人</td>
        <td>申请日期</td>
        <td>提交日期</td>
        <td>审批人</td>
        <td>审批状态</td>
        <td>审批时间</td>
        <td>出差原因</td>

    </tr>
</table>

<script src="${path}/lx/laydate/laydate.js"></script> <!-- 改成你的路径 -->
<script>
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#test1', //指定元素

    });
    laydate.render({
        elem: '#test2', //指定元素

    });
    laydate.render({
        elem: '#test3', //指定元素

    });
</script>

</body>
</html>
