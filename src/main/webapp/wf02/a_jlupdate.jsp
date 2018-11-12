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
                <li><a href="#">我的简历</a></li>
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
            <%--<h3>链接${sessionScope.list[0]}</h3>--%>
            <h3>链接</h3>
            <p>当前介绍</p>
            <ul class="nav nav-pills nav-stacked">
                <%--<li class="active"><a href="a_zhuche.jsp">我的简历</a></li>--%>
                <li><a href="a_zhuche.jsp">我的简历</a></li>
                <li><a href="#">我的投递</a></li>
                <li><a href="#">通知</a></li>
            </ul>
            <hr class="hidden-sm hidden-md hidden-lg">
        </div>
        <div class="col-sm-8">
            <div id="ccc">
                <table class="table table-bordered" style="margin-left: 20px;" >
                    <caption id="cap">简历内容 </caption>
                    <tbody id="thead01">
                    <tr>
                        <td><h2>个人信息</h2></td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='jlname' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="xingbie" >
                                    <option value="0">男</option>
                                    <option value="1">女</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">出生日期</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='chudate' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">户籍</label>
                            <div class="col-sm-10">
                                <input id="huji" class="form-control" type="text" readonly>
                                <input id="huji01" class="form-control" readonly type="text" data-toggle="city-picker">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">现居地</label>
                            <div class="col-sm-10">
                                <input id="xianjudi" class="form-control" readonly type="text" >
                                <input id="xianjudi01" class="form-control" readonly type="text" data-toggle="city-picker">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">参加工作时间</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='canjiadate' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><h2>教育经历</h2></td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">学校名称</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='xuexiao' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">学历</label>
                            <div class="col-sm-10">
                                <select class="form-control"   id="xueli"   >
                                    <option value="4">中专</option>
                                    <option value="0">大专</option>
                                    <option value="1">本科</option>
                                    <option value="2">硕士</option>
                                    <option value="3">博士</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">是否统招</label>
                            <div class="col-sm-10">
                                <select class="form-control"   id="tongzhao"   >
                                    <option value="0">是</option>
                                    <option value="1">不是</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">就读开始时间</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='jiudukaishi' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">就读结束时间</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='jiudujieshu' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><h2>工作经验</h2></td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">公司名称</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='gongsimingc' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">职位名称</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='zhiweimingcheng' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">在职开始时间</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='zhizhikaishi' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">在职结束时间</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='zaizhijieshu' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">税前月薪</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='suiqianyuexin' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">工作描述</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="gzms" rows="3"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>

                        <td><h2>求职期望</h2></td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">期望月薪</label>
                            <div class="col-sm-10">
                                <input type='text' class="form-control" id='qwyx' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label  class="col-sm-2 control-label">期望工作地点</label>
                            <div class="col-sm-10">
                                <input id="qwdd" class="form-control" readonly type="text" >
                                <input id="qwdd01" class="form-control" readonly type="text" data-toggle="city-picker">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-default" onclick="update_wf_jianli();">保存</button>
                                    <button type="button" class="btn btn-default" onclick="aaa();">返回</button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p onclick="aaa();">欢迎您的加入！！</p>
</div>
<script type="text/javascript">
    function  aaa() {
        $("#huji").val("11/1/1");
        alert($("#huji").val());
    }
    //修改简历
    function insert_wf_jianli() {
        alert($("#jlname").val());
        $.ajax({
            url: "${path}/insert_wf_jianli",
            type: "post",
            data:{
                "jlname":$("#jlname").val(),
                "xingbie":$("#xingbie").val(),
                "chudate":$("#chudate").val(),
                "huji":$("#huji").val(),
                "xianjudi":$("#xianjudi").val(),
                "canjiadate":$("#canjiadate").val(),
                "xuexiao":$("#xuexiao").val(),
                "xueli":$("#xueli").val(),
                "tongzhao":$("#tongzhao").val(),
                "jiudukaishi":$("#jiudukaishi").val(),
                "jiudujieshu":$("#jiudujieshu").val(),
                "gongsimingc":$("#gongsimingc").val(),
                "zhiweimingcheng":$("#zhiweimingcheng").val(),
                "zhizhikaishi":$("#zhizhikaishi").val(),
                "zaizhijieshu":$("#zaizhijieshu").val(),
                "suiqianyuexin":$("#suiqianyuexin").val(),
                "gzms":$("#gzms").val(),
                "qwyx":$("#qwyx").val(),
                "qwdd":$("#qwdd").val(),
                "qtryid":'${sessionScope.list[0].qtyhid}',
                "zhuangtai":0},
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data!=0){
                    window.location.href="a_jlupdate.jsp";
                }else{
                    alert("添加简历失败，请重新制定");
                }
            }
        });
    }
    //根据当前登录用户查询是否已经创建简历
    <%--function tdjl(id) {--%>
        <%--console.log("投递简历"+id);--%>
        <%--$.ajax({--%>
            <%--url: "${path}/xxcx",--%>
            <%--type: "post",--%>
            <%--data:{"id02":'${sessionScope.list[0].qtyhid}'},--%>
            <%--dataType: "json",--%>
            <%--success: function (data) {--%>
                <%--console.log(data);--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
    <%--function zpxq(id){--%>
        <%--//手动打开模态框--%>
        <%--$.ajax({--%>
            <%--url: "${path}/zpcx02",--%>
            <%--type: "post",--%>
            <%--data:{"zpxqid":id},--%>
            <%--dataType: "json",--%>
            <%--success: function (data) {--%>
                <%--console.log(data);--%>
                <%--for(var i=0;i<data.length;i++){--%>
                    <%--var p= data[i];--%>
                    <%--$("#bh").text(p.zpxqid);--%>
                    <%--$("#xqrs").text(p.xuqiurenshu);--%>
                    <%--$("#xqgw").text(p.jsname);--%>
                    <%--$("#bm").text(p.bmname);$("#ygrq").text(p.yonggongriqi02);--%>
                    <%--$("#qxxq").text(p.gwyaoqiu);$("#bz").text(p.beizhu);--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
        <%--$('#myModal').modal('show');--%>
    <%--}--%>
    function gg(id){
        $.ajax({
            url: "${path}/xxcx02",
            type: "post",
            data:{"id02":'${sessionScope.list[0].qtyhid}'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                var  p = data[0];
                    $("#jlname").val(p.jlname);
                    $("#xingbie").val(p.xingbie);
                    $("#chudate").val(p.chudate);
                    $("#huji").val(p.huji);
                    $("#huji01").val(p.huji);
                    $("#xianjudi").val(p.xianjudi);
                    $("#xianjudi01").val(p.xianjudi);
                    $("#canjiadate").val(p.canjiadate);
                    $("#xuexiao").val(p.xuexiao);
                    $("#xueli").val(p.xueli);
                    $("#tongzhao").val(p.tongzhao);
                    $("#jiudukaishi").val(p.jiudukaishi);
                    $("#jiudujieshu").val(p.jiudujieshu);
                    $("#gongsimingc").val(p.gongsimingc);
                    $("#zhiweimingcheng").val(p.zhiweimingcheng);
                    $("#zhizhikaishi").val(p.zhizhikaishi);
                    $("#zaizhijieshu").val(p.zaizhijieshu);
                    $("#suiqianyuexin").val(p.suiqianyuexin);
                    $("#gzms").val(p.gzms);
                    $("#qwyx").val(p.qwyx);
                    $("#qwdd").val(p.qwdd);
                    $("#qwdd01").val(p.qwdd);
            }
        });
    }
    $().ready(function () {
        gg();
    });
    //日期组件
    $(function () {
        $("#chudate").datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $("#canjiadate").datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $("#jiudukaishi").datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $("#jiudujieshu").datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $("#zhizhikaishi").datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $("#zaizhijieshu").datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
    });
</script>

</body>
</html>
