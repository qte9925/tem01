<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>角色与权限管理</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
        <button class="btn btn-default btn-sm"><a href="jsinsert">新增角色</a></button>
        <button class="btn btn-default btn-sm"><a href="jsupdate">添加/删除权限</a></button>
</form>
<table class="table table-striped" >
    <caption>角色与权限管理(添加角色)</caption>
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

    </tbody>
</table>
</body>
</html>
