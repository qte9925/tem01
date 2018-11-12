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
            <label  class="col-sm-2 control-label">招聘名称</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='zpsname' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘部门</label>
            <div class="col-sm-10">
                <select class="form-control" id="zpbmid" >
                    <option>请选择部门</option>
                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘岗位</label>
            <div class="col-sm-10">
                <select class="form-control" id="zhiwei" >
                    <option>请选择岗位</option>
                </select>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘人数</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='zprs' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">招聘薪资</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='tgxinzi' />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">岗位要求</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="zhiweixinxixx" rows="3"></textarea>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label  class="col-sm-2 control-label">福利待遇</label>
            <div class="col-sm-10">
                <input type='text' class="form-control" id='fulidaiyu' />
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
        window.location.href="zpshu.jsp";
    }
    function zjht() {
        var zpsname = $("#zpsname").val();
         var zpbmid= $("#zpbmid").val();
        var zhiwei = $("#zhiwei").val();
        var zhiweixinxixx = $("#zhiweixinxixx").val();
        var tgxinzi = $("#tgxinzi").val();
        var zprs = $("#zprs").val();
        var zdry = '${sessionScope.list[0].ryid}';var fulidaiyu = $("#fulidaiyu").val();
        if(zpsname!=null&&zhiwei!=null&&zhiweixinxixx!=null&&tgxinzi!=null&&zprs!=null){
            $.ajax({
                url: "${path}/zpsinsert",
                data:{"zpsname" : zpsname,
                    'zpbmid':zpbmid,
                    "zhiwei" : zhiwei,
                    "zhiweixinxixx" :zhiweixinxixx,
                    "tgxinzi" :tgxinzi,
                    "zprs" : zprs,
                    "zdry" :zdry,
                    "fulidaiyu":fulidaiyu
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if(data==0){
                        alert("提交失败")
                    }else{
                        window.location.href="zps_shengke.jsp";
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
            url: "${path}/zpbmxq02",
            type: "post",
            <%--data:{"ryid":'${sessionScope.list[0].ryid}'},--%>
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#zpbmid").html("<option >请选择部门</option>");
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    var html = "<option value='" + p.bmid + "'>" + p.bmname + "</option>";
                    $("#zpbmid").append(html);
                }
            }
        });
         function gwrs(){
             var gw = $("#zhiwei").val();
             $.ajax({
                 url: "${path}/gwrs",
                 type: "post",
                 data:{"id":gw},
                 dataType: "json",
                 success: function (data) {
                     console.log(data);
                     if(data!=null){
                         if(data[0].gwrs>0){
                            if(data[0].gwrs>$("#zprs").val()){}else{alert("当前岗位人数不可超过"+data[0].gwrs);$("#zprs").val("0");}
                         }else{
                            alert("岗位人数已满");
                            $("#zprs").val("0");
                         }}
                 }
             });
         }

        $('#zprs').blur(function () {
            var bmid = $("#zpbmid").val();
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
                        $("#zprs").val("0");
                    }}
                }
            });
        });
        $("#zpbmid").on("change",function(){
            var bmid = $("#zpbmid").val();
            console.log("招聘岗位"+bmid);
            $.ajax({
                url: "${path}/gwcx02",
                type: "post",
                data:{"bmid":bmid},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#zhiwei").html("<option >请选择岗位</option>");
                    for (var i = 0; i < data.length; i++) {
                        var p = data[i];
                        var html = "<option value='" + p.jsid + "'>" + p.jsname + "</option>";
                        $("#zhiwei").append(html);
                    }
                }
            });
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
