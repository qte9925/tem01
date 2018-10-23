<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>人员变动申请</title>
    <style type="text/css">
        h2{
            margin:0 auto;
            text-align: center;
        }
        table{
            border-collapse:collapse;
            text-align: center;
            margin: 0 auto;
        }
        table span{
            display: inline-block;
            width: 100px;
            text-align: right;
        }
        #time span{
            width: 30px;
        }
    </style>
</head>
<body style="margin-bottom: 30px;">
<form class="form-inline" role="form" id="name01">
    <div class="form-group">
        <label for="name01">业务类型</label>
        <select class="form-control" id="select01" onchange="rybdleixingchaxun();">
            <option>请选择</option>
        </select>
    </div>
</form>
<!-- 列表显示 -->
<table class="table table-striped">
    <caption>申请列表</caption>
    <thead>
    <tr>
        <th>编号</th>
        <th>申请人</th>
        <th>审批人</th>
        <th>业务类型</th>
        <th>申请日期</th>
        <th>审批日期</th>
        <th>审批状态</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="yhid01">

    </tbody>
</table>
<!-- 按钮触发模态框 -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    模态框（Modal）标题
                </h4>
            </div>
            <div class="modal-body">
                <table border="1">
                    <tr>
                        <td width="140" height="70;" align="center">项目名称</td>
                        <td width="470" colspan="6">111 </td>
                    </tr>
                    <tr>
                        <td height="60">项目实施地点</td>
                        <td  colspan="6" style="text-align:left;">
                            <span>市</span>
                            <span>县</span>
                            <span style="width:130px;">区（乡）</span>
                            <span>村</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="65" >申请单位名称</td>
                        <td  colspan="6"> </td>
                    </tr>
                    <tr>
                        <td height="70">资质<br>证书编号</td>
                        <td colspan="2"  width="180"> </td>
                        <td colspan="2" width="125">单位联系电话</td>
                        <td colspan="2" width="175"> </td>
                    </tr>
                    <tr>
                        <td height="60">经办人姓名</td>
                        <td colspan="2" > </td>
                        <td colspan="2" >经办人<br>联系电话</td>
                        <td colspan="2" > </td>
                    </tr>
                    <tr><td height="70">经办人<br>身份证号</td>
                        <td  colspan="6"> </td>
                    </tr>
                    <tr  id="time">
                        <td height="45">起止时间</td>
                        <td colspan="3" width="240"><span>年</span><span>月</span><span>日</span></td>
                        <td colspan="3" width="220"><span>年</span><span>月</span><span>日</span></td>
                    </tr>
                    <tr>
                        <td height="45">数量</td>
                        <td colspan="3" style="padding:0;" >
                            <table  border="0" style="border:none;">
                                <tr>
                                    <td width="85" height="47" style="border-right:1px solid rgb(128,128,128);"></td>
                                    <td width="160">品牌型号</td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="3" ></td>
                    </tr>
                    <tr>
                        <td height="50">需求</td>
                        <td  colspan="6"> </td>
                    </tr>
                    <tr>
                        <td height="60">需求1</td>
                        <td colspan="2" > </td>
                        <td colspan="2" >需求1</td>
                        <td colspan="2"> </td>
                    </tr>
                    <tr>
                        <td height="120">备注</td>
                        <td  colspan="6"> </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    //查询人员变动的业务类型
    function a01(){
        $.ajax({
            url: "${path}/rybdleixingchaxun",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#select01").html("<option>请选择</option>");
                for (var i2=0;i2<data.length;i2++){
                    var html02 = "<option value='"+data[i2].rybdid+"'>"+data[i2].rybdname+"</option>";
                    $("#select01").append(html02);
                }
            }
        });
    }
    //查询人员的变动申请
    function a02(){
        $.ajax({
            url: "${path}/rlsq",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#yhid01").html('');
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.rlbh + "</td>";
                    html = html + "<td>" + p.ryname + "</td>";
                    html = html + "<td>" + p.rlshenpiname + "</td>";
                    html = html + "<td>" + p.rybdname + "</td>";
                    html = html + "<td>" + p.rlkaishiriqi + "</td>";
                    if(p.rljieshuriqi==null){
                        html = html + "<td>--</td>";
                    }else {
                        html = html + "<td>"+p.rljieshuriqi+"</td>";
                    }

                    if (p.rlstatic==0){
                        html = html + "<td>待审批</td>";
                    }
                    if (p.rlstatic==1){
                        html = html + "<td>已审批</td>";
                    }
                    if (p.rlstatic==2){
                        html = html + "<td>未审批</td>";
                    }

                    html = html + "<td>" + p.rlbeizhu + "</td>";
                    html = html + "<td><button class=\"btn btn-primary btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\">查看详情</button>   ";
                    +"";
                    html = html + "</tr>";
                    $("#yhid01").append(html);
                }
            }
        });
    }
    function  rybdleixingchaxun() {
        console.log("出发")
    }
    //页面加载完成后执行那些方法
    $().ready(function () {
        a01();a02();
    });

</script>
</body>
</html>
