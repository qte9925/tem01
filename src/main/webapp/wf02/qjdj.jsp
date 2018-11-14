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
    <Tr>
        <td>根据进度查询</td>
        <Td>
            <select class="form-control" id="hgccc01" onchange="cxgg();" >
            <option value="10">待审核</option>
            <option value="0">审核中</option>
            <option value="1">审核通过</option>
            <option value="2">审核不通过</option>
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
    <center>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页,总共<span id="pages"></span>页
    </center>
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
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,id){
        $.ajax({
            url: "${path}/qjspxq",
            type: "post",
            data:{"ryid":'${sessionScope.list[0].ryid}',"nowPage":nowPage,"id02":id},
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
