<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="gy.jsp" %>
<link rel="stylesheet" href="${path}/jds/css/style.css">


<script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
<html>
<style>
   /* #gg{
        border: #388bff solid 0px;
        width: 400px;
        height: 500px;
        margin-left: 650px;
    }*/
</style>
<head>
    <title>角色与权限管理</title>
</head>
<body >

<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <input class="btn btn-default btn-sm" value="个人考勤" onclick="tz();">
</form>
<div id="gg">
    <center>公告
    <table class="table table-bordered">

        <tr>

            <td>
                未读公告
            </td>
        </tr>
        <tbody id="tbody"></tbody>
   <%-- </table>
    <table class="table table-bordered">--%>
        <tr>
            <td>
                已读公告
            </td>

        </tr>
        <tbody id="tbody1"></tbody>
    </table>
    </center>
</div>
<div id="chart">
    <ul id="numbers">
        <li><span>100%</span></li>
        <li><span>90%</span></li>
        <li><span>80%</span></li>
        <li><span>70%</span></li>
        <li><span>60%</span></li>
        <li><span>50%</span></li>
        <li><span>40%</span></li>
        <li><span>30%</span></li>
        <li><span>20%</span></li>
        <li><span>10%</span></li>
        <li><span>0%</span></li>
    </ul>

    <ul id="bars">
        <li><div data-percentage="40" class="bar"></div><span>Option 1</span></li>
        <li><div data-percentage="33" class="bar"></div><span>Option 2</span></li>
        <li><div data-percentage="54" class="bar"></div><span>Option 3</span></li>
        <li><div data-percentage="94" class="bar"></div><span>Option 4</span></li>
        <li><div data-percentage="44" class="bar"></div><span>Option 5</span></li>
        <li>
            <div data-percentage="23" class="bar"></div><span>Option 6</span>
        </li>
    </ul>
</div>
<script src='${path}/jds/js/jquery.min.js'></script>
<script src="${path}/jds/js/index.js"></script>


</table>
<script type="text/javascript">
    function tz() {
        window.location.href='/wf02/grkq.jsp';
    }
    function searchInfo(nowPage){
        var aa=${sessionScope.list[0].ryid}
            // alert(aa)
        $.ajax({
            url:"${path}/selectG",
            data:{"aa":aa,"nowPage":nowPage},
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data)
                $("#tbody").html('');
                if(data!=null){
                    for(var i=0;i<data.list.length;i++){
                        var st=data.list[i];
                        var tr="<tr>";
                        tr=tr+"    <td>"+"<a href='${path}/jds/ggcx2.jsp?idd="+st.id+"'>"+st.zt+"</a>"+"</td>";
                        tr=tr+"   </tr>";
                        $("#tbody").append(tr);
                    }
                }
            }
        });

    };
    $().ready(function() {
        searchInfo(1);
    });
    function searchInfo1(nowPage){
        var aa=${sessionScope.list[0].ryid}
            // alert(aa)
        $.ajax({
            url:"${path}/selectG1",
            data:{"aa":aa,"nowPage":nowPage},
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data)
                $("#tbody1").html('');
                if(data!=null){
                    for(var i=0;i<data.list.length;i++){
                        var st=data.list[i];
                        var tr="<tr>";
                        tr=tr+"    <td>"+"<a href='${path}/jds/ggcx2.jsp?idd="+st.id+"'>"+st.zt+"</a>"+"</td>";
                        tr=tr+"   </tr>";
                        $("#tbody1").append(tr);
                    }
                }
            }
        });

    };
    $().ready(function() {
        searchInfo1(1);
    });
</script>
</body>
</html>
