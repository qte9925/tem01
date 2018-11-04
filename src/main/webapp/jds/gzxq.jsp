<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'select.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="text-align:center;">
    <table class="table table-bordered">
        <tr id="jz">
            <td>序号</td>
            <td>员工姓名</td>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>失业保险</td>
            <td>养老保险</td>
            <td>失业保险</td>
            <td>迟到</td>
            <td>早退</td>
            <td>请假</td>
            <td>旷工</td>
            <td>缴税</td>
            <td>实际工资</td>
            <td>操作</td>
        </tr>
        <tbody id="tbody" ></tbody>
    </table>
    <%--  <table id="tbody" class="table table-striped" >

      </table>--%>

</div>

<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">

                    修改税率信息
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table <%--style="display:none"--%>>

                            <tr>
                                <td>级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:<input type="text" id="sdida"></td>
                            </tr>
                            <tr>
                                <td>工&nbsp;&nbsp;资&nbsp;&nbsp;范&nbsp;&nbsp;围&nbsp;&nbsp;:<input type="text" id="gzfwa"></td>
                            </tr>
                            <tr>
                                <td>起&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;征&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点&nbsp;&nbsp;:<input type="text" id="qzda"></td>
                            </tr>
                            <tr>
                                <td>税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;率:<input type="text" id="sla"></td>
                            </tr>
                            <tr>
                                <td>应纳税所得额:<input type="text" id="yjnsdea"></td>
                            </tr>
                            <tr>
                                <td>速&nbsp;算&nbsp;扣&nbsp;除&nbsp;数:<input type="text" id="sskcsa"></td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="update">
                    修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>


</html>

