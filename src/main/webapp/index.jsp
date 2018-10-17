<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="gy.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>bootstrap小例子</title>
    <link rel="stylesheet" href="/js/bootstrap.css">
</head>
<body><!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="#">Neo Yang</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="#">当前用户：<span class="badge">TestUser</span></a>
                </li>
                <li>
                    <a href="../login/logout">
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar">
        <ul class="nav nav-stacked nav-pills">
            <li role="presentation">
                <a href="nav1.html" target="mainFrame" >导航链接1</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="nav1.html" target="mainFrame">导航链接1-1</a>
                    </li>
                    <li>
                        <a href="nav2.html" target="mainFrame">导航链接1-2</a>
                    </li>
                    <li>
                        <a href="nav3.html" target="mainFrame">导航链接1-3</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    导航链接4<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="nav1.html" target="mainFrame">导航链接3-1</a>
                    </li>
                    <li>
                        <a href="nav2.html" target="mainFrame">导航链接4-2</a>
                    </li>
                    <li>
                        <a href="nav3.html" target="mainFrame">导航链接4-3</a>
                    </li>
                </ul>
            </li>
            <li role="presentation">
                <a href="nav2.html" target="mainFrame">导航链接2</a>
            </li>
            <li role="presentation">
                <a href="nav3.html" target="mainFrame">导航链接3</a>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    导航链接4<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="nav1.html" target="mainFrame">导航链接4-1</a>
                    </li>
                    <li>
                        <a href="nav2.html" target="mainFrame">导航链接4-2</a>
                    </li>
                    <li>
                        <a href="nav3.html" target="mainFrame">导航链接4-3</a>
                    </li>
                </ul>
            </li>
            <li role="presentation">
                <a href="nav4.html" target="mainFrame">导航链接5</a>
            </li>
        </ul>
    </div>
    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <iframe src="index.html" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>
    </div>
</div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2017 &copy; NeoYang.
    </p>
</div>
<script type="text/javascript" >
    $(".nav li").click(function() {
        $(".active").removeClass('active');
        $(this).addClass("active");
    });
</script>
</body>
</html>