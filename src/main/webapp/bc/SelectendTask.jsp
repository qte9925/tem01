<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../gy.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>人事绩效审核界面</title>

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
                    url:"${path}/SelectOtherTask",
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
                                var tr="<tr>";
                                    tr=tr+"<td >"+number+"</td>";
                                    tr=tr+"<td >"+da.tb_task_name+"</td>";
                                    tr=tr+"<td >"+da.tb_staff_name+"</td>";
                                    tr=tr+"<td >"+da.tb_prople_ygkh_name+"....</td>";
                                    tr=tr+"<td ><button class=' buttontask' data-toggle='modal' data-target='#myModal' value='"+da.tb_task_id+"'>查看</button></td>";
                                    tr=tr+"</tr>";
                                $("#tbody").append(tr);
                            }
                        }
                    }
                });
                $("#tbody").on("click",".buttontask",function(){
                    var tbtaskid =$(this).val();
                    $.ajax({
                        url:"${path}/SelectOtherStaff",
                        data:{"tbtaskid":tbtaskid},
                        dataType:"json",
                        type:"post",
                        success:function(data){
                            console.log(data);
                            $("#tbody1").html("");
                            var number=0;
                            if(data!=null){
                                for(var i=0;i<data.length;i++){
                                    number = number+1;
                                    var da = data[i];
                                    var state = da.tb_achresult_state;
                                    var step = da.tb_step_id;
                                    var TbStaffId = da.tb_staff_id;
                                    var TbTaskId  =da.tb_task_id;
                                    var tr="<tr>";
                                    tr=tr+"<td >"+da.tb_prople_ygkh_name+"</td>";
                                    if(step==1 && state==1){
                                        tr=tr+"<td>未自评</td>";
                                        tr=tr+"<td>未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";

                                    }
                                    if(step==1 && state==2){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==1 && state==3){
                                        tr=tr+"<td >未自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==1 && state==4){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid'value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==1 && state==5){
                                        tr=tr+"<td >退回中</td>";
                                        tr=tr+"<td >未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==1 && state==6){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid'value='"+TbStaffId+"'>已审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==2 && state==1){
                                        tr=tr+"<td >未自评</td>";
                                        tr=tr+"<td >未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid'disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==2 && state==3){
                                        tr=tr+"<td >未自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid'disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==2 && state==4){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==2 && state==6){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid'value='"+TbStaffId+"'>已审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==3 && state==1){
                                        tr=tr+"<td >未自评</td>";
                                        tr=tr+"<td >未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==3 && state==2){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==3 && state==3){
                                        tr=tr+"<td >未自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==3 && state==4){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid'value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==3 && state==5){
                                        tr=tr+"<td >退回中</td>";
                                        tr=tr+"<td >未评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>未审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    if(step==3 && state==6){
                                        tr=tr+"<td >已自评</td>";
                                        tr=tr+"<td >已评价</td>";
                                        tr=tr+"<td><button class='tbstaffid' disabled value='"+TbStaffId+"'>已审核</button>"+
                                            "<input style='display: none' class='tbtaskid' type='text' value='"+TbTaskId+"'></td>";
                                    }
                                    tr=tr+"</tr>";
                                    $("#tbody1").append(tr);
                                }
                            }
                        }
                    })
                });
                $("#tbody1").on("click",".tbstaffid",function(){
                    var TbStaffId = $(this).val();
                    var TbTaskId = $(this).parent().find(".tbtaskid").val();
                    window.location.href="${path}/bc/SelectThreeTbDetailone.jsp?TbStaffId="+TbStaffId+"&TbTaskId="+TbTaskId
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
        <td>被考核人</td>
        <td></td>
    </tr>
    <tbody id="tbody"></tbody>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" style="text-align: center;">
                    <tr style="text-align: center">
                        <td>员工姓名</td>
                        <td>自评状态</td>
                        <td>领导评状态</td>
                        <td>操作</td>
                    </tr>
                    <tbody id="tbody1"></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>