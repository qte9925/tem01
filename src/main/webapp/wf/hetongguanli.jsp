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
</form>

<table class="table table-striped">
    <caption>合同管理</caption>
    <thead>
    <tr>
        <th>名称</th>
        <th>部门</th>
        <th>合同类型</th>
        <th>合同签订日期</th>
        <th>合同生效日期</th>
        <th>合同到期日期</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbody01">
        <tr v-for="item in msg">
            <Td>{{item.ryxm}}</Td>
            <Td>{{item.bmname}}</Td>
            <Td>{{item.name}}</Td>
            <Td>{{item.ksrq02}}</Td>
            <Td>{{item.sxrq02}}</Td>
            <Td>{{item.jsrq02}}</Td>
            <Td><a href="#">详情</a> </Td>
        </tr>
    </tbody>
</table>
</div>
<script type = "text/javascript">
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#mcs',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,id) {
        $.ajax({
            url: "${path}/htnrcx001",
            data:{"nowPage":nowPage,"id02":id},
            type: "post",
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
        gg(1);
    });

</script>
</body>
</html>
