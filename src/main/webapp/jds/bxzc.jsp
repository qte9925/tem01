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
                <td>支出</td>
                <td>操作</td>
            </tr>
            <tbody id="tbody"></tbody>
        </table>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页
    </center>
</div>

</body>
<script type="text/javascript">
    function searchInfo(nowPage){
        $.ajax({
            url:"${path}/selectZc",
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
                        if(st.sate=2){
                            tr=tr+"    <td>审核已通过</td>";
                        }
                        tr=tr+"    <td><input type=\"button\" value='支出' onclick='aa("+st.id+")' class=\"btn btn-primary\" /></td>";

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
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }

    var myDate = new Date();
    //获取当前年
    var year=myDate.getFullYear();
    //获取当前月
    var month=myDate.getMonth()+1;
    //获取当前日
    var date=myDate.getDate();
    var h=myDate.getHours();       //获取当前小时数(0-23)
    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    var s=myDate.getSeconds();     //获取当前秒钟数(0-59)

    var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
    function aa(id) {
        $.ajax({
            url:"${path}/updateZc",
            data:{"id":id,
                "state":3,
                "zcry":"${sessionScope.list[0].yhname}",
                "zcrq":now
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

</script>

</html>

