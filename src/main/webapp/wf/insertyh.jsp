<%--
  Created by IntelliJ IDEA.
  User: zizz
  Date: 2018/10/17
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>新增用户</title>
</head>
<body>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">新增用户</h3>
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
<script type="text/javascript">
    function insert01() {
        $.ajax({
            url: "${path}/jsbselect01",
            type: "post",
            date: {"":},
            dataType: "json",
            success: function (data) {
                console.log(data);
            }
        });
    }

    $().ready(function () {
        // console.log("111");
        $.ajax({
            url: "${path}/jsbselect01",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#jsselect").html("<option>请选择</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.jsid + "'>" + p.jsname + "</option>";
                    $("#jsselect").append(html);
                }
            }
        });
    });
</script>
</body>
</html>
