<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>个人考勤</title>
</head>
<script type="text/javascript">
    function sg() {
        $.ajax({
        url: "${path}/gzrl",
        type: "post",
        // data:{"id":date.getMonth()+1},
        data:{"id":$("#gs").val()},
        dataType: "json",
        success: function (data) {
        console.log(data);
        $("#thead01").html("");
        $("#cap").text(data[0].MONTH_LONG_DESC);
        for (var i = 0; i < data.length; i++) {
        var p = data[i];
        if(i+6<data.length){
        var html = "<tr>"+
        "     <td style='height: 120px;'>"+data[i].DAY_LONG_DESC+"</td>"+
        "    <td >"+data[i+1].DAY_LONG_DESC+"</td>"+
        "    <td >"+data[i+2].DAY_LONG_DESC+"</td>"+
        "     <td >"+data[i+3].DAY_LONG_DESC+"</td>"+
        "    <td >"+data[i+4].DAY_LONG_DESC+"</td>"+
        "   <td >"+data[i+5].DAY_LONG_DESC+"</td>"+
        "   <td >"+data[i+6].DAY_LONG_DESC+"</td>"+
        " </tr>";
        }else{
        var html = "<tr>";
        html=html+"     <td style='height: 120px;'>"+data[i].DAY_LONG_DESC+"</td>";
        if(i+1<data.length){html=html+ "     <td style='height: 120px;'>"+data[i+1].DAY_LONG_DESC+"</td>"}
        if(i+2<data.length){html=html+"     <td style='height: 120px;'>"+data[i+2].DAY_LONG_DESC+"</td>"}
        if(i+3<data.length){html=html+"     <td style='height: 120px;'>"+data[i+3].DAY_LONG_DESC+"</td>"}
        html=html+" </tr>";
        }
        if(p.WEEK_DESC=="星期一"){
        $("#thead01").append(html);
        }

        }

        }
        });
    }
</script>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="">工作日历</a></button>
    <button class="btn btn-default btn-sm"><a href="#">上下班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">外出登记</a></button>
    <button class="btn btn-default btn-sm"><a href="qjdj.jsp">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">出差登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">加班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="#">上下班记录</a></button>
</form>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <select class="form-control" id="gs" onchange="sg();" >
        <option value="01">1月</option><option value="02">2月</option><option value="03">3月</option><option value="04">4月</option><option value="05">5月</option><option value="06">6月</option>
        <option value="07">7月</option><option value="08">8月</option><option value="09">9月</option><option value="10">10月</option><option value="11">11月</option><option value="12">12月</option>
    </select>
    <button class="btn btn-default btn-sm"><a href="javascript:gg();">当前</a></button>
</form>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">2018年 </caption>
    <thead >
    <tr>
        <th>周一</th>
        <th>周二</th>
        <th>周三</th>
        <th>周四</th>
        <th>周五</th>
        <th>周六</th>
        <th>周七</th>
    </tr>
    </thead>
    <tbody id="thead01">

    </tbody>
</table>
<script type="text/javascript">
    function gg(){
        var date = new Date();
        // alert();
        $.ajax({
            url: "${path}/gzrl",
            type: "post",
            data:{"id":date.getMonth()+1},
            // data:{"id":'02'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#thead01").html("");
                $("#cap").text(data[0].MONTH_LONG_DESC);
                for (var i = 0; i < data.length; i++) {
                    var p = data[i];
                    if(i+6<data.length){
                        var html = "<tr>"+
                            "     <td style='height: 120px;'>"+data[i].DAY_LONG_DESC+"</td>"+
                            "    <td >"+data[i+1].DAY_LONG_DESC+"</td>"+
                            "    <td >"+data[i+2].DAY_LONG_DESC+"</td>"+
                            "     <td >"+data[i+3].DAY_LONG_DESC+"</td>"+
                            "    <td >"+data[i+4].DAY_LONG_DESC+"</td>"+
                            "   <td >"+data[i+5].DAY_LONG_DESC+"</td>"+
                            "   <td >"+data[i+6].DAY_LONG_DESC+"</td>"+
                            " </tr>";
                    }else{
                        var html = "<tr>";
                        html=html+"     <td style='height: 120px;'>"+data[i].DAY_LONG_DESC+"</td>";
                        if(i+1<data.length){html=html+ "     <td style='height: 120px;'>"+data[i+1].DAY_LONG_DESC+"</td>"}
                        if(i+2<data.length){html=html+"     <td style='height: 120px;'>"+data[i+2].DAY_LONG_DESC+"</td>"}
                        if(i+3<data.length){html=html+"     <td style='height: 120px;'>"+data[i+3].DAY_LONG_DESC+"</td>"}
                        html=html+" </tr>";
                    }
                    if(p.WEEK_DESC=="星期一"){
                        $("#thead01").append(html);
                    }

                }

            }
        });
    }
    $().ready(function () {
            gg();
    });
</script>
</body>
</html>
