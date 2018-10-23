<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="cpts/frame/layui/css/layui.css">
    <link rel="stylesheet" href="cpts/frame/static/css/style.css">
    <link rel="icon" href="cpts/frame/static/image/code.png">
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        function login() {
            $.ajax({
                url : "login",
                type : "post",
                dataType : "json",
                data : {"yhuser":$("#yhuser").val(),"yhpassword":$("#yhpassword").val()},
                success : function(data) {
                    console.log(data);
                    if (data==0){
                        window.location.href='index.jsp';
                    }else{
                        alert("登录失败");
                    }
                }
            })
        }
    </script>
</head>
<body>
<a href="/cs">1111</a>
<div class="login-main">
    <header class="layui-elip">后台登录</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" id="yhuser" name="account" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="yhpassword" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button type="button" class="layui-btn" onclick="login();" >登录</button>
        </div>
        <hr/>
        <!--<div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>
        </div>-->
        <p><a href="javascript:;" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>
    </form>
</div>


<script src="cpts/frame/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {

        // 操作对象
        var form = layui.form
            , $ = layui.jquery;

        // you code ...


    });
</script>
</body>
</html>