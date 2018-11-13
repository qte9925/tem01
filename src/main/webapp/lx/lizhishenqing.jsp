<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>离职申请</title>
</head>
<body >

<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">离职登记</a></button>
</form>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">离职 </caption>
    <tbody id="thead01">
    <tr>
        <td>
            <label  class="col-sm-2 control-label">离职人员</label>
            <div class="col-sm-10">
                <input type="text" style="display: none;" readonly="readonly" class="form-control" id="yg" value="${sessionScope.list[0].ryid}">
                <input type="text" readonly="readonly" class="form-control" value="${sessionScope.list[0].ryxm}">
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <input type="text" style="display: none;" readonly="readonly" class="form-control" id="qjlx" value="${sessionScope.list[0].ryid}">
                <input type="text" readonly="readonly" class="form-control" value="${sessionScope.list[0].bmname}">
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">离职原因</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="lzyy" rows="3"></textarea>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">入职时间</label>
            <div class="col-sm-10">
                <input type="text" id="datatime01" readonly="readonly" class="form-control"
                       value="${sessionScope.list[0].rydata}"/>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">申请时间</label>
            <div class="col-sm-10">
                <input type="text" id="datatime02" readonly="readonly" class="form-control"
                       value="<%=new java.sql.Timestamp(System.currentTimeMillis()).toString().substring(0,10) %>"/>
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
        window.location.href="lizhidengji.jsp";
    }
    function zjht() {
        if(lzyy!=null){
            $.ajax({
                url: "${path}/lzinsetes",
                data:{"ryid":$("#yg").val(),
                    "bmid":$("#qjlx").val(),
                    "lzyy":$("#lzyy").val(),
                    "datetime01":$("#datetime01").val(),
                    "datetime02":$("#datetime02").val(),
                    "spid":$("#yg02").val(),
                    "spzt":$("#spzt").val()
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data==0){
                        alert("提交失败")
                    }else{
                        window.location.href="/lx/lizhidengji.jsp";
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
            url: "${path}/lzselect",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#qjlx").html("<option >请选择部门</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.bmid + "'>" + p.bmname + "</option>";
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
        $("#datetime02").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });
</script>

</body>
</html>
