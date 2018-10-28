<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>请假登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">工作日历</a></button>
    <button class="btn btn-default btn-sm"><a href="#">上下班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">外出登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">出差登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">加班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">上下班记录</a></button>
</form>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="qjinsert.jsp">请假登记</a></button>
</form>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">请假登记 </caption>
    <thead >
    <tr>
        <th>请假原因</th>
        <th>请假类型</th>
        <%--<th>申请时间</th>--%>
        <%--<th>占年休假</th>--%>
        <%--<th>占倒休假</th>--%>
        <th>审批人员</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>申请销假时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr>
        <td>11</td>
        <Td>11</Td>
        <Td></Td>
        <Td></Td>
        <Td></Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function gg(){
        $.ajax({
            url: "${path}/gzrl",
            type: "post",
            // data:{"id":date.getMonth()+1},
            // data:{"id":'02'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#thead01").html("");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                        $("#thead01").append(html);
                }
            }
        });
    }
    $().ready(function () {
            // gg();
    });
</script>
</body>
</html>
