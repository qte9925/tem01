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
<div style="text-align:center;">
    <table class="table table-bordered">
        <tr id="jz">
            <td>序号</td>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>养老保险</td>
            <td>失业保险</td>
            <td>医疗保险</td>
            <td>工伤保险</td>
            <td>生育保险</td>
            <td>住房公积金</td>
            <td>迟到</td>
            <td>请假</td>
            <td>早退</td>
            <td>旷工</td>
            <td>补发</td>
            <td>缴税</td>
            <td>实际工资</td>
            <td>操作</td>
        </tr>
        <tbody id="tbody" ></tbody>
    </table>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改员工工资
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>基本工资:<input type="text" id="jbgz"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>绩效工资:<input type="text" id="jxgz"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>养老保险:<input type="text" id="yanglao"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>失业保险:<input type="text" id="shiye"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>医疗保险:<input type="text" id="yiliao"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>工伤保险:<input type="text" id="gongshang"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>生育保险:<input type="text" id="shengyu"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>公&nbsp;&nbsp;积&nbsp;&nbsp;金:<input type="text" id="gongjijin"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>迟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到:<input type="text" id="chidao"></td>
                            </tr>
                            <tr>
                                <td>请&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假:<input type="text" id="qingjia"></td>
                            </tr>
                            <tr>
                                <td>早&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退:<input type="text" id="zaotui"></td>
                            </tr>
                            <tr>
                                <td>旷&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工:<input type="text" id="kuanggong"></td>
                            </tr>
                            <tr>
                                <td>补&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发:<input type="text" id="bufa"></td>
                            </tr>
                            <tr>
                                <td>缴&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;税:<input type="text" id="jiaoshui"></td>
                            </tr>
                            <tr>
                                <td>实际工资:<input type="text" id="shijigongzi"></td>
                            </tr>
                            <tr>
                                <td>实际工资:<input type="text" id="id"></td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="update">
                    修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<center>
    <input type="button" value="保存" class="btn btn-primary" id="eidBtn">
</center>
</body>

<script !src="text/javascript">

       $().ready(function () {
           ${param.id}
           $.ajax({
               url:"${path}/selectGza",
               data:{"id":${param.id}},
               dataType:"json",
               type:"post",
               success:function(data){
                   console.log(data)
                   $("#tbody").html('');
                   if(data!=null){
                       for(var i=0;i<data.length;i++){
                           var st=data[i];
                           var tr="<tr>";
                           tr=tr+"   <td>"+(i+1)+"</td>";
                           tr=tr+"    <td>"+st.xz+"</td>";
                           tr=tr+"    <td>"+st.jxjin+"</td>";
                           tr=tr+"    <td>"+st.yanglaobx+"</td>";
                           tr=tr+"    <td>"+st.shiyebx+"</td>";
                           tr=tr+"    <td>"+st.yiliaobx+"</td>";
                           tr=tr+"    <td>"+st.gsbx+"</td>";
                           tr=tr+"    <td>"+st.sybx+"</td>";
                           tr=tr+"    <td>"+st.zfgjj+"</td>";
                           tr=tr+"    <td>"+st.cd+"</td>";
                           tr=tr+"    <td>"+st.qj+"</td>";
                           tr=tr+"    <td>"+st.zt+"</td>";
                           tr=tr+"    <td>"+st.kg+"</td>";
                           tr=tr+"    <td>"+st.bf+"</td>";
                           var aa=st.sjgz-5000;
                           var cc=st.bf;
                           var bb;

                           if(aa<0){
                               bb=0;
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else if(3000>=aa){
                               bb=(aa*0.03-0);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else if(12000>=aa){
                               bb=(aa*0.1-210);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else if(25000>=aa){
                               bb=(aa*0.2-1410);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else if(35000>=aa){
                               bb=(aa*0.25-2660);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else if(55000>=aa){
                               bb=(aa*0.3-4410);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else if(80000>=aa){
                               bb=(aa*0.35-7160);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }else{
                               bb=(aa*0.4-15160);
                               tr=tr+"    <td>"+bb+"</td>";
                               tr=tr+"    <td>"+(st.sjgz-bb+cc)+"</td>";
                           }
                           tr=tr+"    <td><input type=\"button\" value='修改' onclick='cc("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\"/></td>";
                           $("#tbody").append(tr);
                       }
                   }
               }
           });
       })
function cc(id){
    $.ajax({
        url:"${path}/selectGzId",
        data:{"id":id,},
        dataType:"json",
        type:"post",
        success:function(data){
            $("#id").val(data.id);
            $("#jbgz").val(data.xz);
            $("#jxgz").val(data.jxjin);
            $("#yanglao").val(data.yanglaobx);
            $("#shiye").val(data.shiyebx);
            $("#yiliao").val(data.yiliaobx);
            $("#shengyu").val(data.sybx);
            $("#gongshang").val(data.gsbx);
            $("#chidao").val(data.cd);
            $("#qingjia").val(data.qj);
            $("#zaotui").val(data.zt);
            $("#gongjijin").val(data.zfgjj);
            $("#kuanggong").val(data.kg);
            $("#bufa").val(data.bf);
            var aa1=data.sjgz-5000;
            var cc1=data.bf;
            var bb1;

            if(aa1<0){
                bb1=0;
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else if(3000>=aa1){
                bb1=(aa1*0.03-0);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else if(12000>=aa1){
                bb1=(aa1*0.1-210);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else if(25000>=aa1){
                bb1=(aa1*0.2-1410);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else if(35000>=aa1){
                bb1=(aa1*0.25-2660);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else if(55000>=aa1){
                bb1=(aa1*0.3-4410);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else if(80000>=aa1){
                bb1=(aa1*0.35-7160);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }else{
                bb1=(aa1*0.4-15160);
                $("#jiaoshui").val(bb1);
                $("#shijigongzi").val(data.sjgz-bb1+cc1);
            }
        }
    })
}
$("#update").click(function () {
    $.ajax({
        url:"${path}/updateGz",
        data:{"id": $("#id").val(),
            "cd": $("#chidao").val(),
            "qj": $("#qingjia").val(),
            "zt": $("#zaotui").val(),
            "kg": $("#kuanggong").val(),
            "bf": $("#bufa").val(),
            "sjgz": $("#shijigongzi").val(),
        },
        dataType:"json",
        type:"post",
        success:function(data) {
            if(data>0){
                window.location.reload();

            }
        }
    })
})
</script>

</html>

