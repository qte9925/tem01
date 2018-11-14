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

    <title>我的绩效</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <script type="text/javascript" src="${path }/js/jquery-1.10.2.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
     $(document).ready(
            function(){
        var TbStaffId=3;
        $.ajax({
            url:"${path}/SelectMyTask",
            data:{"tbStaffId":TbStaffId},
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data);
                $("#tbody").html("");
                var number=0;
                if(data!=null){
                    for(var i=0;i<data.length;i++){
                        number = number+1;
                        var da = data[i];
                        var tbachresultstate =da.tb_achresult_state;
                        var tbstep = da.tb_step_id;
                        var tr ="<tr>";
                            tr=tr+"<td >"+number+"</td>";
                            tr=tr+"<td >"+da.tb_task_name+"</td>";
                            tr=tr+"<td >"+da.tb_staff_name+"</td>";
                            tr=tr+"<td style='display:none'><input type='text' class='TbTaskId' value='"+da.tb_task_id+"' ></td>";
                        if(tbstep==1 &&  tbachresultstate==1){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>未自评</button></td>";
                        }
                        if(tbstep==1 &&  tbachresultstate==2){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==1 &&  tbachresultstate==4){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==1 &&  tbachresultstate==5){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>已退回</button></td>";
                        }
                        if(tbstep==1 &&  tbachresultstate==6){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==2 &&  tbachresultstate==1){
                            tr=tr+"<td ><button disabled >未自评</button></td>";
                        }
                        if(tbstep==2 &&  tbachresultstate==3){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>未自评</button></td>";
                        }
                        if(tbstep==2 &&  tbachresultstate==4){
                            tr=tr+"<td ><button class='selectrecordone'value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==2 &&  tbachresultstate==5){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>已退回</button></td>";
                        }
                        if(tbstep==2 &&  tbachresultstate==6){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==3 &&  tbachresultstate==1){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>未自评</button></td>";
                        }
                        if(tbstep==3 &&  tbachresultstate==2){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==3 &&  tbachresultstate==3){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>未自评</button></td>";
                        }
                        if(tbstep==3 &&  tbachresultstate==4){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>已自评</button></td>";
                        }
                        if(tbstep==3 &&  tbachresultstate==5){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>已退回</button></td>";
                        }
                        if(tbstep==3 &&  tbachresultstate==6){
                            tr=tr+"<td ><button class='selectrecordone' value='"+TbStaffId+"'>已自评</button></td>";
                        }
                            tr=tr+"</tr>";
                        $("#tbody").append(tr);
                    }
                }
            }
        });
        $("#tbody").on("click",".selectrecordone",
            function(){
            var staffid = $(this).val();
            var taskid = $(this).parent().prev().find(".TbTaskId").val();
            window.location.href="${path}/bc/SelectOneselfTbDetailone.jsp?TbStaffId="+staffid+"&TbTaskId="+taskid
        })
    })
    </script>
</head>
<body>
    <table class="table table-hover">
        <tr>
            <td>序号</td>
            <td>考核名称</td>
            <td>考核人</td>
            <td>考核状态</td>
        </tr>
        <tbody id="tbody"></tbody>
    </table>
</body>
</html>
