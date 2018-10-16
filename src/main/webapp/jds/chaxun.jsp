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

    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script></head>
<script type="text/javascript">
    $().ready(function(){
        $.ajax({
            url:"${path}/selectM",
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data);
                $("#tbody").html('');
                if(data!=null){
                    for(var i=0;i<data.length;i++){
                        var st=data[i];
                        var tr="<tr>";
                        tr=tr+"   <td>"+st.id+"</td>";
                        tr=tr+"    <td>"+st.ygid+"</td>";
                        tr=tr+"    <td>"+st.jbgz+"</td>";
                        tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+food.id+")'/></td>";
                        tr=tr+"   </tr>";
                        $("#tbody").append(tr);
                    }
                }
            }
        });
    });

    function aa(id){
        $("#editFood").show();
        $.ajax({
            url:"${path}/selectT",
            data:{},
            dataType:"json",
            type:"post",
            ansy:false,
            success:function(data){

                $("#typeid").html("");
                for(var i=0;i<data.length;i++){
                    var op="<option value='"+data[i].id+"'>"+data[i].tname+"</option>";
                    $("#typeid").append(op);
                }
            }
        });
        $.ajax({
            url:"${path}/selectFByid",
            data:{"id":id},
            dataType:"json",
            type:"post",
            ansy:false,
            success:function(data){
                console.log(data);
                $("#foodName").val(data.name);
                $("#foodPrice").val(data.price);
                $("#foodId").val(data.id);
            }
        });
    }
    $().ready(function(){

        $("#update").click(function(){
            $.ajax({
                url:"${path}/update",
                data:{"name":$("#foodName").val(),
                    "typeid":$("#typeid").val(),
                    "price":$("#foodPrice").val(),
                    "id":$("#foodId").val()},
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data.state){
                        $("#editFood").hide();
                        window.location.reload();

                    }
                }
            });
        });



    })


</script>
<body>
<table>

    <tr>
        <td>序号</td>
        <td>菜名</td>
        <td>类别</td>
    </tr>
</table>
<table id="tbody">

</table>
<div style="display:none" id="editFood">
    商品名称<input type="text" id="foodName"/><br/>
    商品价格<input type="text" id="foodPrice"/><br/>
    <input type="text" id="foodId"/>
    商品类别:<select id="typeid">
</select>
    <input type="button" id="update" value="修改"/>
</div>
</body>
</html>
