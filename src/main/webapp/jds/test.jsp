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
</head>
<body>
<center>
    标题:<input type="text" id="zt">
</center>
<div id="editor">
    <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
</div>
<button id="btn1">获取html</button>
<button id="btn2">获取text</button>

<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="${path}/js/wangEditor-3.1.1\release/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()
    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        var nr=editor.txt.html()
        $.ajax({
            url:"${path}/insertN",
            data:{"ygxm":"张三",
                "zt":$("#zt").val(),
                "nr":nr,
                "rq":now,
                "state":0
            },
            dataType:"json",
            type:"post",
            success:function(data){
                if(data>0){
                    alert("公告发布完成！");
                    window.location.reload();

                }
            }
        });


    }, false)

   /* document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)*/
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }

    var myDate = new Date();
    //获取当前年
    var year=myDate.getFullYear();
    //获取当前月
    var month=myDate.getMonth()+1;
    //获取当前日
    var date=myDate.getDate();
    var h=myDate.getHours();       //获取当前小时数(0-23)
    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    var s=myDate.getSeconds();     //获取当前秒钟数(0-59)

    var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
/*function aa(nr) {
    $.ajax({
        url:"${path}/insertN",
        data:{"ygxm":"张三",
            "zt":$("#zt").val(),
            "nr":nr,
            "rq":now,
            "state":0
        },
        dataType:"json",
        type:"post",
        success:function(data){
            if(data>0){
                alert("公告发布完成！");
                window.location.reload();

            }
        }
    });
}*/
</script>
</body>


</html>

