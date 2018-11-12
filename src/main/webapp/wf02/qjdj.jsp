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
    <button class="btn btn-default btn-sm"><a href="qjdj.jsp">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="ccdj.jsp">出差登记</a></button>
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
        <Td>
            <input class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.qjid}}');" value="详情">
            <input v-if="i.qjzt==0||i.qjzt==3" class="btn btn-primary btn-xm" type="button" onclick="gjidcx('{{i.qjid}}');" value="修改">
            <input v-if="i.qjzt==0||i.qjzt==3" class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.qjid}}');" value="删除">
            <input v-if="i.qjzt==0||i.qjzt==3" class="btn btn-primary btn-xm" type="button" onclick="songshen('{{i.qjid}}',1);" value="送审">
        </Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function songshen(a1,a2) {
        $.ajax({
            url: "${path}/updateqj",
            data:{"qjzt":a2,
                "shenpiyijian":'',
                "shenpirenid":0,
                "sprname":0,
                "qjid": a1
            },
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                if(data02!=0){
                    window.location.reload();
                }else{
                    alert("提交失败");
                }
            }
        });
    }
    function gg(){
        $.ajax({
            url: "${path}/qjspxq",
            type: "post",
            data:{"ryid":'${sessionScope.list[0].ryid}'},
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
