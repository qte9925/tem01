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
                <td>级数</td>
                <td>工资范围</td>
                <td>起征点</td>
                <td>税率</td>
                <td>应纳税所得额</td>
                <td>速算扣除数</td>
                <td>操作</td>

            </tr>
            <tbody id="tbody" ></tbody>
        </table>
      <%--  <table id="tbody" class="table table-striped" >

        </table>--%>

</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    增加税率信息
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table <%--style="display:none"--%>>

                            <tr>
                                <td>级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:<input type="text" id="sdid"></td>
                            </tr>
                            <tr>
                                <td>工&nbsp;&nbsp;资&nbsp;&nbsp;范&nbsp;&nbsp;围&nbsp;&nbsp;:<input type="text" id="gzfw"></td>
                            </tr>
                            <tr>
                                <td>起&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;征&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点&nbsp;&nbsp;:<input type="text" id="qzd"></td>
                            </tr>
                            <tr>
                                <td>税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;率:<input type="text" id="sl"></td>
                            </tr>
                            <tr>
                                <td>应纳税所得额:<input type="text" id="yjnsde"></td>
                            </tr>
                            <tr>
                                <td>速&nbsp;算&nbsp;扣&nbsp;除&nbsp;数:<input type="text" id="sskcs"></td>
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

                    修改税率信息
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table <%--style="display:none"--%>>

                            <tr>
                                <td>级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:<input type="text" id="sdida"></td>
                            </tr>
                            <tr>
                                <td>工&nbsp;&nbsp;资&nbsp;&nbsp;范&nbsp;&nbsp;围&nbsp;&nbsp;:<input type="text" id="gzfwa"></td>
                            </tr>
                            <tr>
                                <td>起&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;征&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点&nbsp;&nbsp;:<input type="text" id="qzda"></td>
                            </tr>
                            <tr>
                                <td>税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;率:<input type="text" id="sla"></td>
                            </tr>
                            <tr>
                                <td>应纳税所得额:<input type="text" id="yjnsdea"></td>
                            </tr>
                            <tr>
                                <td>速&nbsp;算&nbsp;扣&nbsp;除&nbsp;数:<input type="text" id="sskcsa"></td>
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
            url:"${path}/selectI",
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
                        tr = tr + "   <td>" + st.sdid + "</td>";
                        tr = tr + "    <td>" + st.gzfw + "</td>";
                        tr = tr + "    <td>" + st.qzd + "</td>";
                        tr = tr + "    <td>" + st.sl + "</td>";
                        tr = tr + "    <td>" + st.yjnsde + "</td>";
                        tr = tr + "    <td>" + st.sskcs + "</td>";
                        tr = tr + "    <td><input  type=\"button\" value='修改' onclick='aa(" + st.sdid + ")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\">";
                        tr = tr + "    <input  type=\"button\" value='删除' onclick='bb(" + st.sdid + ")' class=\"btn btn-primary\"/></td>";
                        tr = tr + "   </tr>";
                        $("#tbody").append(tr);
                    }
                }
            }

        });
        $("#insert").click(function(){
            alert("sss")
            $.ajax({
                url:"${path}/insertI",
                data:{"sdid":$("#sdid").val(),
                    "gzfw":$("#gzfw").val(),
                    "qzd":$("#qzd").val(),
                    "sl":$("#sl").val(),
                    "yjnsde":$("#yjnsde").val(),
                    "sskcs":$("#sskcs").val(),
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

    function aa(sdid){
        alert("sss"+sdid)
        $.ajax({
            url:"${path}/selectIByid",
            data:{"id":sdid},
            dataType:"json",
            type:"post",
            ansy:false,
            success:function(data){
                console.log(data);

                $("#sdida").val(data.sdid);
                $("#gzfwa").val(data.gzfw);
                $("#qzda").val(data.qzd);
                $("#sla").val(data.qzd);
                $("#yjnsdea").val(data.yjnsde);
                $("#sskcsa").val(data.sskcs);

            }
        });
        $("#update").click(function(){

            $.ajax({
                url:"${path}/updateI",
                data:{"id":sdid,
                    "sdid":$("#sdida").val(),
                    "gzfw":$("#gzfwa").val(),
                    "qzd":$("#qzda").val(),
                    "sl":$("#sla").val(),
                    "yjnsde":$("#yjnsdea").val(),
                    "sskcs":$("#sskcsa").val()

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

    function bb(sdid){
        $.ajax({
            url:"${path}/deleteI",
            data:{"id":sdid},
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

