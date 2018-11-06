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

    <title>增加考核</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <link href="${path}/css/bootstrap-select.min.css" rel="stylesheet">
    <script type="text/javascript" src="${path }/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${path }/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path }/js/bootstrap-select.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(
        function(){
            $.ajax({
                url:"${path}/SelectTbTask",
                data:{},
                dataType:"json",
                type:"post",
                ansy:false,
                success:function(data){
                    $("#level1").append("<option>------请选择-----</option>");
                    for(var i=0;i<data.length;i++){
                        var obj=data[i];
                        $("#level1").append("<option value='"+obj.tb_dept_id+"'>"+obj.tb_dept_name+"</option>");
                    }
                }
            });

            $("#level1").change(function(){
                $.ajax({
                    url:"${path}/SelectTbPost",
                    data:{tbDeptId:$("#level1").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        $("#level2").html("");
                        $("#level3").html("");
                        $("#level2").append("<option>------请选择-----</option>");
                        $("#level3").append("<option>------请选择-----</option>");
                        for(var i=0;i<data.length;i++){
                            var obj=data[i];
                            $("#level2").append("<option value='"+obj.tb_post_id+"'>"+obj.tb_post_name+"</option>");
                        }
                    }
                })
            });

            $("#level2").change(function(){
                $.ajax({
                    url:"${path}/SelectTbStaff",
                    data:{tbPostId:$("#level2").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        $("#level3").html("");
                        $("#level3").append("<option>------请选择-----</option>");
                        for(var i=0;i<data.length;i++){
                            var obj=data[i];
                            $("#level3").append("<option value='"+obj.tb_staff_id+"'>"+obj.tb_staff_name+"</option>");
                        }
                    }
                })
            });
        }
    );
    $(".selectpicker").selectpicker({
        noneSelectedText : '请选择'
    });
    $(window).on('load', function() {
        $('.selectpicker').selectpicker('val', '');
        $('.selectpicker').selectpicker('refresh');
    });

    //下拉数据加载
    $.ajax({
        type : 'post',
        url : "${path}/SelectTbTaskone",
        dataType : 'json',
        success : function(datas) {//返回list数据并循环获取
            var select = $("#slpk");
            for (var i = 0; i < datas.length; i++) {
                select.append("<option value='"+datas[i].tb_dept_id+"'>"
                    + datas[i].tb_dept_name + "</option>");
            }
            $('.selectpicker').selectpicker('val', '');
            $('.selectpicker').selectpicker('refresh');
        }
    });
    function showvalue(){
        var arrayselectdept = $("#slpk").val();
        $("#deptinput").val(arrayselectdept);
    }
    function cs(){

        alert(str);
    }
    function insert(){
        $.ajax({
            url:"${path}/InsertTbTask",
            data:{"tbTaskName":$("#tbTaskName").val(),
                "tbTaskText":$("#tbTaskText").val(),
                "tbStaffId":$("#level3").val(),
                "tbTaskStarttime":$("#tbTaskStarttime").val(),
                "tbTaskEndtime":$("#tbTaskEndtime").val(),
                "tdTaskState":1,
                "deptString":$("#deptinput").val(),
            },
            dataType:"json",
            type:"post",
            success:function(data){
            }
        });
    }

</script>
<body style="padding:50px">
<table>
    <tr>
        <td >考核计划名称</td>
        <td><input type="text" id="tbTaskName"></td>
    </tr>
    <tr>
        <td>考核计划说明</td>
        <td><input type="text" id="tbTaskText"></td>
    </tr>
    <tr>
        <td>考核人</td>
        <td>
            <select name="level1" id="level1"  style="width:150px;">
            </select>
            <select name="level2" id="level2" style="width:150px;">
            </select>
            <select name="level3" id="level3" style="width:150px;">
            </select>
        </td>
    </tr>
    <tr>
        <td>被考核人</td>
        <td>
            <select id="slpk" class="selectpicker" data-live-search="true" multiple onchange="showvalue()"></select>
            <input type="text" id="deptinput">
        </td>
    </tr>
    <tr>
        <td>考核开始时间</td>
        <td><input type="text" id="tbTaskStarttime"></td>
    </tr>
    <tr>
        <td>考核截止时间</td>
        <td><input type="text" id="tbTaskEndtime"></td>
    </tr>
</table>
<div><button class="btn btn-default" onclick="insert()">提交</button></div>
<div><button class="btn btn-default" onclick="cs()">测试</button></div>

</body>
</html>
