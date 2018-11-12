<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>招聘需求登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="zhaopin.jsp">查看招聘需求</a></button>
</form>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">招聘需求 </caption>
    <tbody id="thead01">
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘部门</label>
            <div class="col-sm-10">
                <select class="form-control"   id="yg"   >
                    <option>请选择部门</option>
                </select>

            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘岗位</label>
            <div class="col-sm-10">
                <select class="form-control" id="gw" >
                    <option>请选择岗位</option>
                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘人数</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='rs' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">用工日期</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='datetime02' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">用工需求</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="qjyanyin" rows="3"></textarea>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='bz' />
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
        window.location.href="zhaopin.jsp";
    }
    function zjht() {
        var qjryid = $("#yg").val(); var gw = $("#gw").val();var rs = $("#rs").val();var ryid = '${sessionScope.list[0].ryid}';
        var datetime02 = $("#datetime02").val();var bz = $("#bz").val();var qjyanyin = $("#qjyanyin").val();
        if(qjryid!=null&&gw!=null&&rs!=null&&ryid!=null&&datetime02!=null){
            $.ajax({
                url: "${path}/zpjhinsert",
                data:{"xuqiubmid" : qjryid,
                    "xuqiugangwei" : gw,
                    "xuqiurenshu" :rs,
                    "djid" :ryid,
                    "yonggongriqi" : datetime02,
                    "beizhu" :bz,
                    "gwyaoqiu":qjyanyin
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data==0){
                        alert("提交失败")
                    }else{
                        window.location.href="zhaopin.jsp";
                    }
                }
            });
        }else{
        alert("需全部填写");
        }
    }
    function gg(){
        console.log("ryid"+'${sessionScope.list[0].ryid}')
        $.ajax({
            url: "${path}/zpbmxq",
            type: "post",
            data:{"ryid":'${sessionScope.list[0].ryid}'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#yg").html("<option >请选择部门</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.bmid + "'>" + p.bmname + "</option>";
                    $("#yg").append(html);
                }
            }
        });
         function gwrs(){
             var gw = $("#gw").val();
             $.ajax({
                 url: "${path}/gwrs",
                 type: "post",
                 data:{"id":gw},
                 dataType: "json",
                 success: function (data) {
                     console.log(data);
                     if(data!=null){
                         if(data[0].gwrs>0){
                            if(data[0].gwrs>$("#rs").val()){}else{alert("当前岗位人数不可超过"+data[0].gwrs);$("#rs").val("0");}
                         }else{
                            alert("岗位人数已满");
                            $("#rs").val("0");
                         }}
                 }
             });
         }

        $('#rs').blur(function () {
            var bmid = $("#yg").val();
            console.log(bmid);
            $.ajax({
                url: "${path}/wys",
                type: "post",
                data:{"id":bmid},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data!=null){
                    if(data[0].bmrs>0){
                        gwrs();
                    }else{
                        alert("部门人数已满");
                    }}
                }
            });
        });
        $("#yg").on("change",function(){
            var bmid = $("#yg").val();
            console.log(bmid);
            $.ajax({
                url: "${path}/gwcx02",
                type: "post",
                data:{"bmid":bmid},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#gw").html("<option >请选择岗位</option>");
                    for (var i = 0; i < data.length; i++) {
                        var p = data[i];
                        var html = "<option value='" + p.jsid + "'>" + p.jsname + "</option>";
                        $("#gw").append(html);
                    }
                }
            });
        });


        <%--$.ajax({--%>
            <%--url: "${path}/qjlxselect",--%>
            <%--type: "post",--%>
            <%--dataType: "json",--%>
            <%--success: function (data) {--%>
                <%--console.log(data);--%>
                <%--$("#qjlx").html("<option >请选择请假类型</option>");--%>
                <%--for (var i = 0; i < data.length; i++) {--%>
                    <%--var p = data[i];--%>
                    <%--var html = "<option value='" + p.qjlxid + "'>" + p.qjlxname + "</option>";--%>
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
