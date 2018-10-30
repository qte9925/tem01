<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="gy.jsp" %>
<html>
<head>
    <title>角色与权限管理</title>
</head>
<body >

<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <input class="btn btn-default btn-sm" value="个人考勤" onclick="tz();">
</form>
</table>
<script type="text/javascript">
    function tz() {
        window.location.href='/wf02/grkq.jsp';
    }
</script>
</body>
</html>
