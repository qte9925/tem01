<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'select.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%--
<style>

    #addBtn{
        padding-left:150px
    }
</style>--%>

<body>
<div style="text-align:center;">
    <button id="addBtn"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">增加</button>

    <table class="table table-bordered">
        <tr id="jz">
            <td>序号</td>
            <td>失业保险</td>
            <td>养老保险</td>
            <td>医疗保险</td>
            <td>操作</td>

        </tr>
        <tbody id="tbody"></tbody>
    </table>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    增加保险信息
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table <%--style="display:none"--%>>

                            <tr>
                                <td>失业保险:<input type="text" id="unemployments"></td>
                            </tr>
                            <tr>
                                <td>养老保险:<input type="text" id="pensions"></td>
                            </tr>
                            <tr>
                                <td>医疗保险:<input type="text" id="medicals"></td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="insert">
                    增加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">

                    修改保险信息
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table <%--style="display:none"--%>>

                            <tr>
                                <td>序号:<input type="text" id="bxida"></td>
                            </tr>
                            <tr>
                                <td>失业保险:<input type="text" id="unemploymentsa"></td>
                            </tr>
                            <tr>
                                <td>养老保险:<input type="text" id="pensionsa"></td>
                            </tr>
                            <tr>
                                <td>医疗保险:<input type="text" id="medicalsa"></td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="update">
                    修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>

<script !src="text/javascript">
    $().ready(function(){
        $.ajax({
            url:"${path}/selectIn",
            data:{},
            dataType:"json",
            type:"post",
            success:function(data) {
                console.log(data)
                $("#tbody").html('');
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var st = data[i];
                        var tr = "<tr>";
                        tr = tr + "   <td>" + st.bxid + "</td>";
                        tr = tr + "    <td>" + st.Unemployments + "</td>";
                        tr = tr + "    <td>" + st.Pensions + "</td>";
                        tr = tr + "    <td>" + st.Medicals + "</td>";
                        tr = tr + "    <td><input  type=\"button\" value='修改' onclick='aa(" + st.bxid + ")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\">";
                        tr = tr + "    <input  type=\"button\" value='删除' onclick='bb(" + st.bxid + ")' class=\"btn btn-primary\"/></td>";
                        tr = tr + "   </tr>";
                        $("#tbody").append(tr);
                    }
                }
            }

        });
        $("#insert").click(function(){
            alert("sss")
            $.ajax({
                url:"${path}/insertIn",
                data:{
                    "unemployments":$("#unemployments").val(),
                    "pensions":$("#pensions").val(),
                    "medicals":$("#medicals").val()
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

    function aa(bxid){
        alert("sss"+bxid)
        $.ajax({
            url:"${path}/selectInByid",
            data:{"id":bxid},
            dataType:"json",
            type:"post",
            ansy:false,
            success:function(data){
                console.log(data);

                $("#bxida").val(data.bxid);
                $("#unemploymentsa").val(data.Unemployments);
                $("#pensionsa").val(data.Pensions);
                $("#medicalsa").val(data.Medicals);


            }
        });
        $("#update").click(function(){

            $.ajax({
                url:"${path}/updateIn",
                data:{"id":bxid,
                    "bxid":$("#sdida").val(),
                    "unemployments":$("#unemploymentsa").val(),
                    "pensions":$("#pensionsa").val(),
                    "medicals":$("#medicalsa").val()

                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data>0){
                        $("#editFood").hide();
                        window.location.reload();

                    }
                }
            });
        });
    }

    function bb(bxid){
        $.ajax({
            url:"${path}/deleteIn",
            data:{"id":bxid},
            dataType:"json",
            type:"post",
            success:function(data){
                if(data>0){
                    window.location.reload();

                }
            }
        });

    }

</script>
</html>

