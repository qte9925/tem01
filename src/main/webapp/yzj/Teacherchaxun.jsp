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
    /*状态ajax*/
 /*   function UpdateMessage(id,zt){
        $.ajax({
            url:"${path}/xiugaixuqiuxinxia",
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
    }*/
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/selectYzjTeachera",
            data:{"teaname":$("#teaname").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                $("#yzj").html('');
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.tnum + "</td>";
                    html = html + "<td>" + p.tname + "</td>";
                    html = html + "<td>" + p.sex + "</td>";
                    html = html + "<td>" + p.education + "</td>";
                    html = html + "<td>" + p.curriculumid + "</td>";
                    html = html + "<td>" + p.address + "</td>";
                    html = html + "<td>" + p.telephone + "</td>";
                    html = html + "<td>" + p.email + "</td>";
                  /*  if(p.statu==0){
                        html = html + "<td>未审核</td>";
                    }else if(p.statu==1){
                        html = html + "<td>审核中</td>";
                    } else if(p.statu==2){
                        html = html + "<td>通过</td>";
                    } else if(p.statu==3){
                        html = html + "<td>未通过</td>";
                    }*/
                    html = html + "<td><button onclick='deleteNeed(" + p.Id + ")'  class='btn btn-primary' >删除</button>" +
                        "<button onclick='UpdateNeeds(" + p.Id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button>";
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
    function deleteNeed(Id){
        alert("确认删除吗？")
        $.ajax({
            url:"${path}/deleteYzjTeachera",
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

        $("#adda").click(function(){
            $.ajax({
                url:"${path}/addYzjTeachera",
                data:{"tnum":$("#a").val(),
                    "tname":$("#b ").val(),
                    "sex":$("#c").val(),
                    "education":$("#d").val(),
                    "curriculumid":$("#e").val(),
                    "address":$("#f").val(),
                    "telephone":$("#g").val(),
                    "email":$("#h").val(),
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
            url:"${path}/selectByIdYzjTeachera",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    $("#aa").val(p.tnum);
                    $("#bb").val(p.tname);
                    $("#cc").val(p.sex);
                    $("#dd").val(p.education);
                    $("#ee").val(p.curriculumid);
                    $("#ff").val(p.address);
                    $("#gg").val(p.telephone);
                    $("#hh").val(p.email);
                }
            }
        })
        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/updateYzjTeachera",
                type:"post",
                dataType:"json",
                data:{
                    "tnum":$("#aa").val(),
                    "tname":$("#bb").val(),
                    "sex":$("#cc").val(),
                    "education":$("#dd").val(),
                    "curriculumid":$("#ee").val(),
                    "address":$("#ff").val(),
                    "telephone":$("#gg").val(),
                    "email":$("#hh").val(),
                    "Id":Id
                },
                success:function(data){
                    window.location.href="/yzj/Teacherchaxun.jsp";
                }
            })
        })
    }
</script>
<div style="text-align:center;">
    姓名<input type="text" id="teaname">
    <button id="selectBtn" class='btn btn-primary'>查询</button>
    <button class='btn btn-primary' data-toggle="modal" data-target="#myModal">
        增加
    </button>
</div>
<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>教师编号</th>
            <th>教师姓名</th>
            <th>性别</th>
            <th>学历</th>
            <th>课程ID</th>
            <th>地址</th>
            <th>电话</th>
            <th>邮箱</th>
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
                        <td>教师编号:</td>
                        <td><input type="text" name="staffName" id="a"></td>
                    </tr>
                    <tr>
                        <td>教师姓名:</td>
                        <td><input type="text" name="post" id="b"></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td><input type="text" name="shenpimode" id="c"></td>
                    </tr>
                    <tr>
                        <td>学历:</td>
                        <td><input type="text" name="education" id="d"></td>
                    </tr>
                    <tr>
                        <td>课程ID:</td>
                        <td><input type="text" name="writePeople" id="e"></td>
                    </tr>
                    <tr>
                        <td>地址:</td>
                        <td><input type="text" name="department" id="f"></td>
                    </tr>
                    <tr>
                        <td>电话:</td>
                        <td><input type="text" name="department" id="g"></td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td><input type="text" name="department" id="h"></td>
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
                        <td>教师编号:</td>
                        <td><input type="text" id="aa"></td>
                    </tr>
                    <tr>
                        <td>教师姓名:</td>
                        <td><input type="text" id="bb"></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td><input type="text" id="cc"></td>
                    </tr>
                    <tr>
                        <td>学历</td>
                        <td><input id="dd"></td>
                    </tr>
                    <tr>
                        <td>课程ID:</td>
                        <td><input id="ee"></td>
                    </tr>
                    <tr>
                        <td>地址:</td>
                        <td><input id="ff"></td>
                    </tr>
                    <tr>
                        <td>电话:</td>
                        <td><input id="gg"></td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td><input id="hh"></td>
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
