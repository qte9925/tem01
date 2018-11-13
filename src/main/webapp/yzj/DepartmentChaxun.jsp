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
    function xiugaixuqiuxinxi(id,zt){
        $.ajax({
            url:"${path}/xiugaixuqiuxinxib",
            type:"post",
            data:{"id":id,"zt":zt},
            dataType:"json",
            success:function(data){
                console.log(data);
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    lay('#version').html('-v'+ laydate.v);
    //执行一个laydate实例
    laydate.render({
        elem: '#cc' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#writeTime' //指定元素
    });
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/selectDepartment",
            data:{"needName":$("#needName").val(),"bmId":$("#bmId").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                $("#YZWDepartment").html('');
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.needName + "</td>";
                    html = html + "<td>" + p.writePeople + "</td>";
                    html = html + "<td>" + p.writeTime + "</td>";
                    html = html + "<td>" + p.shenpimode + "</td>";
                    html = html + "<td>" + p.bmname + "</td>";
                    /*if(p.statu==0){
                        html = html + "<td>未审核</td>";
                    }else if(p.statu==1){
                        html = html + "<td>审核中</td>";
                    } else if(p.statu==2){
                        html = html + "<td>通过</td>";
                    } else if(p.statu==3){
                        html = html + "<td>未通过</td>";
                    }*/
                    html = html + "<td>";
                    html = html + "<button onclick='deleteDepartmentNeed(" + p.Id + ")'  class='btn btn-primary' >删除</button>";
                    html = html + "<button onclick='UpdateNeeds(" + p.Id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button>";


                    html = html + "</td>";
                    html = html + "</tr>";
                    $("#YZWDepartment").append(html);
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
    /*模糊查询*/
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
    function deleteDepartmentNeed(Id){
        $.ajax({
            url:"${path}/deleteDepartment",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    /*添加*/
    $().ready(function(){

        $("#aDDa").click(function(){
            $.ajax({
                url:"${path}/AddDepartmentYZJ",
                data:{"needName":$("#nn").val(),
                    "writePeople":$("#bb").val(),
                    "writeTime":$("#cc").val(),
                    "shenpimode":$("#dd").val(),
                    "departmentid":$("#departmentid").val(),
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

    function UpdateNeeds(Id){
        //修改前查询
        $.ajax({
            url:"${path}/selectByIdDepartment",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    $("#eedName").val(p.needName);
                    $("#writePeople").val(p.writePeople);
                    $("#writeTime").val(p.writeTime);
                    $("#shenpimode").val(p.shenpimode);
                    $("#type").val(p.bmid);

                }
            }
        })
        $.ajax({
            url:"${path}/FindDepartmentYzj",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#type").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.bmid+"'>"+p.bmname+"</option>";
                    $("#type").append(html);
                }
            }
        })

        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/updateDepartment",
                type:"post",
                dataType:"json",
                data:{
                    "needName":$("#eedName").val(),
                    "writePeople":$("#writePeople").val(),
                    "writeTime":$("#writeTime").val(),
                    "shenpimode":$("#shenpimodea").val(),
                    "shenpimode":$("#shenpimode").val(),
                    "departmentid":$("#type").val(),
                    "Id":Id
                },
                success:function(data){
                    window.location.href="/yzj/DepartmentChaxun.jsp";
                }
            })
        })
    }
</script>
<div style="text-align:center;">
    部门编号<input type="text" id="bmId">
    需求内容<input type="text" id="needName">
    <button id="selectBtn" class='btn btn-primary'>查询</button>
    <button class='btn btn-primary' data-toggle="modal" data-target="#myModal">
        增加
    </button>
</div>
<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>需求内容</th>
            <th>填单人</th>
            <th>填单日期</th>
            <th>审批方式</th>
            <th>部门</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="YZWDepartment">

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
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>需求内容:</td>
                        <td><input type="text" id="nn"></td>
                    </tr>
                    <tr>
                        <td>填单人:</td>
                        <td><input type="text" name="post" id="bb"></td>
                    </tr>
                    <tr>
                        <td>填单日期:</td>
                        <td><input type="text" name="shenpimode" id="cc"></td>
                    </tr>
                    <tr>
                        <td>审批方式:</td>
                        <td><input type="text" name="education" id="dd"></td>
                    </tr>
                    <tr>
                        <td>部门编号:</td>
                        <td><input type="text" name="department" id="departmentid"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="aDDa">
                    增加
                </button>
            </div>
        </div>
    </div>
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
                <table>
                    <tr>
                        <td>需求内容:</td>
                        <td><input type="text" id="eedName"></td>
                    </tr>
                    <tr>
                        <td>填单人:</td>
                        <td><input type="text" id="writePeople"></td>
                    </tr>
                    <tr>
                        <td>填单日期</td>
                        <td><input id="writeTime"></td>
                    </tr>
                    <tr>
                        <td>审批方式:</td>
                        <td><input id="shenpimode"></td>
                    </tr>
                    <tr>
                        <td>部门:</td>
                        <td><select id="type"></select></td>
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
</html>
