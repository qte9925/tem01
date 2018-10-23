<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>新增合同信息</title>
</head>
<body>
<div class="panel panel-default" style="margin-top: 20px;">
    <div class="panel-heading">
        <h3 class="panel-title">新增合同信息</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="firstname01" class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstname01"
                           placeholder="请输入昵称">
                </div>
            </div>
            <div class="form-group">
                <label for="firstname02" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstname02"
                           placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <label for="lastname01" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="lastname01"
                           placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="lastname02" class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="lastname02"
                           placeholder="请确认密码">
                </div>
            </div>
            <div class="form-group">
                <label for="jsselect" class="col-sm-2 control-label">选择列表</label>
                <div class="col-sm-10">
                    <select class="form-control" id="jsselect"></select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
