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
    <button class="btn btn-default btn-sm"><a href="qjdj.jsp">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="ccdj.jsp">出差登记</a></button>
    <button class="btn btn-default btn-sm"><a href="rcjl.jsp">上下班记录</a></button>
</form>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="ccinsert.jsp">出差登记</a></button>
</form>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">出差登记 </caption>
    <thead >
    <Tr>
        <td>根据进度查询</td>
        <Td>
            <select class="form-control" id="hgccc01" onchange="cxgg();" >
                <option value="10">待审核</option>
                <option value="3">审核中</option>
                <option value="4">审核通过</option>
                <option value="5">审核不通过</option>
            </select>
        </Td>
    </Tr>
    <script>
        function cxgg() {
            var tgxz001 = $("#hgccc01").val();
            console.log(tgxz001);
            gg(undefined,tgxz001);
        }
    </script>
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
    <center>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页,总共<span id="pages"></span>页
    </center>
</div>
<script type="text/javascript">
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,id){
        $.ajax({
            url: "${path}/cxqbcc",
            type: "post",
            data:{"id":'${sessionScope.list[0].ryid}',"nowPage":nowPage,"id02":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                StaffJobChangeApplication.msg = data.list;
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);
                $("#pages").html(data.pages);
                //最后一页的下一页显示隐藏
                if(data.isLastPage){
                    $("#next").hide();
                }else{
                    $("#next").show();
                }
                //第一页的上一页显示隐藏

                if(data.isFirstPage){
                    $("#pre").hide();
                }else{
                    $("#pre").show();
                }
            }
        });
    }
    function fy(op) {
        var nowPage = $("#nowPage").html();
        if (op == 'next') nowPage = Number(nowPage) + 1;
        else nowPage = Number(nowPage) - 1;
        gg(nowPage);
    };
    $().ready(function () {
        <%--console.log("1111"+'${sessionScope.list[0].rybmid}');--%>
        gg(1);
    });
</script>
</body>
</html>
