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

<style>
    #aaa{

        margin-left: 150px;
    }
</style>
<body>
<div>
    <center>
        <h1>公告</h1>
        <table>
            <tr>
                <td>
                    发布人：<font id="ygxm"> </font>
                </td>


                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    发布时间： <font id="rq"></font>

                </td>
            </tr>
            <tr>
                <td>

                    <h2>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        主题： <font id="zt"></font>
                    </h2>

                </td>
            </tr>
        </table>
    </center>
</div>
<div id="aaa"></div>
<div>
    <center>
        <button id="CloseB"  class="btn btn-primary" >关闭</button>
    </center>
</div>
</body>
<script type="text/javascript">
    var id=${param.idd}
        alert(id)
        $().ready(function () {

            $.ajax({
                url:"${path}/selectNa",
                data:{"id":id,
                },
                dataType:"json",
                type:"post",
                success:function(data) {
                    console.log(data.nr)
                    $("#ygxm").html(data.ygxm);
                    $("#rq").html(data.rq);
                    $("#zt").html(data.zt);
                    $("#aaa").html(data.nr);


                }
            });

        })
    $("#CloseB").click(function () {

        $.ajax({
            url:"${path}/updateN",
            data:{"id":id,
                "state":1
            },
            dataType:"json",
            type:"post",
            success:function(data) {
                history.go(-1)

            }
        });

    })
</script>

</html>

