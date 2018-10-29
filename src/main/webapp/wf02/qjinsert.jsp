<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>请假登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">工作日历</a></button>
    <button class="btn btn-default btn-sm"><a href="#">上下班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">外出登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">出差登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">加班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">上下班记录</a></button>
</form>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="javascript:gg();">请假登记</a></button>
</form>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">请假登记 </caption>
    <tbody id="thead01">
    <tr>
        <td>
            <label  class="col-sm-2 control-label">请假人员</label>
            <div class="col-sm-10">
                <select class="form-control" id="yg" >
                    <option>请选择员工</option>
                </select>

            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">请假理由</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="qjyanyin" rows="3"></textarea>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">开始时间</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='datetime01' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">结束时间</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='datetime02' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">请假类型</label>
            <div class="col-sm-10">
                <select class="form-control" id="qjlx" >

                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">审批人员</label>
            <div class="col-sm-10">
                <select class="form-control" id="yg02" >
                    <option>请选择员工</option>
                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" onclick="zjht();">保存</button>
                    <button type="button" class="btn btn-default" onclick="aaa();">返回</button>
                </div>
            </div>
        </td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
    function aaa() {
        window.location.href="qjdj.jsp";
    }
    function zjht() {
        var qjryid = $("#yg").val(); var qjksrq = $("#datetime01").val();var qjjsrq = $("#datetime02").val();var qjleixinid = $("#qjlx").val();
        var qjspryid = $("#yg02").val();var qjzt = 0;var qjxj = 0;var qjyanyin = $("#qjyanyin").val();
        if(qjyanyin!=null&&qjksrq!=null&&qjjsrq!=null&&qjleixinid!=null&&qjspryid!=null){
            $.ajax({
                url: "${path}/qingjiainsert",
                data:{"qjryid" : qjryid,
                    "qjyanyin" : qjyanyin,
                    "qjksrq" :qjksrq,
                    "qjjsrq" :qjjsrq,
                    "qjleixinid" : qjleixinid,
                    "qjspryid" :qjspryid,
                    "qjzt":qjzt,
                    "qjxj":qjxj
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data==0){
                        alert("提交失败")
                    }else{
                        window.location.href="qjdj.jsp";
                    }
                }
            });
        }else{
        alert("需全部填写");
        }
    }
    function gg(){
        $.ajax({
            url: "${path}/ygbid",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#yg").html("<option >请选择员工</option>");
                $("#yg02").html("<option >请选择员工</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.id + "'>" + p.name + "</option>";
                    $("#yg").append(html);
                    $("#yg02").append(html);
                }
            }
        });
        $.ajax({
            url: "${path}/qjlxselect",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#qjlx").html("<option >请选择请假类型</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.qjlxid + "'>" + p.qjlxname + "</option>";
                    $("#qjlx").append(html);
                }
            }
        });
    }
    $().ready(function () {
            gg();
    });
    //日期组件
    $(function () {
        $("#datetime01").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
        $("#datetime02").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });
</script>

</body>
</html>
