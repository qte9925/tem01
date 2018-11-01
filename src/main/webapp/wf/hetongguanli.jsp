<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>合同管理</title>
</head>
<body>
<div id="mcs">

<form class="form-inline" role="form" style="margin-top: 30px;">
    <button type="button" class="btn btn-default"><a href="hetong_insert.jsp">新建合同信息</a></button>
    <button type="button" class="btn btn-default"><a href="hetong_insert.jsp">合同信息查询</a></button>
    <button type="button" class="btn btn-default"><a href="hetong_insert.jsp">试用期到期查询</a></button>
    <button type="button" class="btn btn-default"><a href="hetong_insert.jsp">合同到期查询</a></button>
    <button type="button" class="btn btn-default"><a href="hetong_insert.jsp">未签劳动合同</a></button>
</form>

<table class="table table-striped">
    <caption>合同管理</caption>
    <thead>
    <tr>
        <th>名称</th>
        <th>部门</th>
        <th>岗位</th>
        <th>合同类型</th>
        <th>签署公司</th>
        <th>合同生效日期</th>
        <th>试用到期日期</th>
        <th>合同到期日期</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbody01">
        <tr v-for="item in msg">
            <Td>{{item.ryxm}}</Td>
            <Td>{{item.bmname}}</Td>
            <Td>{{item.ryxm}}</Td>
            <Td>{{item.ryxm}}</Td>
            <Td>{{item.name}}</Td>
            <Td>{{item.ryxm}}</Td>
            <Td>{{item.ryxm}}</Td>
            <Td>{{item.ryxm}}</Td>
            <Td><a href="#">详情</a> </Td>
        </tr>
    </tbody>
</table>
</div>
<script type = "text/javascript">
    $().ready(function () {
        $.ajax({
            url: "${path}/htnrcx001",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                var vm = new Vue({
                    el:'#mcs',
                    data:{
                        msg:data
                    }
                });
            }
        });
    });




</script>
</body>
</html>