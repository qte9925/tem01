<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>招聘需求</title>
</head>
<body >


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    需求详情
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr style="display:none;">
                        <td>编号：</td>
                        <td id="bh">Bangalore</td></tr><tr>
                        <td>需求部门</td>
                        <td id="bm">Mumbai</td>
                    </tr>
                    <tr>
                        <td>需求岗位：</td>
                        <td id="xqgw">Bangalore</td></tr><tr>
                        <td>需求人数</td>
                        <td id="xqrs">Mumbai</td>
                    </tr>
                    <tr>
                        <td>用工日期</td>
                        <td id="ygrq">Pune</td>
                    </tr>
                    <tr>
                        <td>需求详情</td>
                        <td id="qxxq">Pune</td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td id="bz">Pune</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <%--<button type="button" class="btn btn-primary">--%>
                <%--提交更改--%>
                <%--</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="xiugaicc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel010">
                    需求详情
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr style="display:none;">
                        <td>编号：</td>
                        <td ><input type="text" class="form-control" id="bh01"> </td>
                    </tr>
                    <tr>
                        <td>需求部门</td>
                        <td ><input type="text" class="form-control" id="bm01" readonly> </td>
                    </tr>
                    <tr>
                        <td>需求岗位：</td>
                        <td ><input type="text" class="form-control" id="xqgw01" readonly> </td>
                    </tr>
                    <tr>
                        <td>需求人数</td>
                        <td ><input type="text" class="form-control" id="xqrs01" readonly> </td>
                    </tr>
                    <tr>
                        <td>用工日期</td>
                        <td ><input type="text" class="form-control" id="ygrq01" readonly> </td>
                    </tr>
                    <tr>
                        <td>需求详情</td>
                        <td ><input type="text" class="form-control" id="qxxq01"> </td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td ><input type="text" class="form-control" id="bz01"> </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="xiugaizpxq();">
                提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="zhaopininsert.jsp">制定招聘需求</a></button>
</form>
<div id="ccc">

<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">招聘需求</caption>
    <thead >
    <Tr>
        <td>查询需求人数</td>
        <Td><input type="text" class="form-control" value="0" id="hgccc01" ></Td>&nbsp;
        <Td><input type="button" class="form-control" value="查询" onclick="cxgg();" ></Td>
    </Tr>
    <script>
        function cxgg() {
            var tgxz001 = $("#hgccc01").val();
            console.log(tgxz001);
            gg(undefined,tgxz001);
        }
    </script>
    <tr>
        <th>需求编号</th>
        <th>需求人数</th>
        <th>需求部门</th>
        <th>用工日期</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="(index,i) in msg">
        <td>{{index+1}}</td>
        <Td>{{i.xuqiurenshu}}</Td>
        <Td>{{i.bmname}}</Td>
        <Td>{{i.yonggongriqi02}}</Td>
        <Td>{{i.beizhu}}</Td>
        <Td>
            <input class="btn btn-primary btn-xm"  type="button" onclick="zpxq('{{i.zpxqid}}');" value="详情">
            <input class="btn btn-primary btn-xm" v-if="i.djid == ${sessionScope.list[0].ryid}" type="button" onclick="dakaixiugai('{{i.zpxqid}}')" value="修改"  />
            <input class="btn btn-primary btn-xm" v-if="i.djid == ${sessionScope.list[0].ryid}"  type="button" onclick="deletesczpxq('{{i.zpxqid}}')" value="删除"  />
            <%--<input class="btn btn-primary btn-xm" v-if="i.djid == ${sessionScope.list[0].ryid}"  type="button" onclick="tjzt('{{i.zpxqid}}')" value="提交"  />--%>
        </Td>
    </tr>
    </tbody>
</table>
    <center>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页
    </center>
</div>
<script type="text/javascript">
    // function tjzt() {
    //
    // }
    //查询修改
    function dakaixiugai(id) {
        $.ajax({
            url: "${path}/zpcx02",
            type: "post",
            data:{"zpxqid":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                for(var i=0;i<data.length;i++){
                    var p= data[i];
                    $("#bh01").val(p.zpxqid);
                    $("#xqrs01").val(p.xuqiurenshu);
                    $("#xqgw01").val(p.jsname);
                    $("#bm01").val(p.bmname);
                    $("#ygrq01").val(p.yonggongriqi02);
                    $("#qxxq01").val(p.gwyaoqiu);
                    $("#bz01").val(p.beizhu);
                }
            }
        });
        $('#xiugaicc').modal('show');
    }
    function xiugaizpxq() {
        var beizhu = $("#bz01").val();
        var gwyaoqiu = $("#qxxq01").val();
        var zpxqid = $("#bh01").val();
        $.ajax({
            url: "${path}/xiugaizpxq",
            type: "post",
            data:{
                "beizhu":beizhu,
                "gwyaoqiu":gwyaoqiu,
                "zpxqid":zpxqid
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data==1){
                    window.location.reload();
                }else{
                    alert("删除失败");
                }
            }
        });
    }
    function deletesczpxq(id) {
        if(window.confirm('你确定删除吗？')){
            $.ajax({
                url: "${path}/deletesczpxq",
                type: "post",
                data:{"zpxqid":id
                },
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data==1){
                        window.location.reload();
                    }else{
                        alert("删除失败");
                    }
                }
            });
            return true;
        }else{
            console.log("不确定");
            return false;
        }
    }
    function zpxq(id){

        //手动打开模态框
        $.ajax({
            url: "${path}/zpcx02",
            type: "post",
            data:{"zpxqid":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                for(var i=0;i<data.length;i++){
                    var p= data[i];
                    $("#bh").text(p.zpxqid);
                    $("#xqrs").text(p.xuqiurenshu);
                    $("#xqgw").text(p.jsname);
                    $("#bm").text(p.bmname);$("#ygrq").text(p.yonggongriqi02);
                    $("#qxxq").text(p.gwyaoqiu);$("#bz").text(p.beizhu);
                }
            }
        });
        $('#myModal').modal('show');
    }
    //分页
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,a01){
        $.ajax({
            url: "${path}/zpcxgrbm",
            type: "post",
            data:{"a1":'${sessionScope.list[0].ryid}',"nowPage":nowPage,"xqrs001":a01},
            dataType: "json",
            success: function (data) {
                console.log(data);
                StaffJobChangeApplication.msg = data.list;
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);
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
    $(function () {
        $("#ygrq01").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });
</script>
</body>
</html>
