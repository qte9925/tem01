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
            <td>姓名</td>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>养老保险</td>
            <td>失业保险</td>
            <td>医疗保险</td>
            <td>工伤保险</td>
            <td>生育保险</td>
            <td>住房公积金</td>
            <td>迟到</td>
            <td>病假</td>
            <td>事假</td>
            <td>早退</td>
            <td>旷工</td>
            <td>补发</td>
            <td>缴税</td>
            <td>实际工资</td>
        </tr>
        <tbody id="tbody" ></tbody>
    </table>
</div>
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加员工奖金
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                           <tr>
                               <td>
                                   奖金：<input type="text" id="jj">
                               </td>
                           </tr>
                            <tr>
                                <td>
                                    <input type="text" id="id"  style="display:none">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" id="sjgz"  style="display:none">
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="insert">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>--%>
<center>
    <input type="button" value="退出" class="btn btn-primary" id="eidBtn">
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
                        tr=tr+"   <td>"+st.xm+"</td>";
                        tr=tr+"    <td>"+st.xz+"</td>";
                        tr=tr+"    <td>"+st.jx+"</td>";
                        tr=tr+"    <td>"+st.yanglaobx+"</td>";
                        tr=tr+"    <td>"+st.shiyebx+"</td>";
                        tr=tr+"    <td>"+st.yiliaobx+"</td>";
                        tr=tr+"    <td>"+st.gsbx+"</td>";
                        tr=tr+"    <td>"+st.sybx+"</td>";
                        tr=tr+"    <td>"+st.zfgjj+"</td>";
                        tr=tr+"    <td>"+st.cd+"</td>";
                        tr=tr+"    <td>"+st.bingjia+"</td>";
                        tr=tr+"    <td>"+st.shijia+"</td>";
                        tr=tr+"    <td>"+st.zt+"</td>";
                        tr=tr+"    <td>"+st.kg+"</td>";
                        tr=tr+"    <td>"+st.bf+"</td>";
                        tr=tr+"    <td>"+st.js+"</td>";
                        tr=tr+"    <td>"+st.sjgz+"</td>";
                      /*  tr=tr+"    <td><input type=\"button\" value='奖金' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\"/></td>"*/
                        $("#tbody").append(tr);
                    }
                }
            }
        });
    })
$("#eidBtn").click(function () {
    window.location.href="${path}/jds/Xzlc.jsp";
})
/*function aa(id) {
    $("#id").val(id);
    $.ajax({
        url:"${path}/selectGzId",
        data:{"id":id,},
        dataType:"json",
        type:"post",
        success:function(data){
            $("#sjgz").val(data.sjgz);

        }
    })

}
    $("#insert").click(function () {
        var jj=$("#jj").val();
        var sjgz=$("#sjgz").val();
        var sjgz1=Number(jj)+Number(sjgz);
        $.ajax({
            url:"${path}/updateGzc",
            data:{"id": $("#id").val(),
                "jj":jj,
                "sjgz": sjgz1
            },
            dataType:"json",
            type:"post",
            success:function(data) {
                console.log(data)
                if(data>0) {
                    window.location.reload();

                }
            }
        })
    })*/
    $("#eidBtn").click(function () {
        window.location.href="${path}/jds/Toexamine.jsp";
    })
</script>

</html>

