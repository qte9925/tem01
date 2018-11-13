<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>考勤记录</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">考勤记录</a></button>
</form>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">上下班记录 </caption>
    <thead >
    <tr>
        <th>人员名称</th>
        <th>上班天数</th>
        <th>病假时长</th>
        <th>事假时长</th>
        <th>迟到时长</th>
        <th>早退时长</th>
        <th>转正天数</th>
        <th>旷工天数</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="i in msg">

    </tr>
    </tbody>
</table>
    <table class="table table-bordered" style="margin-left: 20px;" >
        <caption id="cap01">考勤记录 </caption>
        <thead >
        <tr>
            <th>日期</th>
            <th>第一次登记</th>
            <th>最后一次登记</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="thead0101">
        <tr v-for="i in msg">

        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function gg(){
        $.ajax({
            url: "${path}/cxqinjiq",
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
