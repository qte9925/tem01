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
<div>
    <center>
    <table>
        <tr>
            <td>
                <font> ${param.idd}</font>
            </td>
        </tr>
        <tr>
            <td>
                <font> aa</font>

            </td>
            <td>
                <font> &nbsp;&nbsp;&nbsp;</font>

            </td>
            <td>
                <font> aa</font>

            </td>
        </tr>
    </table>
    </center>
</div>
<div id="aaa"></div>
</body>
<script type="text/javascript">
    var id=${param.idd}
  $().ready(function () {

          $.ajax({
              url:"${path}/selectNa",
              data:{"id":id,
              },
              dataType:"json",
              type:"post",
              success:function(data) {
                  console.log(data.nr)


                  $("#aaa").html(data.nr);


              }
          });

  })
</script>

</html>

