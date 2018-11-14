<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>TEM 招聘</title>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>TEM公司招聘</h1>
</div>
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
                        <td id="zpsid">Bangalore</td>
                    </tr>
                    <Tr>
                        <td>招聘名称</td>
                        <td id="zpsname">Mumbai</td>
                    </Tr>
                    <Tr>
                        <td>岗位要求：</td>
                        <td id="zhiweixinxixx">Bangalore</td>
                    </Tr>
                    <tr>
                        <td>提供薪资</td>
                        <td id="tgxinzi">Mumbai</td>
                    </tr>
                    <tr>
                        <td>招聘人数</td>
                        <td id="zprs">Pune</td>
                    </tr>
                    <tr>
                        <td>招聘登记时间</td>
                        <td id="djsj">Pune</td>
                    </tr>
                    <tr>
                        <td>福利待遇</td>
                        <td id="fulidaiyu">Pune</td>
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
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar">11111</span>
                <span class="icon-bar">22222</span>
                <span class="icon-bar">33333</span>
            </button>
            <a class="navbar-brand" href="#">网站名</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <%--<li class="active"><a href="#">招聘主页</a></li>--%>
                <li><a href="/wf02/a_index.jsp">招聘主页</a></li>
                <li><a href="javascript:jl();">我的简历</a></li>
                <li><a href="#">我的投递</a></li>
                <li><a href="#">通知</a></li>
            </ul>
            <span class="collapse navbar-collapse" style="float: right;">
            <ul class="nav navbar-nav">
                <li><a href="a_login.jsp">退出</a></li>
            </ul>
        </span>
        </div>

    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-sm-3" style="margin-left: -15%;">
            <%--<h2>${sessionScope.list[0]}</h2>--%>
            <h4>当前登录人:</h4>
            <%--<div class="fakeimg">这边插入图像</div>--%>
                <p><h2 style="color: #1a5d7e"><a href="#">${sessionScope.list[0].shoujihao}</a></h2></p>
            <h3>链接</h3>
            <%--<h3>链接${sessionScope.list[0]}</h3>--%>
            <p>当前介绍</p>
            <ul class="nav nav-pills nav-stacked">
                <%--<li class="active"><a href="a_zhuche.jsp">我的简历</a></li>--%>
                <li><a href="/wf02/a_jlupdate.jsp">我的简历</a></li>
                <li><a href="/wf02/a_wodetoudi.jsp">我的投递</a></li>
                <li><a href="#">通知</a></li>
            </ul>
            <hr class="hidden-sm hidden-md hidden-lg">
        </div>
        <div class="col-sm-8">
            <%--<h2>标题</h2>--%>
            <%--<h5>副标题</h5>--%>
            <%--<div class="fakeimg">图像</div>--%>
            <%--<p>一些文本..</p>--%>
            <%--<p>菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！</p>--%>
            <%--<br>--%>
            <%--<h2>标题</h2>--%>
            <%--<h5>副标题</h5>--%>
            <%--<div class="fakeimg">图像</div>--%>
            <%--<p>一些文本..</p>--%>
            <%--<p>菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！</p>--%>
                <div id="ccc">
                    <table>
                        <Tr>
                            <td>输入理想薪资</td>
                            <Td><input type="text" class="form-control" value="0" id="hgccc01" ></Td>&nbsp;
                            <Td><input type="button" class="form-control" value="查询" onclick="cxgg();" ></Td>
                        </Tr>
                        <script>
                            function cxgg() {
                                var tgxz001 = $("#hgccc01").val();
                                console.log(tgxz001);
                                gg(undefined,undefined,tgxz001);
                            }
                        </script>
                    </table>
                    <table class="table table-bordered" style="margin-left: 20px;" >
                        <caption id="cap">招聘岗位</caption>
                        <thead >
                        <tr>
                            <th>招聘ID</th>
                            <th>招聘名称</th>
                            <th>提供薪资</th>
                            <th>招聘人数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="thead01">
                        <tr v-for="(index,i) in msg" :key="index" v-model="msg[i]">
                            <Td>{{index+1}}</Td>
                            <Td>{{i.zpsname}}</Td>
                            <Td>{{i.tgxinzi02}}至{{i.tgxinzi}}</Td>
                            <Td>{{i.zprs}}</Td>
                            <Td>
                                <input class="btn btn-primary btn-xm"  type="button" onclick="zpxq('{{i.zpsid}}');" value="详情">
                                <input class="btn btn-primary btn-xm"  type="button" onclick="tdjl('{{i.zpsid}}');" value="投递简历" />
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
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p >欢迎您的加入！！</p>
</div>
<script type="text/javascript">
    function zjtdjl(id01,id02) {
        $.ajax({
            url: "${path}/insert_wf_tdjl",
            type: "post",
            data:{"tdrid":id01,"tdzpsid":id02},
            dataType: "json",
            success: function (data) {
                console.log("增加面试表");
                console.log(data);
            }
        });
    }
    function cxtdjl001(id01,id02) {
        $.ajax({
            url: "${path}/cxtdjl001",
            type: "post",
            data:{"tdrid":id01},
            dataType: "json",
            success: function (data) {
                if(data.length>0){
                    alert("您已经投递过简历，可以在我的投递中查看");
                }else{
                    zjtdjl(id01,id02);
                }
            }
        });
    }
    //根据当前登录用户查询是否已经创建简历
    function tdjl(id) {
        // console.log("投递简历"+id);
        $.ajax({
            url: "${path}/xxcx02",
            type: "post",
            data:{"id02":'${sessionScope.list[0].qtyhid}'},
            dataType: "json",
            success: function (data) {
                if(data.length>0){
                    console.log("投递简历");
                    console.log(data);
                    var id02 = data[0].id;
                    cxtdjl001('${sessionScope.list[0].qtyhid}',id);
                }else{
                    if(confirm('您当前没有创建简历，是否要去创建')==true){
                        window.location.href="a_jltx.jsp";
                        return true;
                    }else{
                        return false;
                    }
                }
            }
        });
    }

    function zpxq(id){
        //手动打开模态框
        $.ajax({
            url: "${path}/zpsqbcx02",
            type: "post",
            data:{"id":id},
            dataType: "json",
            success: function (data) {
                // console.log(data.list);
                for(var i=0;i<data.list.length;i++){
                    var p= data.list[0];
                    $("#zpsid").text(p.zpsid);
                    $("#zpsname").text(p.zpsname);
                    $("#zhiweixinxixx").text(p.zhiweixinxixx);
                    $("#tgxinzi").text(p.tgxinzi02+'至'+p.tgxinzi);$("#zprs").text(p.zprs);
                    $("#djsj").text(p.djshijian02);$("#fulidaiyu").text(p.fulidaiyu);
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
    function gg(id,nowPage,id03){
        $.ajax({
            url: "${path}/zpsqbcx02",
            type: "post",
            data:{"id":id,"nowPage":nowPage,"tgxinzi":id03},
            dataType: "json",
            success: function (data) {
                console.log(data.list);
                console.log(nowPage);
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
        gg(undefined,nowPage,undefined);
    };
    $().ready(function () {
        // jsmethod();
        gg(undefined,1,undefined);
        $("#selectBtn").click(function () {
            searchInfo(undefined,1);
        });
    });


    //根据当前登录用户查询是否已经创建简历
    function jl() {
        // console.log("投递简历");
        $.ajax({
            url: "${path}/xxcx",
            type: "post",
            data:{"id02":'${sessionScope.list[0].qtyhid}'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data>0){
                    window.location.href="a_jlupdate.jsp";
                }else{
                    if(confirm('您当前没有创建简历，是否要去创建')==true){
                        window.location.href="a_jltx.jsp";
                        return true;
                    }else{
                        return false;
                    }
                }
            }
        });
    }
</script>
</body>
</html>