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
        <th>应出勤天数</th>
        <th>实际出勤天数</th>
        <th>早退次数</th>
        <th>上班未登记</th>
        <th>下班未登记</th>
        <th>迟到次数（时长）</th>
        <th>旷工天数</th>
        <th>休息天数</th>
        <th>外出次数（时长）	</th>
        <th>请假次数（时长）	</th>
        <th>出差天数</th>
        <th>加班次数（时长）</th>
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
