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
<!-- 模态框（Modal） -->

<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改信息
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tr>
                        <td>考核结果:<select id="jieguo">
                            <option value="0">通过</option>
                            <option value="1">不通过</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>备注:<textarea type="text"id="beizhu"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateBtn">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<table class="table table-bordered">
    <tr>
        <th>员工姓名</th>
        <th>结果</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    <tbody id="tbody">

    </tbody>
</table>
</html>
<script>
    function getinfo() {
        $.ajax({
            url:"${path}/selectBecome",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data);
                $("#tbody").html("");
                for(var i=0;i<data.length;i++){
                    var p=data[i];
                    var html="<tr>";
                    html=html+"<td>"+p.ryxm+"</td>";
                    if(p.ryzwzt==undefined){
                        html=html+"<td>未录入转正结果</td>";
                        html=html+"<td>未录入备注</td>";
                        html=html+"<td><button onclick='jieguo("+p.ryid+")' data-toggle='modal' data-target='#myModala'>录入转正结果</button></td>";
                    }else if(p.ryzwzt==0){

                        html=html+"<td>已转正</td>";
                        html=html+"<td>"+p.beizhu+"</td>";
                        html=html+"<td><font color='lightgreen'>已通过</font></td>";
                    }else if(p.ryzwzt==1){
                        html=html+"<td>转正审批中</td>";
                        html=html+"<td>"+p.beizhu+"</td>";
                        html=html+"<td><button onclick='jieguo("+p.ryid+")' data-toggle='modal' data-target='#myModala'>重新录入</button></td>";
                    }
                    html=html+"</tr>";
                    $("#tbody").append(html);
                }
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
    function jieguo(ryid){
        $("#updateBtn").val(ryid);
    }
    $("#updateBtn").click(function(){
        $.ajax({
            url:"${path}/updateBecome",
            type:"post",
            dataType:"json",
            data:{
                "ryid":$("#updateBtn").val(),
                "ryzwzt":$('#jieguo option:selected').val(),
                "beizhu":$("#beizhu").val()
            },
            success:function(data){
                if(data.state){
                    alert(data.message);
                    window.location.reload();
                }
            }
        })
    })
</script>
