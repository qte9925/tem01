<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>出差登记</title>
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
    <button class="btn btn-default btn-sm"><a href="ccinsert.jsp">出差登记</a></button>
</form>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">出差登记 </caption>
    <thead >
    <tr>
        <th>出差人员</th>
        <th>出差地点</th>
        <th>出差原因</th>
        <th>开始日期</th>
        <th>结束日期</th>
        <th>审批人员</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="i in msg" v-if="i.qjzt!=0 && i.qjzt!=1 && i.qjzt!=2  ">
        <td>{{i.ryxm}}</td>
        <td>{{i.chuchaididian}}</td>
        <td>{{i.yuanyin}}</td>
        <Td>{{i.ksrq}}</Td>
        <Td>{{i.jsrq}}</Td>
        <Td>{{i.shenpi}}</Td>
        <Td v-if="i.qjzt == 3">审批中</Td>
        <Td v-if="i.qjzt == 4">审批通过</Td>
        <Td v-if="i.qjzt == 5">审批失败</Td>
        <Td>详情</Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function gg(){
        $.ajax({
            url: "${path}/cxqbcc",
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
