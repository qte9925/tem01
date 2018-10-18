<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'ShowGoods.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript" src="${path }/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        var nextPage = 0;
        var prePage = 0;
        function show(json){
            $.ajax({
                url:'${path}/selectM',
                data:json,
                dataType:'json',
                type:'post',
                success:function(data){
                    $("#tbody").html("");
                    var trinfo = '';
                    for(var i = 0;i<data.list.length;i++){
                        var good = data.list[i];
                        trinfo = trinfo +'<tr>';
                        trinfo = trinfo +'<td>'+(i+1)+'</td>';
                        trinfo = trinfo +'<td>'+good.ygid+'</td>';
                        trinfo = trinfo +'<td>'+good.jbgz+'</td>';
                        trinfo = trinfo +'</tr>';
                    }
                    $("#tbody").append(trinfo);
                    $("#pageNow").html(data.pageNum);
                    $("#allPage").html(data.pages);
                    nextPage = data.nextPage;
                    prePage = data.prePage;
                    /*if(data.isLastPage){
                        $("#downPage").attr("disabled","disabled");
                    }else{
                        $("#downPage").removeAttr("disabled");
                    }
                    if(data.isFirstPage){
                        $("#upPage").attr("disabled","disabled");;
                    }else{
                        $("#upPage").removeAttr("disabled");
                    }*/
                }
            });
        }
        $(function(){
            show({"pageNow":1});
        });
    </script>
    <style type="text/css">
        table tr td{
            border:1px solid black;
            text-align: center;
        }
    </style>
</head>

<body>
<center>
    商品名称<input type="text" id="gname">商品类型<input type="text" id="tname"><input type="button" value="检索" id="checkBtn">
    <table cellspacing="0">
        <tr>
            <td>序号</td>
            <td>商品名称</td>
            <td>图片案例</td>
            <td>商品单价</td>
            <td>商品数量</td>
            <td>商品产地</td>
            <td>商品类型</td>
            <td>商品生产日期</td>
        </tr>
        <tbody id="tbody"></tbody>
    </table>
    <div id="Page">
        <button id="upPage">上一页</button>&nbsp;
        第<span id="pageNow"></span>页  /  共<span id="allPage"></span>页&nbsp;
        <button id="downPage">下一页</button>&nbsp;&nbsp;
    </div>
</center>
<script type="text/javascript">
    $("#checkBtn").click(function(){
        show({"goodsName":$("#gname").val(),"typeName":$("#tname").val(),"pageNow":1});
    });
    $("#upPage").click(function(){
        show({"goodsName":$("#gname").val(),"typeName":$("#tname").val(),"pageNow":prePage});
    });
    $("#downPage").click(function(){
        show({"goodsName":$("#gname").val(),"typeName":$("#tname").val(),"pageNow":nextPage});
    });
</script>
</body>
</html>
