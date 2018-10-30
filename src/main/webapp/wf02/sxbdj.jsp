<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>上下班登记</title>
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
    <%--<button class="btn btn-default btn-sm"><a href="qjinsert.jsp">上下班登记</a></button>--%>
    <input type="button" class="btn btn-default btn-sm" id="cccc" value="点击签到" onclick="qiandao();">
</form>
<script type="text/javascript">
    function qiandao() {
        console.log("点击签到");
        $.ajax({
            url: "${path}/qdinsert",
            type: "post",
            data:{"id006":1},
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data!==0){
                    history.go(0);
                }
            }
        });
    }
</script>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap01">本日工作时间详情 </caption>
    <thead >
    <tr>
        <th align="center">编号</th>
        <th align="center">日期</th>
        <th align="center">上午上班时间</th>
        <th align="center">上午下班时间</th>
        <th align="center">下午上班时间</th>
        <th align="center">下午下班时间</th>
    </tr>
    </thead>
    <tbody id="thead02">

    </tbody>
</table>
    <table class="table table-bordered" style="margin-left: 20px;" >
        <caption id="cap">该日签到详情 </caption>
        <thead >
        <tr>
            <th align="center">签到编号</th>
            <th align="center">签到人员</th>
            <th align="center">签到时间</th>
            <th align="center">签到状态</th>
            <th align="center">操作</th>
        </tr>
        </thead>
        <tbody id="thead01">
        <tr >
            <td align="center">1</td>
            <td align="center">2</td>
            <td align="center">3</td>
            <Td align="center">4</Td>
            <Td align="center">5</Td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function gg(){
        $.ajax({
            url: "${path}/cxsxb02",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data[0].sfgz==1){
                    $("#thead02").html("<h2>非工作日</h2>");
                    document.getElementById("cccc").setAttribute("disabled", true);
                }
                if(data[0].sfgz==0){
                    $("#thead02").html("");
                    document.getElementById("cccc").removeAttribute("disabled");
                    for(var i=0;i<data.length;i++){
                        var p = data[i]
                        var bh = Number(i)+1;
                        var tr='<tr >'+
                            '<td align="center">'+bh+'</td>'+
                            '<td align="center">'+p.DAY_SHORT_DESC+'</td>'+
                            '<td align="center">'+p.swsbsj+'</td>'+
                            '<td align="center">'+p.swxbsj+'</td>'+
                            '<Td align="center">'+p.xwsbsj+'</Td>'+
                            '<Td align="center">'+p.xwxbsj+'</Td>'+
                            '</tr>';
                        $("#thead02").append(tr);
                    }
                }
            }
        });
    }
    function gg02(){
        $.ajax({
            url: "${path}/ygbrqd",
            type: "post",
            data:{"id":1},
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#thead01").html("")
                for(var i=0;i<data.length;i++){
                    var p = data[i]
                    var bh = Number(i)+1;
                    var tr='<tr >'+
                        '<td align="center">本日第'+bh+'次签到</td>'+
                        '<td align="center">'+p.ryxm+'</td>'+
                        '<td align="center">'+p.ss+'</td>';
                            if(p.qdstatic==0){
                               tr=tr+ '<td align="center">成功</td>';
                            }
                    if(p.qdstatic!=0){
                        tr=tr+ '<td align="center">失败</td>';
                    }
                    tr=tr+'<Td align="center"><a href="#">详情</a></Td>'+
                        '</tr>';
                    $("#thead01").append(tr);
                }
            }
        });
    }
    $().ready(function () {
            gg();
        gg02();
    });
</script>
</body>
</html>
