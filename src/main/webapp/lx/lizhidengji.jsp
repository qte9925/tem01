<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>离职登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">离职登记</a></button>
</form>
<div id="ccc">
    <table class="table table-bordered" style="margin-left: 20px;" >
        <caption id="cap">离职登记 </caption>
        <thead >
        <tr>
            <th>离职人员</th>
            <th>部门</th>
            <th>离职原因</th>
            <th>入职日期</th>
            <th>申请日期</th>
            <th>审批人员</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="thead01">
        <tr v-for="i in msg" v-if="i.qjzt!=0 && i.qjzt!=1 && i.qjzt!=2  ">
            <td>{{i.ryxm}}</td>
            <td>{{i.bmname}}</td>
            <td>{{i.lzyy}}</td>
            <Td>{{i.datetime01}}</Td>
            <Td>{{i.datetime02}}</Td>
            <Td>{{i.spname}}</Td>
            <Td v-if="i.qjzt == 3">审批中</Td>
            <Td v-if="i.qjzt == 4">审批通过</Td>
            <Td v-if="i.qjzt == 5">审批失败</Td>
            <Td> <%--<button  data-toggle="modal" data-target="#myModal">
                <a href="javascript:aaa('{{i.qjid}}')">详情</a>
            </button>--%>
                &nbsp;&nbsp;
                <button  >
                    <a href="javascript:updateqj('{{i.qjid}}',1)">通过</a>
                </button>
                &nbsp;&nbsp;
                <button  >
                    <a href="javascript:updateqj('{{i.qjid}}',2)">驳回</a>
                </button>
            </Td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function updateqj(id01,id02) {
        $.ajax({
            url: "${path}/lzdjupdate",
            data:{"spzt":id02,"lizhiid":id01},
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
            }
        });
    }

    function gg(){
        $.ajax({
            url: "${path}/lzdjselect",
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
