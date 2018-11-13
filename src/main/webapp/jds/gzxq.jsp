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
            <td>病假</td>
            <td>事假</td>
            <td>早退</td>
            <td>旷工</td>
            <td>加班</td>
            <td>缴税</td>
           <%-- <td>补发</td>--%>
            <td>实际工资</td>
        </tr>
        <tbody id="tbody" ></tbody>
    </table>
</div>
<center>
<input type="button" value="保存" class="btn btn-primary" id="addBtn">
    <input type="button" value="退出" class="btn btn-primary" id="eidBtn">
</center>
</body>

<script !src="text/javascript">

        function aa() {
            var gzyf=${param.gzyf}
        $.ajax({
            url:"${path}/selectGzx",
            data:{"gzyf":gzyf},
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data)
                $("#tbody").html('');
                if(data!=null){
                    for(var i=0;i<data.length;i++){
                        var st=data[i];
                        var tr="<tr>";
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
                        tr=tr+"    <td>"+st.jiaban+"</td>";
                       /* tr=tr+"    <td>"+st.bf+"</td>";*/
                        /*tr=tr+"    <td>"+st.sjgz+"</td>";*/
                        var aa=st.sjgz-5000;
                        var bb;

                        if(aa<0){
                            bb=0;
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else if(3000>=aa){
                            bb=(aa*0.03-0);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else if(12000>=aa){
                            bb=(aa*0.1-210);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else if(25000>=aa){
                            bb=(aa*0.2-1410);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else if(35000>=aa){
                            bb=(aa*0.25-2660);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else if(55000>=aa){
                            bb=(aa*0.3-4410);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else if(80000>=aa){
                            bb=(aa*0.35-7160);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }else{
                            bb=(aa*0.4-15160);
                            tr=tr+"    <td>"+bb+"</td>";
                            tr=tr+"    <td>"+(st.sjgz-bb)+"</td>";
                        }
                        tr=tr+"   </tr>";
                        $("#tbody").append(tr);
                    }
                }
            }
        });
        }
    $().ready(function () {

            aa();
    })
    $("#addBtn").click(function () {
        var id=${param.id};
        var gzyf=${param.gzyf};
       /* var tb=document.getElementById("tbody");    //获取table对像
        var rows=tb.rows;
        for(var i=0;i<rows.length;i++){    //--循环所有的行
            var cells=rows[i].cells;
            for(var j=1;j<cells.length;j++){   //--循环所有的列
                var a=(cells[j-1].innerHTML);

            }
        }
        alert(a)*/
      $.ajax({
            url:"${path}/insertGz",
            data:{"lcid":id,"gzyf":gzyf},
            dataType:"json",
            type:"post",
            success:function(data) {
                console.log(data)
                if(data==0){
                    window.location.href="${path}/jds/Xzlc.jsp";
                }

            }
        });


    });


    $("#eidBtn").click(function () {
                    window.location.href="${path}/jds/Xzlc.jsp?";
    });
</script>

</html>

