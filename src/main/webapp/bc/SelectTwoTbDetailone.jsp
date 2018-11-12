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
    <title>领导评分界面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <script src="${path}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path }/js/jquery-1.10.2.js"></script></head>
<script type="text/javascript">
    var TbStaffId = '${param.TbStaffId}';
    var TbTaskId = '${param.TbTaskId}';
    $.ajax({
        url:"${path}/SelectTbTetailone",
        data:{"TbStaffId":TbStaffId,
            "TbTaskId":TbTaskId},
        dataType:"json",
        type:"post",
        success:function(data){
            $("#tbody").html("");
            if(data!=null){
                console.log(data);
                for(var i=0;i<data.length;i++){
                    var da = data[i];
                    var sumoneself=da.tb_recorddetails_srsmark;
                    var sumothers=da.tb_recorddetails_hsmark;
                    var TbRecorddetailsId = da.tb_recorddetails_id;
                    var TbRecorddetailsState = da.tb_recorddetails_state;
                    if(sumoneself!==undefined){
                        sumoneself=da.tb_recorddetails_srsmark;
                    }else {
                        sumoneself="";
                    }
                    if(sumothers!==undefined){
                        sumothers=da.tb_recorddetails_hsmark;
                    }else{
                        sumothers="";
                    }
                    var tr ="<tr class='dtr'>";
                    tr=tr+"<td >"+da.tb_event_name+"</td>";
                    tr=tr+"<td >"+da.tb_event_value+"</td>";
                    tr=tr+"<td >"+da.tb_detailone_mark+"</td>";
                    tr=tr+"<td><input style='border: 0px' type='text' disabled  class='sumoneself' value='"+sumoneself+"'></td>"
                    if(TbRecorddetailsState==1){
                        tr=tr+"<td><input style='border: 0px' type='text'  class='sumothers' value='"+sumothers+"'></td>";
                    }
                    if(TbRecorddetailsState==2){
                        tr=tr+"<td><input style='border: 0px' type='text'  class='sumothers' value='"+sumothers+"'></td>";
                    }
                    if(TbRecorddetailsState==3){
                        tr=tr+"<td><input style='border: 0px' type='text' disabled  class='sumothers' value='"+sumothers+"'></td>";
                        $("#reject").attr({"disabled":"disabled"});
                        $("#leadership").attr({"disabled":"disabled"});
                    }
                    if(TbRecorddetailsState==4){
                        tr=tr+"<td><input style='border: 0px' type='text' disabled  class='sumothers' value='"+sumothers+"'></td>";
                        $("#reject").attr({"disabled":"disabled"});
                        $("#leadership").attr({"disabled":"disabled"});
                    }
                    if(TbRecorddetailsState==5){
                        tr=tr+"<td><input style='border: 0px' type='text' disabled  class='sumothers' value='"+sumothers+"'></td>";
                        $("#reject").attr({"disabled":"disabled"});
                        $("#leadership").attr({"disabled":"disabled"});
                    }
                    tr=tr+"<td style='display:none'><input type='text' class='TbDetailoneId' value='"+da.tb_detailone_id+"' ></td>";
                    tr=tr+"<td style='display:none'><input type='text' class='TbStaffId' value='"+TbStaffId+"' ></td>";
                    tr=tr+"<td style='display:none'><input type='text' class='TbTaskId' value='"+da.tb_task_id+"' ></td>";
                    tr=tr+"<td style='display:none'><input type='text' class='TbPropleId' value='"+da.tb_prople_ygkh_id+"' ></td>";
                    tr=tr+"<td style='display:none'><input type='text' class='Achresult' value='"+da.tb_achresult_id+"' ></td>";
                    tr=tr+"<td style='display:none'><input type='text' class='TbRecorddetailsId' value='"+TbRecorddetailsId+"' ></td>";
                    tr=tr+"</tr>";
                    $("#tbody").append(tr);
                }

            }
        }
    });

    function sum(){
        $('.sumoneself').each(function(){
            var sumoneself=0;
            for(var i=0;i<$(".sumoneself").length;i++){
                if($(".sumoneself").eq(i).val()!=null){
                    sumoneself=sumoneself+$(".sumoneself").eq(i).val()*1;
                }
            }
            $('#sumoneself').val(sumoneself);
        });
        $('.sumothers').each(function(){
            var sumothers=0;
            for(var i=0;i<$(".sumothers").length;i++){
                if($(".sumothers").eq(i).val()!=null){
                    sumothers=sumothers+$(".sumothers").eq(i).val()*1;
                }
            }
            if(sumothers!=0){
                $('#sumothers').val(sumothers);
            }else {
                $('#sumothers').val("");
            }
        });
    };
    function reject(){
        var jsonArray = new Array();//声明json数组
        if($("#tbody").find(".dtr").length>0) {
            $("#tbody").find(".dtr").each(function () {
                var sumoneself = $(this).find(".sumoneself").val();
                var sumothers = $(this).find(".sumothers").val();
                var TbDetailoneId = $(this).find(".TbDetailoneId").val();
                var TbStaffId = $(this).find(".TbStaffId").val();
                var TbRecorddetailsId = $(this).find(".TbRecorddetailsId").val();
                var AchresultId = $(this).find(".Achresult").val();
                var TbTaskId = TbTaskId;
                var json = {
                    "sumoneself": sumoneself, "sumothers": sumothers, "TbDetailoneId": TbDetailoneId,
                    "TbStaffId":TbStaffId,"TbRecorddetailsId":TbRecorddetailsId,"TbTaskId":TbTaskId,
                    "AchresultId":AchresultId,"state":5
                };
                jsonArray.push(json);//追加json数组
            });
        };
        var jsonStr = JSON.stringify(jsonArray);//转json字符串
        $.ajax({
            url:"${path}/InsertTbAchresult",
            data:{
                "TbPropleId":$("#tbody").find(".TbPropleId").val(),
                "TbTaskId":$("#tbody").find(".TbTaskId").val(),
                "sumoneself":$("#sumoneself").val(),
                "sumothers":$("#sumothers").val(),
                "Achresult":$("#tbody").find(".Achresult").val(),
                "resultstate":5
            },
            dataType:"json",
            type:"post",
            async:false,
            success:function(data){

            }
        });
        $.ajax({
            url:"${path}/InsertTbOneRecorddetails",
            type:"post",
            async:false,
            traditional:true,//这使json格式的字符不会被转码
            contentType:"application/json;charset=UTF-8", // 指定这个协议很重要
            data:jsonStr,
            dataType:"json",
            success:function(data){
                if(data.state){
                    alert(data.state);
                    window.location.href="${path}/bc/SelectOtherTask.jsp"
                }
            }
        });
    }

    function leadership(){
        var jsonArray = new Array();//声明json数组
        if($("#tbody").find(".dtr").length>0) {
            $("#tbody").find(".dtr").each(function () {
                var sumoneself = $(this).find(".sumoneself").val();
                var sumothers = $(this).find(".sumothers").val();
                var TbDetailoneId = $(this).find(".TbDetailoneId").val();
                var TbStaffId = $(this).find(".TbStaffId").val();
                var TbRecorddetailsId = $(this).find(".TbRecorddetailsId").val();
                var AchresultId = $(this).find(".Achresult").val();
                var TbTaskId = TbTaskId;
                var json = {
                    "sumoneself": sumoneself, "sumothers": sumothers, "TbDetailoneId": TbDetailoneId,
                    "TbStaffId":TbStaffId,"TbRecorddetailsId":TbRecorddetailsId,"TbTaskId":TbTaskId,
                    "AchresultId":AchresultId,"state":1
                };
                jsonArray.push(json);//追加json数组
            });
        };
            var jsonStr = JSON.stringify(jsonArray);//转json字符串
        $.ajax({
            url:"${path}/InsertTbAchresult",
            data:{
                "TbPropleId":$("#tbody").find(".TbPropleId").val(),
                "TbTaskId":$("#tbody").find(".TbTaskId").val(),
                "sumoneself":$("#sumoneself").val(),
                "sumothers":$("#sumothers").val(),
                "Achresult":$("#tbody").find(".Achresult").val(),
                "resultstate":0
            },
            dataType:"json",
            type:"post",
            async:false,
            success:function(data){

            }
        });
        $.ajax({
            url:"${path}/InsertTbOneRecorddetails",
            type:"post",
            async:false,
            traditional:true,//这使json格式的字符不会被转码
            contentType:"application/json;charset=UTF-8", // 指定这个协议很重要
            data:jsonStr,
            dataType:"json",
            success:function(data){
                if(data.state){
                    alert(data.state);
                    window.location.href="${path}/bc/SelectOtherTask.jsp"
                }
            }
        });
    }
</script>
<body>
     <div style="display: block;width: 90%;" align="center"><span>绩效考核单</span></div>
    <div style="display: block;width: 90%;  margin-left: 80px">
     <div width="100%" border="1px">
     <div>
        <div>
            <span>被考核人</span>
            <span>name</span>
        </div>
        <div>
            <span>所属部门</span>
            <span>deptname</span>
        </div>
    </div>
        <div>
            <div>
                <span>岗位或职务</span>
                <span>name</span>
            </div>
            <div>
                <span>考核类型</span>
                <span></span>
            </div>
        </div>
     </div>
    </div>
    <div style="display: block;width: 90%;  margin-left: 80px" >
      <table width="100%" border="1px" >
         <tr>
             <td >考核项目</td>
             <td width="810px">具体内容</td>
             <td>考核项分值</td>
             <td>自评分</td>
             <td>主管评分</td>
         </tr>
         <tbody id="tbody"></tbody>
      </table>
    </div>
    <div style="display: block;width: 90%;  margin-left: 80px">
        <div width="100%">
            <div width="80%" align="right"><button class="btn btn-default" onclick="sum()">合计</button></div>
            <div style="margin-left: 1200px">自评分值：<input type='text' style="height: 32px" id='sumoneself'></div>
            <div style="margin-left: 1200px">主管评分：<input type='text' style="height: 32px" id='sumothers'></div>
        </div>
    </div>
    <div style="display: block;width: 90%;  margin-left: 80px">
         <table width="100%" >
             <td width="100%" align="right"><button class="btn btn-default" id="reject" onclick="reject()">退回</button></td>
             <td width="100%" align="right"><button class="btn btn-default" id="leadership" onclick="leadership()">提交评分</button></td>
         </table>
    </div>
</body>
</html>
