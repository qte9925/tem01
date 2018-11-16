<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>新增合同信息</title>
</head>
<body>

<form class="form-inline" role="form" style="margin-top: 30px;">
    <div class="page-header">
        <h1>新建合同信息
            <small>说明：</small>
        </h1>
    </div>
    <p>1、合同试用日期应小于合同终止日期；2、合同解除日期应大于合同终止日期；3、合同续签日期应大于合同终止日期。</p>
</form>

<div class="panel panel-default" style="margin-top: 20px;">
    <div class="panel-heading">
        <h3 class="panel-title">新增合同信息</h3>
    </div>
    <div class="panel-body" id="div01">

        <form class="form-horizontal" role="form">
                <table class="table table-condensed">
                <tbody>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同签约人</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="ygid" >
                                <option>请选择员工</option>
                            </select>

                        </div>
                    </td>
                    <%--<td>--%>
                        <%--<label  class="col-sm-2 control-label">合同编号</label>--%>
                        <%--<div class="col-sm-10">--%>
                        <%--<input type="text" class="form-control" id="bianhao"--%>
                               <%--placeholder="请输入合同编号">--%>

                        <%--</div>--%>
                    <%--</td>--%>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同签约公司</label>
                        <div class="col-sm-10" id="div003">
                            <select class="form-control" id="gsid" >
                                <option>请选择合同签约公司</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">合同类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="htlxid"  >
                                <option value="4">请选择</option>
                                <option value="4">录用合同</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同签订日期</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id='ksrq' />
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">合同生效日期</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id='sxrq' />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同终止日期</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id='jsrq' />
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">效绩奖金</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control"  id="jxjin" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">薪资</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="xz"  onblur="tuoli();"  />
                        </div>
                    </td>
                </tr>
                <script type="text/javascript">
                    function tuoli() {
                        var xz = $("#xz").val();
                        var yanglaobx = xz*0.05;
                        var shiyebx = xz*0.005;
                        var yiliaobx = xz*0.02;
                        var sybx = xz*0.003;
                        var gsbx = xz*0.002;
                        var zfgjj = xz*0.02;
                        $("#yanglaobx").val(yanglaobx.toFixed(2));
                        $("#shiyebx").val(shiyebx.toFixed(2));
                        $("#yiliaobx").val(yiliaobx.toFixed(2));
                        $("#sybx").val(sybx.toFixed(2));
                        $("#gsbx").val(gsbx.toFixed(2));
                        $("#zfgjj").val(zfgjj.toFixed(2));
                    }
                </script>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">养老保险</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="yanglaobx" readonly />
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">失业保险</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="shiyebx" readonly />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">医疗保险</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="yiliaobx" readonly />
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">生育保险</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="sybx" readonly />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">工伤保险</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="gsbx" readonly />
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">住房公积金</label>
                        <div class="col-sm-10">
                            <input type='text' class="form-control" id="zfgjj" readonly  />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="beizhu" rows="3"></textarea>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" onclick="zjht();">保存</button>
                        </div>
                    </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript">
    function updatewfstafftablerzht(id) {
        $.ajax({
            url: "${path}/updatewfstafftablerzht",
            data:{"ryid" : id
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
            }
        });
    }
    function zjht(){
        var id = $("#ygid").val();
        $.ajax({
            url: "${path}/insert_wf_hetong",
            data:{"ygid" : $("#ygid").val(),
                "gsid" : $("#gsid").val(),
                "htlxid" : $("#htlxid").val(),
                "ksrq" : $("#ksrq").val(),
                "jsrq" :  $("#jsrq").val(),
                "sxrq" : $("#sxrq").val(),
                "beizhu": $("#beizhu").val(),
                "jxjin": $("#jxjin").val(),
                "xz": $("#xz").val(),
                "yanglaobx": $("#yanglaobx").val(),
                "shiyebx": $("#shiyebx").val(),
                "yiliaobx": $("#yiliaobx").val(),
                "sybx": $("#sybx").val(),
                "gsbx": $("#gsbx").val(),
                "zfgjj": $("#zfgjj").val()
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if(data>0){
                    updatewfstafftablerzht(id);
                    window.location.reload();
                }else{
                    console.log("小于0");
                    console.log(data);
                }
            }
        });
    }
    $().ready(function () {
        $.ajax({
            url: "${path}/ygbid",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#ygid").html("<option >请选择员工</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.id + "'>" + p.name + "</option>";
                    $("#ygid").append(html);
                }
            }
        });
            $.ajax({
                url: "${path}/gscx",
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#gsid").html("<option >请选择签约公司</option>");
                    for (var i = 0; i < data.length; i++) {
                        var p = data[i];
                        var html = "<option value='" + p.gsid + "'>" + p.name + "</option>";
                        $("#gsid").append(html);
                    }
                }
            });
            $.ajax({
                url: "${path}/htlxcx",
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    // $("#htlxid").html("<option >请选择签约合同类型</option>");
                    // for (var i = 0; i < data.length; i++) {
                    //     var p = data[i];
                    //     var html = "<option value='" + p.htleixingid + "'>" + p.name + "</option>";
                    //     $("#htlxid").append(html);
                    // }
                }
            });

    });
    $(function () {
        $("#ksrq").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
        $("#jsrq").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
        $("#sxrq").datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });
</script>
</body>
</html>
