<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>入职</title>
</head>
<body >

<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">离职登记</a></button>
</form>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">入职 </caption>
    <tbody id="thead01">
    <tr>
        <td>
            <label  class="col-sm-2 control-label">入职人员</label>
            <div class="col-sm-10">
                <select class="form-control" id="yg" onchange="chaxungwei();" >
                    <option>请选择员工</option>
                </select>

            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <select class="form-control" id="bm" >

                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">岗位</label>
            <div class="col-sm-10">
                <select class="form-control" id="gangwei" >

                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">人员上级</label>
            <div class="col-sm-10">
                <select class="form-control" id="sj" >

                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="lzyy" rows="1"></textarea>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">入职时间</label>
            <div class="col-sm-10">
                <input type="text" id="rzdata" readonly="readonly" class="form-control"
                       value="<%=new java.sql.Timestamp(System.currentTimeMillis()).toString().substring(0,10) %>"/>
            </div>
        </td>
    </tr>
    <%--<tr>--%>
        <%--<td>--%>
            <%--<label  class="col-sm-2 control-label">审批人员</label>--%>
            <%--<div class="col-sm-10">--%>
                <%--<input type="text" style="display: none;" readonly="readonly" class="form-control" id="yg02" value="${sessionScope.list[0].ryid}">--%>
                <%--<input type="text" readonly="readonly" class="form-control" value="${sessionScope.list[0].ryxm}">--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
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
        window.location.href="ruzhichaxun.jsp";
    }

    function zjht() {
            $.ajax({
                url: "${path}/rymssqinccc",
                data:{"ryxm":$("#yg").val(),
                    "rybmid":$("#bm").val(),
                    "rygangwei":$("#gangwei").val(),
                    "ryshangji":$("#sj").val(),
                    "email":$("#lzyy").val()
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data==0){
                        alert("提交失败");
                    }else{
                        window.location.reload();
                    }
                }
            });
    }
    $(document).ready(function(){
        $("#yh").on("change",function(){
            alert("段落被点击了。");
        });
    });
    function rymssqselect011(id) {
        $.ajax({
            url: "${path}/rymssqselect011",
            data:{"bmid":id},
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#sj").html("<option >请选择员工</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.ryid + "'>" + p.ryxm + "</option>";
                    $("#sj").append(html);
                }
            }
        });
    }
    function chaxungwei(id) {
        var id01 = $("#yh").val();
        $.ajax({
            url: "${path}/rymssqselect",
            data:{"id":id01},
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data.length==0){}else{
                    var p = data[0];
                    $("#bm").html("<option value='" + p.cc + "'>" + p.bmname + "</option>");
                    $("#gangwei").html("<option value='" + p.jsid + "'>" + p.jsname + "</option>");
                    rymssqselect011(p.cc);
                }

            }
        });
        rymssqselect011
    }
    function gg(){
        $.ajax({
            url: "${path}/rymssqselect",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#yg").html("<option >请选择员工</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.jlname + "'>" + p.jlname + "</option>";
                    $("#yg").append(html);
                }
            }
        });
        <%--$.ajax({--%>
            <%--url: "${path}/rymssqselect",--%>
            <%--type: "post",--%>
            <%--dataType: "json",--%>
            <%--success: function (data) {--%>
                <%--console.log(data);--%>
                <%--$("#qjlx").html("<option >请选择部门</option>");--%>
                <%--for (var i = 0; i < data.length; i++) {--%>
                    <%--var p = data[i];--%>
                    <%--var html = "<option value='" + p.bmid + "'>" + p.bmname + "</option>";--%>
                    <%--$("#qjlx").append(html);--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
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
