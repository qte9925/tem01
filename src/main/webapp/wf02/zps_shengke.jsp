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
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal）修改 -->
<div class="modal fade" id="xiugai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="xiugai01">
                    需求详情
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>招聘名称</td>
                        <td><input type="text" class="form-control"  id="zpsname01"></td>
                    </tr>
                    <tr style="display: none;">
                        <td>编号：</td>
                        <td><input type="text" class="form-control"  id="zpsid01" ></td>
                    </tr>
                    <tr>
                        <td>岗位要求：</td>
                        <td><input type="text" class="form-control"  id="zhiweixinxixx01"></td>

                    </tr>
                    <tr>
                        <td>提供最低薪资</td>
                        <td><input type="text" class="form-control"  id="tgxinzi01"></td>
                    </tr>
                    <tr>
                        <td>提供最高薪资</td>
                        <td><input type="text" class="form-control"  id="tgxinzi02"></td>
                    </tr>
                    <tr>
                        <td>招聘人数</td>
                        <td><input type="text" class="form-control"  id="zprs01" readonly></td>
                    </tr>
                    <tr>
                        <td>福利待遇</td>
                        <td><input type="text" class="form-control"  id="fulidaiyu01"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭 </button>
                <button type="button" class="btn btn-default"  onclick="updatewfzps01();">提交更改 </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div id="ccc">

<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">招聘需求</caption>
    <button class="btn  btn-xm zpjh01"><a href="zpsinsert.jsp">新建招聘计划</a></button>
    <thead >
    <Tr>
        <td>根据薪资查询</td>
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
        <th>编号</th>
        <th>招聘名称</th>
        <th>需求人数</th>
        <th>登记时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="(index,i) in msg">
        <td>{{index+1}}</td>
        <Td>{{i.zpsname}}</Td>
        <Td>{{i.zprs}}</Td>
        <Td>{{i.djsj01}}</Td>
        <Td v-if="i.skzt==0">待审核</Td>
        <Td v-if="i.skzt==1">审核中</Td>
        <Td v-if="i.skzt==2">审核通过</Td>
        <Td v-if="i.skzt==3">审核不通过</Td>
        <Td>
            <input class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.zpsid}}');" value="详情">
            <input v-if="i.skzt==0||i.skzt==3" class="btn btn-primary btn-xm" type="button" onclick="xiugai('{{i.zpsid}}');" value="修改">
            <input v-if="i.skzt==0||i.skzt==3" class="btn btn-primary btn-xm" type="button" onclick="deletewfzps('{{i.zpsid}}');" value="删除">
            <input v-if="i.skzt==0||i.skzt==3" class="btn btn-primary btn-xm" type="button" onclick="songshen('{{i.zpsid}}',1);" value="送审">
        </Td>
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
    //删除
    function  deletewfzps(id01){
        if(window.confirm('你确定删除吗？')){
            $.ajax({
                url: "${path}/deletewfzps",
                type: "post",
                data:{"id":id01
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
    //打开修改模态框
    function xiugai(id) {
        cxzz(id);
        // $("#zpsid01").val(id);
        $('#xiugai').modal('show');
    }
    function cxzz(id) {
        $.ajax({
            url: "${path}/gjidcx",
            type: "post",
            data:{"zpsid":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                for(var i=0;i<data.length;i++){
                    var p= data[i];
                    $("#zpsid01").val(p.zpsid);
                    $("#zpsname01").val(p.zpsname);
                    $("#zhiweixinxixx01").val(p.zhiweixinxixx);
                    $("#tgxinzi01").val(p.tgxinzi02);
                    $("#tgxinzi02").val(p.tgxinzi);
                    $("#zprs01").val(p.zprs);
                    $("#fulidaiyu01").val(p.fulidaiyu);
                }
            }
        });
    }
    //修改详情
    function updatewfzps01() {
        console.log("修改详情");
        var zpsname = $("#zpsname01").val();
        var zhiweixinxixx = $("#zhiweixinxixx01").val();
        var tgxinzi02 = $("#tgxinzi01").val();
        var tgxinzi = $("#tgxinzi02").val();
        var zprs = $("#zprs01").val();
        var fulidaiyu = $("#fulidaiyu01").val();
        var zpsid = $("#zpsid01").val();
        $.ajax({
            url: "${path}/updatewfzps01",
            type: "post",
            data:{
                "zpsname":zpsname,
                "zhiweixinxixx":zhiweixinxixx,
                "tgxinzi02":tgxinzi02,
                "tgxinzi":tgxinzi,
                "zprs":zprs,
                "fulidaiyu":fulidaiyu,
                "zpsid":zpsid
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
    }
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
                    $("#tgxinzi").text(p.tgxinzi02+"至"+p.tgxinzi);$("#zprs").text(p.zprs);
                    $("#fulidaiyu").text(p.fulidaiyu);$("#skyj").text(p.skyj);
                    $("#shrname").text(p.shrname);
                }
            }
        });
        $('#myModal').modal('show');
    }

    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,id){
        $.ajax({
            url: "${path}/cxzjhs",
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
