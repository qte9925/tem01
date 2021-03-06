<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>考勤审批</title>
</head>
<body >
<div class="modal fade" id="myModal02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel02">
                    需求详情
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <th>审核意见</th>
                    <th>审核人</th>
                    </tbody>
                    <tbody>
                    <tr>
                        <td><input class="form-control" type="text"  id="ccd"> </td>
                        <td><input class="form-control" type="text" readonly="readonly" id="shrname" value="${sessionScope.list[0].ryxm}"> </td>
                    </tr>
                    <tr style="display: none;" >
                        <td><input type="text"  id="skzt"> </td>
                        <td><input type="text"  id="id01"> </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" onclick="updateqj()" class="btn btn-primary">
                提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">待审批</a></button>
    <button class="btn btn-default btn-sm"><a href="#">请假</a></button>
    <button class="btn btn-default btn-sm"><a href="#">出差</a></button>
    <%--<button class="btn btn-default btn-sm"><a href="#">加班</a></button>--%>
    <%--<button class="btn btn-default btn-sm"><a href="#">考勤异常</a></button>--%>
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
        <th>申请天数</th>
        <th>申请人</th>
        <th>时间</th>
        <th>摘要</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
        <tr v-for="i in msg" v-if="i.tianshu>3&&i.qjzt==11||i.qjzt==10">
            <td v-if="i.qjzt==10" >请假</td>
            <td v-if="i.qjzt==11" >出差</td>
            <td v-if="i.tianshu==0">小于1天</td>
            <td v-if="i.tianshu>0">{{i.tianshu}}天</td>
            <td>{{i.ryxm}}</td>
            <td>{{i.ksrq}}&nbsp;&nbsp;至&nbsp;&nbsp;{{i.jsrq}}</td>
            <td>{{i.qjyanyin}}</td>
            <td>
                <button  data-toggle="modal" data-target="#myModal"  class="btn btn-default" >
                    <a href="javascript:aaa('{{i.qjid}}')">详情</a>
                </button>
                <button  v-if="i.qjzt==10" class="btn btn-default"  >
                    <a href="javascript:aa01('{{i.qjid}}',1)">审批</a>
                </button>
                <button  v-if="i.qjzt==11" class="btn btn-default" >
                    <a href="javascript:aa01('{{i.qjid}}',4)">审批</a>
                </button>
                <button  v-if="i.qjzt==10"  class="btn btn-default" >
                    <a href="javascript:aa01('{{i.qjid}}',2)">驳回</a>
                </button>
                <button  v-if="i.qjzt==11"  class="btn btn-default" >
                    <a href="javascript:aa01('{{i.qjid}}',5)">驳回</a>
                </button>
            </td>
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
    function  aa01(id01,id02) {
        $("#id01").val(id01);
        $("#skzt").val(id02);
        $('#myModal02').modal('show');
    }
    function updateqj() {
        $.ajax({
            url: "${path}/updateqj",
            data:{"qjzt":$("#skzt").val(),
                "shenpiyijian":$("#ccd").val(),
                "shenpirenid":'${sessionScope.list[0].ryid}',
                "sprname":'${sessionScope.list[0].ryxm}',
                "qjid": $("#id01").val()
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
    function aaa(id) {
        $.ajax({
            url: "${path}/cxqinjiq02",
            data:{"id":id},
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                $("#tbo01").html("");
                if(data02[0].qjzt==10){
                    $("#myModalLabel").text("请假类型详情")
                }
                if(data02[0].qjzt==11){
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
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,id){
        $.ajax({
            url: "${path}/cxqj03",
            type: "post",
            data:{"id":'${sessionScope.list[0].ryid}',"nowPage":nowPage,"id02":id},
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
