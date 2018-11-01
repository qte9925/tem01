<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>请假登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="grkq.jsp">工作日历</a></button>
    <button class="btn btn-default btn-sm"><a href="sxbdj.jsp">上下班登记</a></button>
    <%--<button class="btn btn-default btn-sm"><a href="#">外出登记</a></button>--%>
    <button class="btn btn-default btn-sm"><a href="qjdj.jsp">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="ccdj.jsp">出差登记</a></button>
    <%--<button class="btn btn-default btn-sm"><a href="#">加班登记</a></button>--%>
    <button class="btn btn-default btn-sm"><a href="rcjl.jsp">上下班记录</a></button>
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
    <tr v-for="i in msg">
        <td>{{i.yuanyin}}</td>
        <Td>{{i.qjlxname}}</Td>
        <Td>{{i.shenpi}}</Td>
        <Td>{{i.ksrq}}</Td>
        <Td>{{i.jsrq}}</Td>
        <Td v-if="i.qjxj == 0">未申请销假</Td>
        <Td v-if="i.qjxj == 1">申请销假中</Td>
        <Td v-if="i.qjxj == 2">销假审批成功</Td>
        <Td v-if="i.qjxj == 3">销假审批失败</Td>
        <Td v-if="i.qjzt == 0">审批中</Td>
        <Td v-if="i.qjzt == 1">审批通过</Td>
        <Td v-if="i.qjzt == 2">审批失败</Td>
        <Td>详情</Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function gg(){
        $.ajax({
            url: "${path}/qjspxq",
            type: "post",
            // data:{"id":date.getMonth()+1},
            // data:{"id":'02'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                var vm = new Vue({
                    el:'#ccc',
                    data:{
                        msg:data
                    }
                });
            }
        });
    }
    $().ready(function () {
            gg();
    });
</script>
</body>
</html>
