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

    <title>My JSP 'update.jsp' starting page</title>

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
    //下拉框

    $().ready(function(){
        //修改前查询
        var reg_id=${param.reg_id}
            $.ajax({
                url:"${path}/tselect01",
                type:"post",
                dataType:"json",
                data:{"reg_id":reg_id},
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        var p = data[i];
                        $("#reg_bem").val(p.reg_bem);
                        $("#reg_type").val(p.reg_type);
                        $("#reg_path").val(p.reg_path);
                        $("#reg_name").val(p.reg_name);
                        $("#reg_baes").val(p.reg_baes);
                        $("#reg_end").val(p.reg_end);
                        $("#reg_zijin").val(p.reg_zijin);
                        $("#reg_jiaojie").val(p.reg_jiaojie);
                        $("#reg_qk").val(p.reg_qk);
                    }
                }
            })
        //修改
        $("#updateBtn").click(function(){
            var reg_id=${param.rep_id}
                $.ajax({
                    url:"${path}/tupdate",
                    type:"post",
                    dataType:"json",
                    data:{
                        "reg_bem":$("#reg_bem").val(),
                        "reg_type":$("#reg_type").val(),
                        "reg_path":$("#reg_path").val(),
                        "reg_name":$("#reg_name").val(),
                        "reg_baes":$("#reg_baes").val(),
                        "reg_end":$("#reg_end").val(),
                        "reg_zijin":$("#reg_zijin").val(),
                        "reg_jiaojie":$("#reg_jiaojie").val(),
                        "reg_qk":$("#reg_qk").val(),
                        "reg_id":reg_id
                    },
                    success:function(data){
                        window.location.href="/lx/tregselect.jsp";
                    }
                })
        })
    })

</script>
<body>
<table>
    <tr>
        <td>出差员工编码:<input type="text" id="reg_bem"></td>
    </tr>
    <tr>
        <td>出差类别名称:<input type="text" id="reg_type"></td>
    </tr>
    <tr>
        <td>出差部门:<input type="text" id="reg_path"></td>
    </tr>
    <tr>
        <td>出差员工姓名:<input id="reg_name"></td>
    </tr>
    <tr>
        <td>出差开始时间:<input id="reg_baes"></td>
    </tr>
    <tr>
        <td>出差结束时间:<input id="reg_end"></td>
    </tr>
    <tr>
        <td>出差资金:<input id="reg_zijin"></td>
    </tr>
    <tr>
        <td>出差工作交接:<input id="reg_jiaojie"></td>
    </tr>
    <tr>
        <td>出差交接情况:<input id="reg_qk"></td>
    </tr>
    <tr>
        <td><button id="updateBtn">确认修改</button></td>
    </tr>
</table>
</body>
</html>
