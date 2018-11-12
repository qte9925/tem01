<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>招聘书查看</title>
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
                        <td>招聘名称</td>
                        <td id="zpsname">Mumbai</td>
                        <td>编号：</td>
                        <td id="zpsid">Bangalore</td>
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
                        <td id="skyj">无批复</td>
                        <td>审核人</td>
                        <td id="shrname">无审核人</td>
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
            <input v-if="i.skzt==0||i.skzt==3" class="btn btn-primary btn-xm" type="button" onclick="gjidcx('{{i.zpsid}}');" value="修改">
            <input v-if="i.skzt==0||i.skzt==3" class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.zpsid}}');" value="删除">
            <input v-if="i.skzt==0||i.skzt==3" class="btn btn-primary btn-xm" type="button" onclick="songshen('{{i.zpsid}}',1);" value="送审">
        </Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    //送审，修改状态
    function songshen(id01,id02) {
        if(window.confirm('你确定提交吗？')){
        $.ajax({
            url: "${path}/zpsxiugai",
            type: "post",
            data:{"zpsid":id01,
                "skzt":id02
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data==1){
                    window.location.href="zps_shengke.jsp";
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
    function zpjh(id) {
        window.location.href="zpsinsert.jsp?id="+id;
    }
    function zpxq(id){

        //手动打开模态框
        $.ajax({
            url: "${path}/gjidcx",
            type: "post",
            data:{"zpsid":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                for(var i=0;i<data.length;i++){
                    var p= data[i];
                    $("#zpsid").text(p.zpsid);
                    $("#zpsname").text(p.zpsname  );
                    $("#zhiweixinxixx").text(p.zhiweixinxixx);
                    $("#tgxinzi").text(p.tgxinzi);$("#zprs").text(p.zprs);
                    $("#fulidaiyu").text(p.fulidaiyu);$("#skyj").text(p.skyj);
                    $("#shrname").text(p.shrname);
                }
            }
        });
        $('#myModal').modal('show');
    }
    function gg(){
        $.ajax({
            url: "${path}/cxzjhs",
            type: "post",
            data:{"id":'${sessionScope.list[0].ryid}'},
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
        console.log("1111"+'${sessionScope.list[0]}');
            gg();

    });
</script>
</body>
</html>
