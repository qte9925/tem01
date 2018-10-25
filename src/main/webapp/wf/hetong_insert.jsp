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
                        <label  class="col-sm-2 control-label">雇员</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="yg" >
                                <option>请选择员工</option>
                            </select>

                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">合同编号</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="bianhao"
                               placeholder="请输入合同编号">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同签约公司</label>
                        <div class="col-sm-10" id="div003">
                            <select class="form-control" id="gs" >
                                <option>请选择合同签约公司</option>

                            </select>
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">合同类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="htlx"  >
                                <option>请选择合同类型</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同签订日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="qdn" style="width: 40px">年
                            <input type="text" id="qdy" style="width: 40px">月
                            <input type="text" id="qdr" style="width: 40px">日
                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">合同生效日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="sxn" style="width: 40px">年
                            <input type="text" id="sxy"  style="width: 40px">月
                            <input type="text" id="sxr"  style="width: 40px">日
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">合同终止日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="jsn" style="width: 40px">年
                            <input type="text" id="jsy" style="width: 40px">月
                            <input type="text" id="jsr" style="width: 40px">日
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
                        <label  class="col-sm-2 control-label">是否含试用期</label>
                        <div class="col-sm-10">
                            <input type="radio" name="zz01" onclick="danji(1)" > 是
                            <input type="radio" name="zz01" checked onclick="danji(2)" > 否
                        </div>
                    </td>
                    <script type="text/javascript">
                        function danji(id) {
                            if(id==1){$("#aa03").show()}
                            if(id==2){$("#aa03").hide()}
                        }
                    </script>
                    <td >
                        <div id="aa03" style="display: none;">
                            <label  class="col-sm-2 control-label">试用截止日期</label>
                            <div class="col-sm-10">
                                <input type="text" id="syqn" style="width: 40px">年
                                <input type="text" id="syqy" style="width: 40px">月
                                <input type="text" id="syqr" style="width: 40px">日
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">雇员是否转正</label>
                        <div class="col-sm-10">
                            <input type="radio" name="zz" checked > 是
                            <input type="radio" name="zz" > 否
                        </div>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">提醒人员</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="yg02" >

                            </select>
                        </div>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="bz" rows="3"></textarea>
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
    function zjht(){
        var qdnyr = $("#qdn").val()+"-"+$("#qdy").val()+"-"+$("#qdr").val();
        var jsnyr = $("#jsn").val()+"-"+$("#jsy").val()+"-"+$("#jsr").val();
        var sxnyr = $("#sxn").val()+"-"+$("#sxy").val()+"-"+$("#sxr").val();
        var syqnyr = $("#syqn").val()+"-"+$("#syqy").val()+"-"+$("#syqr").val();
        var ygid = $("#yg").val();
        var bianhao = $("#bianhao").val();
        var gsid = $("#gs").val();
        var htlxid = $("#htlx").val();
        var ksrq = qdnyr;
        var jsrq = jsnyr;
        var sxrq = sxnyr;
        var txryid = $("#yg02").val();
        var shiyongqiriqi =syqnyr;
        var zhuanzhengriqi = syqnyr;
        var beizhu = $("#bz").val();
        // console.log("qdnyr"+qdnyr+"ygid"+ygid+"bianhao"+bianhao+"gsid"+gsid+"htlxid"+htlxid+"ksrq"+ksrq+"jsrq"+jsrq+"sxrq"+sxrq);
        // console.log("txryid"+txryid+"shiyongqiriqi"+shiyongqiriqi+"zhuanzhengriqi"+zhuanzhengriqi+"beizhu"+beizhu+"htlxid"+htlxid+"ksrq"+ksrq+"jsrq"+jsrq+"sxrq"+sxrq);
        $.ajax({
            url: "${path}/zjht",
            data:{"ygid" : ygid,
                "bianhao" : bianhao,
                "gsid" :gsid,
                "htlxid" :htlxid,
                "ksrq" : ksrq,
                "jsrq" :jsrq,
                "sxrq":sxrq,
                "txryid":txryid,
                "shiyongqiriqi":shiyongqiriqi,
                "zhuanzhengriqi":zhuanzhengriqi,
                "beizhu":beizhu,
                "htstatic":0
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
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
                url: "${path}/gscx",
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#gs").html("<option >请选择签约公司</option>");
                    for (var i = 0; i < data.length; i++) {
                        var p = data[i];
                        var html = "<option value='" + p.gsid + "'>" + p.name + "</option>";
                        $("#gs").append(html);
                    }
                }
            });
            $.ajax({
                url: "${path}/htlxcx",
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#htlx").html("<option >请选择签约合同类型</option>");
                    for (var i = 0; i < data.length; i++) {
                        var p = data[i];
                        var html = "<option value='" + p.htleixingid + "'>" + p.name + "</option>";
                        $("#htlx").append(html);
                    }
                }
            });

    });
</script>
</body>
</html>
