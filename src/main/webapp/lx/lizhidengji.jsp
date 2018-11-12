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
        <tr v-for="i in msg" v-if="i.spzt!=0 && i.spzt!=1 && i.spzt!=2  ">
            <td>{{i.ryxm}}</td>
            <td>{{i.bmname}}</td>
            <td>{{i.lzyy}}</td>
            <Td>{{i.datetime01}}</Td>
            <Td>{{i.datetime02}}</Td>
            <Td>{{i.spname}}</Td>
            <Td v-if="i.spzt == 3">审批中</Td>
            <Td v-if="i.spzt == 4">审批通过</Td>
            <Td v-if="i.spzt == 5">审批失败</Td>
            <Td>
                <button>
                    <a href="javascript:lzdjupdate('{{i.lizhiid}}','{{i.spzt+1}}')">通过</a>
                </button>
                &nbsp;&nbsp;
                <button>
                    <a href="javascript:lzdjupdate('{{i.lizhiid}}','{{i.spzt+2}}')">反对</a>
                </button>
            </Td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function lzdjupdate(lizhiid,spzt) {
        $.ajax({
            url: "${path}/lzdjupdate",
            data:{"spzt":spzt,"lizhiid":lizhiid},
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                if(data02>0){
                    window.location.reload();
                }
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
                console.log("aaaa"+data);
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
