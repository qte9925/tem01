<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>招聘需求</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="zhaopininsert.jsp">制定招聘需求</a></button>
</form>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">招聘需求</caption>
    <thead >
    <tr>
        <th>需求编号</th>
        <th>需求岗位</th>
        <th>需求人数</th>
        <th>需求部门</th>
        <th>用工日期</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="i in msg">
        <td>{{i.zpxqid}}</td>
        <Td>{{i.xuqiugangwei}}</Td>
        <Td>{{i.xuqiurenshu}}</Td>
        <Td>{{i.bmname}}</Td>
        <Td>{{i.yonggongriqi02}}</Td>
        <Td><input type="button" value="详情"></Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function gg(){
        $.ajax({
            url: "${path}/zpcx01",
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
