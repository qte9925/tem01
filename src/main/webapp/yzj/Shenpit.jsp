<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    <%--<script type="text/javascript" src="'${path}'/js/jquery-1.8.3.min.js"></script>--%>
    <link rel="stylesheet" href="js/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script></head>
    <script src="${path}/yzj/laydate/laydate.js"></script>
</head>

<style>
    #jihua{
        width:1000px;
    }
    #zjbm{
        width:800px;
    }
</style>

<script type="text/javascript">
    /*送审*/
    function SongShen(Id,statu){
        $.ajax({
            url:"${path}/UpdateStatu",
            type:"post",
            data:{"Id":Id,"statu":statu},
            dataType:"json",
            success:function(data){
                console.log(data);
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    /*状态,驳回理由*/
    function UpdatePlanMessage(id,zt){
        $("#a1").val(id); $("#a3").val(zt);$("#a4").val(xinxi);
    }
    /*通过驳回*/
    function tijiao(){
        $.ajax({
        url:"${path}/updatestatu",
        type:"post",
        data:{"id":$("#a1").val(),"zt":$("#a3").val(),"xinxi":$("#a4").val()},
        dataType:"json",
        success:function(data){

        console.log(data);
        if(data>0){
        window.location.reload();
        }
        }
        })
    }
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/StatuOne",
            data:{"aa":$("#staff").val(),"Pid":$("#Pid").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                $("#yzj").html('');
                console.log(data);
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.planname + "</td>";
                    html = html + "<td>" + p.joinpeople + "</td>";
                    html = html + "<td>" + p.trainingaddress + "</td>";
                    html = html + "<td>" + p.classname + "</td>";
                    html = html + "<td>" + p.totalhours + "</td>";
                    html = html + "<td>" + p.beginclass + "</td>";
                    html = html + "<td>" + p.endclass + "</td>";
                    html = html + "<td>" + p.rainingbudget + "</td>";
                    html = html + "<td>" + p.rainingRequirement + "</td>";
                    html = html + "<td>" + p.rainingexplain + "</td>";
                    html = html + "<td>" + p.bmname + "</td>";
                    html = html + "<td>" + p.qvdao + "</td>";
                    html = html + "<td>" + p.xingshi + "</td>";
                    html = html + "<td><button onclick='UpdatePlanMessage("+p.Id+",2)'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModalb'>通过</button>";
                    html = html + "<button onclick='UpdatePlanMessage("+p.Id+",3)'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal'  data-target='#myModalb'>驳回</button>";
                    html = html + "</td>";
                    html = html + "</tr>";

                    $("#yzj").append(html);
                }
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);

                //最后一页的下一页显示隐藏

                if (data.isLastPage) {
                    $("#next").hide();
                } else {
                    $("#next").show();
                }
                //第一页的上一页显示隐藏

                if (data.isFirstPage) {
                    $("#pre").hide();
                } else {
                    $("#pre").show();
                }
            }
        })

    }
   $().ready(function() {
        getinfo(1);
        $("#selectBtn").click(function() {
            getinfo(1);
        });
    });
    function changePage(op){
        var nowPage=$("#nowPage").html();
        if(op=='next')
            nowPage=Number(nowPage)+1;
        else
            nowPage=Number(nowPage)-1;
        getinfo(nowPage);
    }
    function Shenpi(Id){
        window.location.href="yzj/chaxun.jsp"
    }


</script>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModalb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
            </div>
            <table class="table table-bordered">
            <tr>
                <td>修改的列ID</td>
                 <td><input type="text" id="a1"disabled="disabled"></td>
                <td>修改人</td>
                <td>${sessionScope.list[0].yhname}</td>
            </tr>
                <tr>
                    <td>理由</td>
                    <td><input type="text" id="a4"></td>
                    <td><td><input type="text" value="" style="display:none" id="a3"/></td></td>
                </tr>
                <tr>

                </tr>
            </table>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="tijiao();">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div style="text-align:center;">
    <tr><td>培训课时<input type="text" id="Pid"></td></tr>
    <tr><td>计划名称<input type="text" id="staff"></td></tr>
    <button id="selectBtn" class='btn btn-primary'>查询</button>
</div>

    </button>
    <table class="table table-bordered">
        <thead>
        <tr>

            <th>计划名称</th>
            <th>参加人数</th>
            <th>培训地点</th>
            <th>课程名称</th>
            <th>总课时</th>
            <th>开课时间</th>
            <th>结课时间</th>
            <th>培训预算</th>
            <th>培训要求</th>
            <th>培训说明</th>
            <th>参与部门</th>
            <th>培训渠道</th>
            <th>培训形式</th>
            <th><center>操作</center></th>
        </tr>
        </thead>
        <tbody id="yzj">

        </tbody>
    </table>

<table>
    <center>
    <a id="pre" onclick="changePage('pre')">上一页</a>
    <a id="next" onclick="changePage('next')">下一页</a>
    当期页<span id="nowPage"></span>
    总共<span id="total"></span>条
</center>
</table>
<center>

</center>
</html>
