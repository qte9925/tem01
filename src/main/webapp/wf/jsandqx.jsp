<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>角色与权限管理</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="jsinsert.jsp">新增角色</a></button>
    <button class="btn btn-default btn-sm"><a href="jsupdate.jsp">添加/删除权限</a></button>
</form>
<div id="appp">
<table class="table table-striped"  >
    <caption>角色与权限管理</caption>
    <thead>
    <tr>
        <th>角色排序号</th>
        <th>角色名称</th>
        <%--<th>所属部门</th>--%>
        <%--<th>用户数量</th>--%>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="yhid01">
        <tr v-for="item in aa">
            <td>{{item.jsdengji}}</td>
            <td>{{item.jsname}}</td>
            <td><a v-bind="{href:'jsupdate.jsp?id='+item.jsid}">设置权限</a><span>/</span><a href="jsupdate.jsp">编辑角色</a></td>
        </tr>
    </tbody>
</table>
</div>
<script type="text/javascript" >

    $(document).ready(function () {
        $.ajax({
            url: "${path}/cxjsb02",
            type: "post",
            dataType: "json",
            success: function (data01) {
                console.log(data01);
                var vm=new Vue({
                    el:'#appp',
                    data:{
                        aa:data01
                    }
                });
            }
        });
    });
</script>
</body>
</html>
