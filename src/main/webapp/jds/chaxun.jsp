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
                        tr=tr+"    <td>"+st.jxgz+"</td>";
                        tr=tr+"    <td>"+st.sybx+"</td>";
                        tr=tr+"    <td>"+st.ylbx+"</td>";
                        tr=tr+"    <td>"+st.yalbx+"</td>";
                        tr=tr+"    <td>"+st.rzrq+"</td>";
                        tr=tr+"    <td>"+st.zwid+"</td>";

                        tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+st.id+")'/></td>";
                        tr=tr+"    <td><input type=\"button\" value='删除' onclick='bb("+st.id+")'/></td>";
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
            url:"${path}/selectMByid",
            data:{"id":id},
            dataType:"json",
            type:"post",
            ansy:false,
            success:function(data){
                console.log(data);
                $("#ygida").val(data.ygid);
                $("#jbgza").val(data.jbgz);
                $("#jxgza").val(data.jxgz);
                $("#sybxa").val(data.sybx);
                $("#ylbxa").val(data.ylbx);
                $("#yalbxa").val(data.yalbx);
                $("#rzrqa").val(data.rzrq);
                $("#zwida").val(data.zwid);

            }
        });
    }
    $().ready(function(){

        $("#update").click(function(){
            $.ajax({
                url:"${path}/updateM",
                data:{"ygid":$("#ygida").val(),
                    "jbgz":$("#jbgza").val(),
                    "jxgz":$("#jxgza").val(),
                    "sybx":$("#sybxa").val(),
                    "ylbx":$("#ylbxa").val(),
                    "yalbx":$("#yalbxa").val(),
                    "rzrq":$("#rzrqa").val(),
                    "zwid":$("#zwida").val()
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
    });
    $().ready(function(){

        $("#insert").click(function(){
            $.ajax({
                url:"${path}/insertM",
                data:{"ygid":$("#ygid").val(),
                    "jbgz":$("#jbgz").val(),
                    "jxgz":$("#jxgz").val(),
                    "sybx":$("#sybx").val(),
                    "ylbx":$("#ylbx").val(),
                    "yalbx":$("#yalbx").val(),
                    "rzrq":$("#rzrq").val(),
                    "zwid":$("#zwid").val()
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


</script>
<body>
<div>
    <table>

        <tr>
            <td>员工工号<input type="text" id="ygid"></td>
        </tr>
        <tr>
            <td>基本工资<input type="text" id="jbgz"></td>
        </tr>
        <tr>
            <td>绩效工资<input type="text" id="jxgz"></td>
        </tr>
        <tr>
            <td>失业保险<input type="text" id="sybx"></td>
        </tr>
        <tr>
            <td>医疗保险<input type="text" id="ylbx"></td>
        </tr>
        <tr>
            <td>养老保险<input type="text" id="yalbx"></td>
        </tr>
        <tr>
            <td>日期<input type="text" id="rzrq"></td>
        </tr>
        <tr>
            <td>职务<input type="text" id="zwid"></td>
        </tr>
        <tr>
            <td><input type="button" value="增加" id="insert"></td>

        </tr>
    </table>
</div>
<table>

    <tr>
        <td>序号</td>
        <td>员工工号</td>
        <td>基本工资</td>
        <td>绩效工资</td>
        <td>失业保险</td>
        <td>医疗保险</td>
        <td>养老保险</td>
        <td>日期</td>
        <td>职务</td>

    </tr>
</table>
<table id="tbody">

</table>
<div style="display:none" id="editFood">
    员工工号：<input type="text" id="ygida"/><br/>
    基本工资：<input type="text" id="jbgza"/><br/>
    绩效工资：<input type="text" id="jxgza"/><br/>
    失业保险：<input type="text" id="sybxa"/><br/>
    医疗保险：<input type="text" id="ylbxa"/><br/>
    养老保险：<input type="text" id="yalbxa"/><br/>
    入职日期：<input type="text" id="rzrqa"/><br/>
    职务：<input type="text" id="zwida"/><br/>


    <input type="button" id="update" value="修改"/>
</div>

</body>
</html>
