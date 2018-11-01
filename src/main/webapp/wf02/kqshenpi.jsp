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
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" >
                    请假申请详情
                </h4>
            </div>
            <div class="modal-body" id="ccc01">
                <table class="table" >
                    <tbody id="tbo01">
                    <tr>
                        <td>所在部门</td>
                        <td>{{msg01[0].bmname}}</td>
                    </tr>
                    <tr>
                        <td>请假人员</td>
                        <td>{{msg01[0].ryxm}}</td>
                    </tr>
                    <tr>
                        <td>申请时间</td>
                        <td>{{msg01[0].qjsj}}</td>
                    </tr>
                    <tr>
                        <td>开始时间</td>
                        <td>{{msg01[0].ksrq}}</td>
                    </tr>
                    <tr>
                        <td>结束时间</td>
                        <td>{{msg01[0].jsrq}}</td>
                    </tr>
                    <tr>
                        <td>请假原因</td>
                        <td>{{msg01[0].yuanyin}}</td>
                    </tr>
                    <tr>
                        <td>申请类型</td>
                        <td>{{msg01[0].qjlxname}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div id="ccc">
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
        <tr v-for="i in msg">
            <td v-if="i.qjzt==0" >请假</td>
            <td v-if="i.qjzt==3" >出差</td>
            <td>{{i.ryxm}}</td>
            <td>{{i.jsrq}}&nbsp;&nbsp;至&nbsp;&nbsp;{{i.ksrq}}</td>
            <td>{{i.yuanyin}}</td>
            <td>
                <button  data-toggle="modal" data-target="#myModal">
                    <a href="javascript:aaa('{{i.qjid}}')">详情</a>
                </button>
                 &nbsp;&nbsp;
                <button  >
                    <a href="javascript:updateqj('{{i.qjid}}','{{i.qjzt+1}}')">通过</a>
                </button>
                &nbsp;&nbsp;
                <button  >
                    <a href="javascript:updateqj('{{i.qjid}}','{{i.qjzt+2}}')">驳回</a>
                </button>
        </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function updateqj(id01,id02) {
        $.ajax({
            url: "${path}/updateqj",
            data:{"qjzt":id02,"qjid":id01},
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);

            }
        });
    }
    function aaa(id) {
        $.ajax({
            url: "${path}/cxqinjiq02",
            data:{"id":id},
            type: "post",
            // data:{"id":date.getMonth()+1},
            // data:{"id":'02'},
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                $("#tbo01").html("");
                if(data02[0].qjzt==0){
                    $("#myModalLabel").text("请假类型详情")
                }
                if(data02[0].qjzt==3){
                    $("#myModalLabel").text("出差类型详情")
                }
                for(var i=0;i<data02.length;i++){
                    var html=' <tbody id="tbo01">';
                    var html='         <tr>';
                    html=html+'       <td>所在部门</td>';
                    html=html+'       <td>'+data02[0].bmname+'</td>';
                    html=html+'   </tr>';
                    html=html+'  <tr>';
                    html=html+'   <td>请假人员</td>';
                    html=html+'  <td>'+data02[0].ryxm+'</td>';
                    html=html+'  </tr>';
                    html=html+'   <tr>';
                    html=html+'   <td>申请时间</td>';
                    html=html+'   <td>'+data02[0].qjsj+'</td>';
                    html=html+'   </tr>';
                    html=html+'  <tr>';
                    html=html+'   <td>开始时间</td>';
                    html=html+'   <td>'+data02[0].ksrq+'</td>';
                    html=html+'   </tr>';
                    html=html+'   <tr>';
                    html=html+'   <td>结束时间</td>';
                    html=html+'  <td>'+data02[0].jsrq+'</td>';
                    html=html+'  </tr>';
                    html=html+'  <tr>';
                    html=html+'  <td>请假原因</td>';
                    html=html+'   <td>'+data02[0].yuanyin+'</td>';
                    html=html+'   </tr>';
                    // html=html+'  <tr>';
                    // html=html+'  <td>申请类型</td>';
                    // html=html+'  <td>'+data02[0].qjlxname+'</td>';
                    // html=html+'  </tr>';
                    $("#tbo01").append(html);
                }
                // var vm02 = new Vue({
                //     el:'#myModal',
                //     data:{
                //         msg01:data02
                //     }
                // });
            }
        });
    }
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
