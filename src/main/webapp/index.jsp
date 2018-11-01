<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="gy.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Tem</title>
    <link rel="stylesheet" href="/js/bootstrap.css">
</head>
<body><!--顶部导航栏部分-->

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Tem01</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="grzm.jsp" target="mainFrame">我的桌面</a></li>
                <li><a href="#">SVN</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Java
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="grzm.jsp" target="mainFrame">我的桌面</a></li>
                        <li><a href="#">EJB</a></li>
                        <li><a href="#">Jasper Report</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
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
<%--<nav class="navbar navbar-inverse">--%>
    <%--<div class="container-fluid">--%>
        <%--<div class="navbar-header">--%>
            <%--<a class="navbar-brand" title="logoTitle" href="#">Neo Yang</a>--%>
        <%--</div>--%>

    <%--</div>--%>
<%--</nav>--%>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar">
        <ul class="nav nav-stacked nav-pills">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    考勤管理<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="wf02/kqshenpi.jsp" target="mainFrame">考勤审批</a>
                    </li>
                    <li>
                        <a href="wf/ruzhishengqing.jsp" target="mainFrame">考勤记录</a>
                    </li>
                    <li>
                        <a href="wf/ruzhishengqing.jsp" target="mainFrame">考勤统计</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    人事管理<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="wf/ruzhishengqing.jsp" target="mainFrame">人员变动申请</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                    合同管理<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="wf/hetongguanli.jsp" target="mainFrame">合同管理</a>
                    </li>
                    <li>
                        <a href="wf/hetong_insert.jsp" target="mainFrame">新增合同</a>
                    </li>
                    <li>
                        <a href="wf/hetong_select.jsp" target="mainFrame">合同查询</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    用户管理<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="wf/selectyh.jsp" target="mainFrame">查看用户</a>
                    </li>
                    <li>
                        <a href="wf/insertyh.jsp" target="mainFrame">新增用户</a>
                    </li>
                    <li>
                        <a href="wf/updateyh.jsp" target="mainFrame">修改用户</a>
                    </li>
                    <li>
                        <a href="wf/jsandqx.jsp" target="mainFrame">角色和权限管理</a>
                    </li>

                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    薪资管理<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="jds/chaxun.jsp" target="mainFrame">基本薪资</a>
                    </li>
                    <li>
                        <a href="jds/Xzlc.jsp" target="mainFrame">核算薪资</a>
                    </li>
                    <li>
                        <a href="jds/Toexamine.jsp" target="mainFrame">薪资审核</a>
                    </li>
                    <li>
                        <a href="jds/Payroll.jsp" target="mainFrame">薪资发放</a>
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
        <iframe src="" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="100%" frameBorder="0"></iframe>
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
        $(".active").removeClass('active');
        $(this).addClass("active");
    });
</script>
</body>
</html>