<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>招聘书审核</title>
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
                        <th>审核意见</th>
                        <th>审核人</th>
                    </tbody>
                    <tbody>
                    <tr>
                        <td><input class="form-control" type="text"  id="skyj"> </td>
                        <td><input class="form-control" type="text" readonly="readonly" id="shrname" value="${sessionScope.list[0].ryxm}"> </td>
                    </tr>
                    <tr style="display: none;" >
                        <td><input type="text"  id="skzt"> </td>
                        <td><input id="zpsid" value="${sessionScope.list[0].ryxm}"> </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" onclick="tj();" class="btn btn-primary">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel01">
                    需求详情
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>招聘名称</td>
                        <td id="zpsname">Mumbai</td>
                        <td>编号：</td>
                        <td id="zpsid01">Bangalore</td>
                    </tr>
                    <tr>
                        <td>岗位要求：</td>
                        <td id="zhiweixinxixx">Bangalore</td>
                        <td>提供薪资</td>
                        <td id="tgxinzi">Mumbai</td>
                    </tr>
                    <tr>
                        <td>招聘人数</td>
                        <td id="zprs">Pune</td>
                    </tr>
                    <tr>
                        <td>福利待遇</td>
                        <td id="fulidaiyu">Pune</td>
                    </tr>
                    <tr>
                        <td>审核人批复</td>
                        <td id="skyj01">无批复</td>
                        <td>审核人</td>
                        <td id="shrname01">无审核人</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" onclick="tj();" class="btn btn-primary">
                    提交
                </button>
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
        <th>招聘书编号</th>
        <th>招聘名称</th>
        <th>需求人数</th>
        <th>登记时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="i in msg">
        <td>{{i.zpsid}}</td>
        <Td>{{i.zpsname}}</Td>
        <Td>{{i.zprs}}</Td>
        <Td>{{i.djsj01}}</Td>
        <Td v-if="i.skzt==0">待审核</Td>
        <Td v-if="i.skzt==1">审核中</Td>
        <Td v-if="i.skzt==2">审核通过</Td>
        <Td v-if="i.skzt==3">审核不通过</Td>
        <Td>
            <input class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.zpsid}}');" value="详情">
            <input v-if="i.skzt==1" class="btn btn-primary btn-xm" type="button" onclick="mt('{{i.zpsid}}',2);" value="通过">
            <input v-if="i.skzt==1" class="btn btn-primary btn-xm" type="button" onclick="mt('{{i.zpsid}}',3);" value="驳回">
        </Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    function  sqspi() {

    }
    function mt(id01,id02) {
        $('#zpsid').val(id01);
        $('#skzt').val(id02);
        $('#myModal').modal('show');

    }
    //送审，修改状态
    function tj() {
        if(window.confirm('你确定提交吗？')){
        $.ajax({
            url: "${path}/zpsxiugai",
            type: "post",
            data:{"zpsid":$('#zpsid').val(),
                "skzt":$('#skzt').val(),
                "skyj":$('#skyj').val(),
                "shrid":'${sessionScope.list[0].ryid}',
                "shrname":'${sessionScope.list[0].ryxm}'
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data==1){
                    window.location.href="zps_shengke02.jsp";
                }else{
                    alert("修改失败");
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
                    $("#zpsid01").text(p.zpsid);
                    $("#zpsname").text(p.zpsname  );
                    $("#zhiweixinxixx").text(p.zhiweixinxixx);
                    $("#tgxinzi").text(p.tgxinzi);$("#zprs").text(p.zprs);
                    $("#fulidaiyu").text(p.fulidaiyu);$("#skyj01").text(p.skyj);
                    $("#shrname01").text(p.shrname);
                }
            }
        });
        $('#myModal01').modal('show');
    }
    function gg(){
        $.ajax({
            url: "${path}/daishenkecx",
            type: "post",
            data:{"id":1},
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

    });
</script>
</body>
</html>
