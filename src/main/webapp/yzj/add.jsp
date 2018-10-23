<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="/js/bootstrap.css">
        <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
    </head>
    <body>
        <table>
            <tr>
                <td>需求内容:</td>
                <td><input type="text" name="staffName" id="staffName"></td>
            </tr>

            <tr>
                <td>部门:</td>
                <td><input type="text" name="department" id="department"></td>
            </tr>
            <tr>
                <td>职位:</td>
                <td><input type="text" name="post" id="post"></td>
            </tr>
            <tr>
                <td>审批方式:</td>
                <td><input type="text" name="state" id="state"></td>
            </tr>
            <tr>
                <td>学历:</td>
                <td><input type="text" name="education" id="education"></td>
            </tr>
            <tr>
                <td>填单人:</td>
                <td><input type="text" name="writePeople" id="writePeople"></td>
            </tr>
            <tr>
                <td><input type="button" value="新增" id="buttons"></td>
                <td><input type="reset" value="重置"><a href="${path}/yzj/add.jsp">返回</a></td>
            </tr>
        </table>
    </body>
    <script type="text/javascript">
        $().ready(function(){

        $("#buttons").click(function(){
        $.ajax({
        url:"${path}/Add",
        data:{"Id":$("#Id").val(),
        "staffName":$("#staffName").val(),
        "department":$("#department").val(),
        "post":$("#post ").val(),
        "shenpimode":$("#shenpimode").val(),
        "education":$("#education").val(),
        "writePeople":$("#writePeople").val(),
        },
        dataType:"json",
        type:"post",
        success:function(data){
        if(data>0){
        window.location.reload();

        }
        }
        });
        });
        });
    </script>
    <ml>