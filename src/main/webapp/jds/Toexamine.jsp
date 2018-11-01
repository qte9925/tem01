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
<div>
    <table class="table table-bordered">
        <tr>
            <td>序号</td>
            <td>流程创建时间</td>
            <td>流程创建人</td>
            <td>起始日期</td>
            <td>结束日期</td>
            <td>工资月份</td>
            <td>备注</td>
            <td>操    作</td>

        </tr>

        <tbody id="tbody"></tbody>
    </table>
    <center>
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
</body>
<script type="text/javascript">
    function searchInfo(nowPage){
        $.ajax({
            url:"${path}/selectX1",
            data:{"yf":$("#yf").val(),"nowPage":nowPage},
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
                        tr=tr+"    <td>"+st.lcsj+"</td>";
                        tr=tr+"    <td>"+st.cjname+"</td>";
                        tr=tr+"    <td>"+st.qsrq+"</td>";
                        tr=tr+"    <td>"+st.jzrq+"</td>";
                        tr=tr+"    <td>"+st.gzyf+"</td>";
                        tr=tr+"    <td>"+st.bz+"</td>";
                        tr=tr+"    <td><input type=\"button\" value='通过' onclick='aa("+st.id+")' class=\"btn btn-primary\"  />";
                        tr=tr+"    <input type=\"button\" value='驳回' onclick='bb("+st.id+")' class=\"btn btn-primary\"  data-toggle=\"modal\" data-target=\"#myModala\"/>"
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
            url:"${path}/updateXs",
            data:{"id":id,
                   "state":3,
                   "shr":"李四",
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
                url:"${path}/updateXb",
                data:{"id":id,
                    "state":5,
                    "shr":"李四",
                    "bz1":$("#bz1").val(),
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
</script>

</html>

