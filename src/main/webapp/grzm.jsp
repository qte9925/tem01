<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="gy.jsp" %>
<script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
<html>
<style>
    #gg{
        border: #388bff solid 1px;
        width: 400px;
        height: 500px;
        margin-left: 650px;
    }
</style>
<head>
    <title>角色与权限管理</title>
</head>
<body >

<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <input class="btn btn-default btn-sm" value="个人考勤" onclick="tz();">
</form>
<div id="gg">
    <center>公告</center>
    <table>
        <tr>

            <td>
                未读公告
            </td>
        </tr>
        <tbody id="tbody"></tbody>
    </table>
    <table>
        <tr>
            <td>
                已读公告
            </td>

        </tr>
        <tbody id="tbody1"></tbody>
    </table>

</div>

</table>
<script type="text/javascript">
    function searchInfo(nowPage){
        var aa=${sessionScope.list[0].ryid}

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
