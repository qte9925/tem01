<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body >
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    需求详情
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>手机号：</td>
                        <td><input  class="form-control"  type="text" id="zcsj"> </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input  class="form-control"  type="password" id="zcmima01"> </td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td ><input  class="form-control"  type="password" id="zcmima02"> </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" onclick="a_zc();" class="btn btn-primary">
                注册
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="container">
    <div class="col-md-4 col-md-offset-4" id="form-container">
        <h1 class="text-center">
            用 户 登 录
        </h1>
            <div class="form-group" style="padding-bottom: 8px;">
                <label class="col-md-4" for="telephone">
                    手机号:
                </label>
                <div class="col-md-8">
                    <input class="form-control" id="telephone" name="telephone"  required="true" type="text"/>
                    <p id="telephoneError" style="margin-bottom: -2px;color: red;">
                    </p>
                </div>
            </div>
            <div class="form-group" style="margin-top: 30px; padding-bottom: 8px;">
                <label class="col-md-4" for="password">
                    密   码:
                </label>
                <div class="col-md-8">
                    <input class="form-control" id="password" name="password"  required="true" type="password"/>
                    <p id="passwordError" style="margin-bottom: -2px;color: red;">
                    </p>
                </div>
            </div>
            <div class="form-group" style="margin-top: 80px;">
                <div class="col-md-3 col-md-offset-3"  style="margin-left: 150px;">
                    <button class="btn btn-primary btn-lg" onclick="a_login();" type="button">
                    登录
                    </button>
                </div>
                <div class="col-md-3 col-md-offset-3" style="margin-left: -5px;">
                    <a class="btn btn-primary btn-lg" href="javascript:dakai();">
                        注册
                    </a>
                </div>
            </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //注册
    function a_zc(){
        var zcsj= $("#zcsj").val();
        var zcmima01 = $("#zcmima01").val();
        var zcmima02 = $("#zcmima02").val();
        if(zcsj.length != 0&&zcmima01.length != 0&&zcmima02.length != 0){
            $.ajax({
                url:'${path}/insert_wf_qtyh',
                data:{
                    "sjh":zcsj,
                    "mima":zcmima01
                },
                dataType:'json',
                type:'post',
                success:function(data){
                    if(data!=0){alert("注册成功");window.location.href = "${path}/a_login.jsp";}else{alert("注册失败，请重新注册")}
                }

            })
        }

    }
    //动态打开模态框
    function dakai() {
        $('#myModal').modal('show');
    }
    //登录
    function a_login(){
       var shoujihao= $("#telephone").val();
       var mima = $("#password").val();
       if(shoujihao.length != 0&&mima.length != 0){
           $.ajax({
               url:'${path}/qtyh',
               data:{
                   "shoujihao":shoujihao,
                   "mima":mima
               },
               dataType:'json',
               type:'post',
               success:function(data){
                   if(data==0){
                       window.location.href = "${path}/wf02/a_index.jsp";
                       console.log(data);
                   }else{
                    alert("用户名和密码不正确请重新填写");
                   }
               }

           })
       }else{alert("请输入用户名或者密码")}

    }

</script>

</html>
