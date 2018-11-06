<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="gy.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Tem</title>
    <link rel="stylesheet" href="/js/bootstrap.css">
    <script type="text/javascript">
        function gg(){
            $.ajax({
                url: "${path}/index01",
                type: "post",
                data:{"yhid":'${sessionScope.list[0].yhid}'},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    for(var c=0;c<data.length;c++){
                        console.log(data[c])
                    }
                    var vm = new Vue({
                        el:'#aaa01',
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
</head>
<body><!--顶部导航栏部分-->
<%--${sessionScope.list[0]}--%>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Tem01</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="grzm.jsp" target="mainFrame">我的桌面</a></li>
                <%--<li><a href="#">SVN</a></li>--%>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                <%--Java--%>
                <%--<b class="caret"></b>--%>
                <%--</a>--%>
                <%--<ul class="dropdown-menu">--%>
                <%--<li><a href="grzm.jsp" target="mainFrame">我的桌面</a></li>--%>
                <%--<li><a href="#">EJB</a></li>--%>
                <%--<li><a href="#">Jasper Report</a></li>--%>
                <%--<li class="divider"></li>--%>
                <%--<li><a href="#">分离的链接</a></li>--%>
                <%--<li class="divider"></li>--%>
                <%--<li><a href="#">另一个分离的链接</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
            </ul>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="#">当前用户：<span class="badge">
                        ${sessionScope.list[0].yhname}（${sessionScope.list[0].ryxm})
                    </span></a>
                </li>

                <li>
                    <a href="login.jsp">
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>

    </div>
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar" id="aaa01">
        <ul class="nav nav-stacked nav-pills">
            <!--第一次循环 同时if 获取第一级菜单 -->
            <li class="dropdown" v-for="i in msg">
                <a class="dropdown-toggle" data-toggle="dropdown" v-if="i.dj9999==0" href="#">
                    {{i.qxname}}<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <!--第二次循环 获取二级菜单 同时对用第二次循环的等级列比对第一次循环的一级菜单-->
                    <li v-for="i02 in msg" v-if="i02.dj9999 == i.qxid">
                        <a href="{{i02.qxurl}}" target="mainFrame">{{i02.qxname}}</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <iframe src="grzm.jsp" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>
    </div>
</div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2018 &copy; NeoYang.
    </p>
</div>
<script type="text/javascript" >
    $(".nav li").click(function() {
        $(".active").removeClass('active');-
            $(this).addClass("active");
    });
</script>
</body>
</html>