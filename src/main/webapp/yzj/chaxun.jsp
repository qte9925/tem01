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
</head>

<style>

</style>

<script type="text/javascript">
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/select",
            data:{"staff":$("#staff").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                $("#yzj").html('');
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.staffName + "</td>";
                    html = html + "<td>" + p.bmname + "</td>";
                    html = html + "<td>" + p.post + "</td>";
                    html = html + "<td>" + p.shenpimode + "</td>";
                    html = html + "<td>" + p.education + "</td>";
                    html = html + "<td>" + p.writePeople + "</td>";
                    html = html + "<td><button onclick='deleteNeed(" + p.Id + ")'  class='btn btn-primary' >删除</button>" +
                        "<button onclick='UpdateNeeds(" + p.Id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button></td>";
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
alert("as")
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

    function deleteNeed(Id){
        $.ajax({
            url:"${path}/delete",
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
  /*  function UpdateNeeds(Id){
        window.location.href="/yzj/update.jsp?Id="+Id;
    }*/
    $().ready(function(){

        $("#adda").click(function(){
            $.ajax({
                url:"${path}/Add",
                data:{"staffName":$("#staffName").val(),
                    "post":$("#post ").val(),
                    "shenpimode":$("#shenpimode").val(),
                    "education":$("#education").val(),
                    "writePeople":$("#writePeople").val(),
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
        alert(Id)
        //修改前查询
        $.ajax({
            url:"${path}/selectById",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    $("#staffNamea").val(p.staffName);
                    $("#department").val(p.department);
                    $("#posta").val(p.post);
                    $("#shenpimodea").val(p.shenpimode);
                    $("#educationa").val(p.education);
                    $("#writePeoplea").val(p.writePeople);
                    $("#bmida").val(p.bmid);

                }
            }
        })
        $.ajax({
            url:"${path}/FindDepartment",
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
                url:"${path}/update",
                type:"post",
                dataType:"json",
                data:{
                    "staffName":$("#staffNamea").val(),
                    "departmentid":$("#type").val(),
                    "post":$("#posta").val(),
                    "shenpimode":$("#shenpimodea").val(),
                    "education":$("#educationa").val(),
                    "writePeople":$("#writePeoplea").val(),
                    "Id":Id
                },
                success:function(data){
                    window.location.href="/yzj/chaxun.jsp";
                }
            })
        })
    }
</script>
<div style="text-align:center;">
    需求内容<input type="text" id="staff">
    <button id="selectBtn" class='btn btn-primary'>查询</button>
    <button class='btn btn-primary' data-toggle="modal" data-target="#myModal">
        增加
    </button>
</div>
<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>需求内容</th>
            <th>部门</th>
            <th>职务</th>
            <th>审批方式</th>
            <th>学历</th>
            <th>审批人</th>
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
                <table>
                    <tr>
                        <td>需求内容:</td>
                        <td><input type="text" name="staffName" id="staffName"></td>
                    </tr>
                    <tr>
                        <td>职位:</td>
                        <td><input type="text" name="post" id="post"></td>
                    </tr>
                    <tr>
                        <td>审批方式:</td>
                        <td><input type="text" name="shenpimode" id="shenpimode"></td>
                    </tr>
                    <tr>
                        <td>学历:</td>
                        <td><input type="text" name="education" id="education"></td>
                    </tr>
                    <tr>
                        <td>填单人:</td>
                        <td><input type="text" name="writePeople" id="writePeople"></td>
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
                <table>
                    <tr>
                        <td>需求内容:</td>
                        <td><input type="text" id="staffNamea"></td>
                    </tr>
                    <tr>
                        <td>部门:</td>
                        <td><select id="type"></select></td>
                    </tr>
                    <tr>
                        <td>职位:</td>
                        <td><input type="text" id="posta"></td>
                    </tr>
                    <tr>
                        <td>审批方式</td>
                        <td><input id="shenpimodea"></td>
                    </tr>
                    <tr>
                        <td>学历:</td>
                        <td><input id="educationa"></td>
                    </tr>
                    <tr>
                        <td>审批人:</td>
                        <td><input id="writePeoplea"></td>
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
