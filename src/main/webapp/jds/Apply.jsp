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
<body>
<center>
    员工编号:<input type="text" id="mjs">
    <button id="selectBtn" class="btn btn-primary">查询</button>
    <button id="addBtn"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">增加</button>
</center>
<div>
    <center>
        <table class="table table-bordered">
            <tr>
                <td>序号</td>
                <td>姓名</td>
                <td>员工编号</td>
                <td>申请主题</td>
                <td>申请日期</td>
                <td>操作</td>
            </tr>
            <tbody id="tbody"></tbody>
        </table>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页
    </center>
</div>
<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    请填写驳回理由
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    <textarea rows="10" cols="50" id="bz1"></textarea>
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="bh">
                    驳回
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModalc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelc">
                    报销申请详情
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    员工姓名：
                                </td>
                                <td>
                                    <input type="text" id="s11" disabled="disabled">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    员工编号：
                                </td>
                                <td>
                                    <input type="text" id="s21" disabled="disabled">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请主题：
                                </td>
                                <td>
                                    <input type="text" id="s31" disabled="disabled">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请金额：
                                </td>
                                <td>
                                    <input type="text" id="s41" disabled="disabled">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    申请凭证：
                                </td>
                                <input type="text" id="aa1" style="display:none">
                                <input type="text" id="a21" style="display:none">

                                <td>
                                    <img id="a11" src=""/>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    申请理由：
                                </td>
                                <td>
                                    <input type="text" id="s51" disabled="disabled">
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
    function searchInfo(nowPage){
        $.ajax({
            url:"${path}/selectSa",
            data:{"sqid":$("#mjs").val(),"nowPage":nowPage},
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data)
                $("#tbody").html('');
                if(data!=null){
                    for(var i=0;i<data.list.length;i++){
                        var st=data.list[i];
                        var tr="<tr>";
                        tr=tr+"   <td>"+(i+1)+"</td>";
                        tr=tr+"    <td>"+st.sqname+"</td>";
                        tr=tr+"    <td>"+st.sqid+"</td>";
                        tr=tr+"    <td>"+st.sqzt+"</td>";
                        tr=tr+"    <td>"+st.sqdata+"</td>";
                        tr=tr+"    <td><input type=\"button\" value='通过' onclick='aa("+st.id+")' class=\"btn btn-primary\" />";
                        tr=tr+"    <input type=\"button\" value='驳回' onclick='bb("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\"/>"
                        tr=tr+"    <input type=\"button\" value='详情' onclick='cc("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalc\"/></td>"

                        tr=tr+"   </tr>";
                        $("#tbody").append(tr);
                    }
                    $("#nowPage").html(data.pageNum);
                    $("#total").html(data.total);
                    //最后一页的下一页显示隐藏
                    if(data.isLastPage){
                        $("#next").hide();
                    }else{
                        $("#next").show();
                    }
                    //第一页的上一页显示隐藏

                    if(data.isFirstPage){
                        $("#pre").hide();
                    }else{
                        $("#pre").show();
                    }
                }
            }
        });

    };
    $().ready(function() {
        searchInfo(1);
        $("#selectBtn").click(function () {
            searchInfo(1);
        });
    });
    function fy(op) {
        var nowPage = $("#nowPage").html();
        if (op == 'next') nowPage = Number(nowPage) + 1;
        else nowPage = Number(nowPage) - 1;
        searchInfo(nowPage);
    };
    function aa(id) {
        $.ajax({
            url:"${path}/updateS1",
            data:{"id":id,
                "state":2,
                "spr":"李四",
            },
            dataType:"json",
            type:"post",
            success:function(data){
                if(data>0){
                    window.location.reload();

                }
            }
        });
    }
    function bb(id) {
        $("#bh").click(function () {
            $.ajax({
                url:"${path}/updateS2",
                data:{"id":id,
                    "state":4,
                    "spr":"李四",
                    "bz":$("#bz1").val(),
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data>0){
                        window.location.reload();

                    }
                }
            });
        })

    }
    function cc(id) {
        $.ajax({
            url:"${path}/selectSid",
            data:{"id":id,
            },
            dataType:"json",
            type:"post",
            success:function(data) {

                console.log(data.sqname + data.sqid + data.sqzt + data.sqje + data.sqly)
                $("#s11").val(data.sqname);
                $("#s21").val(data.sqid);
                $("#s31").val(data.sqzt);
                $("#s41").val(data.sqje);
                $("#s51").val(data.sqly);
                $("#aa1").val(data.sqpz);
                $("#a21").val(data.id);
                var img1="${path}/jds/imgs/"+$("#aa1").val();
                $("#a11").attr('src',img1);

                console.log(img1)

            }
        });
    };
</script>

</html>

