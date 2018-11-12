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

</style>

<script type="text/javascript">
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#begintime' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#endtime' //指定元素
    });


    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#cc' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#dd' //指定元素
    });
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/selectKaoHeYzj",
            data:{"khname":$("#khname").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                console.log(data);
                $("#yzj").html('');
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.kaohename + "</td>";
                    html = html + "<td>" + p.jsname + "</td>";
                    html = html + "<td>" + p.begintime + "</td>";
                    html = html + "<td>" + p.endtime + "</td>";
                    html = html + "<td>" + p.statu + "</td>";
                    html = html + "<td>" + p.beizhu + "</td>";
                  /*  if(p.statu==0){
                        html = html + "<td>未审核</td>";
                    }else if(p.statu==1){
                        html = html + "<td>审核中</td>";
                    } else if(p.statu==2){
                        html = html + "<td>通过</td>";
                    } else if(p.statu==3){
                        html = html + "<td>未通过</td>";
                    }*/
                    html = html + "<td><button onclick='deleteKao(" + p.id + ")'  class='btn btn-primary' >删除</button>" +
                        "<button onclick='UpdateNeeds(" + p.id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button>";
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
/*删除*/
    function deleteKao(Id){
        alert("确认删除吗？")
        $.ajax({
            url:"${path}/deleteKaoHeYzj",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                console.log(data);
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    /*添加*/
    $().ready(function(){

        $("#adda").click(function(){
            $.ajax({
                url:"${path}/AddKaoHeYZJ",
                data:{"kaohename":$("#kaohename").val(),
                    "kaoherenid":$("#kaoherenid ").val(),
                    "begintime":$("#begintime").val(),
                    "endtime":$("#endtime").val(),
                    "statu":$("#statu").val(),
                    "beizhu":$("#beizhu").val(),
                },
                dataType:"json",
                type:"post",
                success:function(data){
                       if(data>0){
                           window.location.reload();
                       }
                 }
            });
        });
    });
    /*---------------------------------------------------------------------------------------*/
    //修改前查询
    function UpdateNeeds(Id){
        $.ajax({
            url:"${path}/selectByIdKaoHeYzj",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    $("#aa").val(p.kaohename);
                    $("#cc").val(p.begintime);
                    $("#dd").val(p.endtime);
                    $("#ee").val(p.statu);
                    $("#ff").val(p.beizhu);
                }
            }
        })
        /*下拉框*/
        $.ajax({
            url:"${path}/FindKaoHerenType",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#bb").html();
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    var html = "<option value='"+p.jsid+"'>"+p.jsname+"</option>"
                    $("#bb").append(html);
                }
            }
        })
        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/updateKaoHeYzj",
                type:"post",
                dataType:"json",
                data:{
                    "kaohename":$("#aa").val(),
                    "kaoherenid":$("#bb").val(),
                    "begintime":$("#cc").val(),
                    "endtime":$("#dd").val(),
                    "statu":$("#ee").val(),
                    "beizhu":$("#ff").val(),
                    "Id":Id
                },
                success:function(data){
                    window.location.href="/yzj/Kaohe.jsp";
                }
            })
        })
    }
</script>
<div style="text-align:center;">
    姓名<input type="text" id="khname">
    <button id="selectBtn" class='btn btn-primary'>查询</button>
    <button class='btn btn-primary' data-toggle="modal" data-target="#myModal">
        新建考核信息
    </button>
</div>
<div class="container">

        <table class="table table-bordered">
            <thead>

            <tr>
                <td>考核名称</td>
                <td>考核人</td>
                <td>开始时间</td>
                <td>结束时间</td>
                <td>状态</td>
                <td>备注</td>
                <td>操作</td>
            </tr>

            </thead>
            <tbody id="yzj">

            </tbody>
        </table>
</div>
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
<!-- 增加得---------------------------------------模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
               <%-- <h4 class="modal-title" id="myModalLabel">
                    模态框（Modal）标题
                </h4>--%>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <td>考核名称</td>
                        <td><input type="text" id="kaohename"></td>
                        <td>考核人ID</td>
                        <td><input type="text" id="kaoherenid"></td>
                    </tr>
                    <tr>
                        <td>开始时间</td>
                        <td><input type="text" id="begintime"></td>
                        <td>结束时间</td>
                        <td><input type="text" id="endtime"></td>
                    </tr>
                    <tr>
                        <td>状态</td>
                        <td><input type="text" id="statu"></td>
                        <td>备注</td>
                        <td><input type="text" id="beizhu"></td>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="adda">
                    增加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</table>
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
                    <thead>
                    <tr>
                        <td>考核名称</td>
                        <td><input type="text" id="aa"></td>
                        <td>考核人ID</td>
                        <td><select id="bb"></select></td>
                    </tr>
                    <tr>
                        <td>开始时间</td>
                        <td><input type="text" id="cc"></td>
                        <td>结束时间</td>
                        <td><input type="text" id="dd"></td>
                    </tr>
                    <tr>
                        <td>状态</td>
                        <td><input type="text" id="ee"></td>
                        <td>备注</td>
                        <td><input type="text" id="ff"></td>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
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
</html>
