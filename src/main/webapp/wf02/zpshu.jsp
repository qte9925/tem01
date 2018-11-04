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
                    <tr>
                        <td>编号：</td>
                        <td id="bh">Bangalore</td>
                        <td>需求部门</td>
                        <td id="bm">Mumbai</td>
                    </tr>
                    <tr>
                        <td>需求岗位：</td>
                        <td id="xqgw">Bangalore</td>
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
<div id="ccc">

<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">招聘需求</caption>
    <button class="btn  btn-xm zpjh01"><a href="zpsinsert.jsp">新建招聘计划</a></button>
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
        <Td>
            <input class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.zpxqid}}');" value="详情">
            <input class="btn btn-primary btn-xm zpjh01" type="button"  onclick="zpjh('{{i.zpxqid}}');" value="创建招聘计划">
        </Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function zpjh(id) {
        window.location.href="zpsinsert.jsp?id="+id;
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
                    $("#xqgw").text(p.jsname);
                    $("#xqrs").text(p.xuqiurenshu);
                    $("#bm").text(p.bmname);$("#ygrq").text(p.yonggongriqi02);
                    $("#qxxq").text(p.gwyaoqiu);$("#bz").text(p.beizhu);
                }
            }
        });
        $('#myModal').modal('show');
    }
    function  dd() {
        $.ajax({
            url: "${path}/bmhcx",
            type: "post",
            data:{"id":'${sessionScope.list[0].ryid}'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data[0].rybmid == 1){
                    $(".zpjh01").show();
                }else{
                    $(".zpjh01").hide();
                }

            }
        });
    }
    function gg(){
        $.ajax({
            url: "${path}/zpcx01",
            type: "post",
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
        console.log("1111"+'${sessionScope.list[0].rybmid}');
            gg();
            dd();

    });
</script>
</body>
</html>
