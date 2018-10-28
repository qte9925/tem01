<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>考勤审批</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">待审批</a></button>
    <button class="btn btn-default btn-sm"><a href="#">请假</a></button>
    <button class="btn btn-default btn-sm"><a href="#">出差</a></button>
    <button class="btn btn-default btn-sm"><a href="#">加班</a></button>
    <button class="btn btn-default btn-sm"><a href="#">考勤异常</a></button>
</form>
<%--<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">--%>
    <%--<button class="btn btn-default btn-sm"><a href="javascript:gg();">请假登记</a></button>--%>
<%--</form>--%>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">待审批 </caption>
    <thead >
    <tr>
        <th>类型</th>
        <th>申请人</th>
        <th>时间</th>
        <th>摘要</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">

    </tbody>
</table>
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
