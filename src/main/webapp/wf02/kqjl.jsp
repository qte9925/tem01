<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>考勤记录</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">考勤记录</a></button>
</form>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">考勤记录 </caption>
    <thead >
    <tr>
        <th>人员名称</th>
        <th>上班天数</th>
        <th>病假时长</th>
        <th>事假时长</th>
        <th>加班时长</th>
        <th>迟到时长</th>
        <th>早退时长</th>
        <th>转正天数</th>
        <th>旷工天数</th>
        <th>月份</th>
    </tr>
    </thead>
    <tbody id="thead01" v-for="i in msg">
    <tr >
        <td >{{i.ryxm}}</td>
        <td >{{i.dysbts}}</td>
        <td >{{i.bingjia}}</td>
        <td >{{i.shijia}}</td>
        <td >{{i.jiaban}}</td>
        <td >{{i.chidao}}</td>
        <td >{{i.zaotui}}</td>
        <td >{{i.zhuanzhengtianshu}}</td>
        <td >{{i.kuanggong}}</td>
        <td >{{i.gzyf}}</td>
    </tr>
    </tbody>
</table>
    <center>
        <a id="pre01" onclick="fy02('pre')">上一页</a>
        <a id="next01" onclick="fy02('next')">下一页</a>
        当第<span id="nowPage01"></span>页,总共<span id="pages01"></span>页
    </center>
    <table class="table table-bordered" style="margin-left: 20px;" >
        <caption id="cap01">上下班记录 </caption>
        <thead >
        <tr>
            <th>人员名称</th>
            <th>日期</th>
            <th>第一次登记</th>
            <th>最后一次登记</th>
            <%--<th>操作</th>--%>
        </tr>
        </thead>
        <tbody id="thead0101">
        <tr >
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
    <center>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页,总共<span id="pages"></span>页
    </center>
</div>
<script type="text/javascript">
    function gg(nowPage,id){
        $.ajax({
            url: "${path}/selectwf_qiandao",
            type: "post",
            data:{"nowPage":nowPage},
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#thead0101").html('');
                if(data!=null){
                    for(var i=0;i<data.list.length;i++){
                        var st=data.list[i];
                        var tr='<tr >';
                        tr=tr+'<td>'+st.ryxm+'</td>';
                        tr=tr+'<td>'+st.qdsj+'</td>';
                        tr=tr+'<td>'+st.qdsj011+'</td>';
                        tr=tr+'<td>'+st.qdsj012+'</td>';
                        // tr=tr+'<td>'+st.qdsj+'</td>';
                        tr=tr+'</tr>';
                        $("#thead0101").append(tr);
                    }
                    $("#nowPage").html(data.pageNum);
                    $("#total").html(data.total);
                    $("#pages").html(data.pages);
                    //最后一页的下一页显示隐藏
                    if(data.isLastPage){
                        $("#next").hide();
                    }else{
                        $("#next").show();
                    }
                    //第一页的上一页显示隐藏

                    if(data.isFirstPage){
                        $("#pre").hide();
                    }else{
                        $("#pre").show();
                    }
                }
            }
        });}
        function gg02(nowPage,id) {
        var StaffJobChangeApplication = {msg:[]};
        var vm = new Vue({
            el:'#ccc',
            data:StaffJobChangeApplication
        });
        $.ajax({
            url: "${path}/selectwf_kqtj",
            type: "post",
            date:{
                "nowPage":nowPage
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                StaffJobChangeApplication.msg = data.list;
                $("#nowPage01").html(data.pageNum);
                $("#total01").html(data.total);
                $("#pages01").html(data.pages);
                //最后一页的下一页显示隐藏
                if(data.isLastPage){
                    $("#next01").hide();
                }else{
                    $("#next01").show();
                }
                //第一页的上一页显示隐藏

                if(data.isFirstPage){
                    $("#pre01").hide();
                }else{
                    $("#pre01").show();
                }
            }
        });


    }
    function fy(op) {
        var nowPage = $("#nowPage").html();
        if (op == 'next') nowPage = Number(nowPage) + 1;
        else nowPage = Number(nowPage) - 1;
        gg(nowPage);
    };
    function fy02(op) {
        var nowPage = $("#nowPage02").html();
        if (op == 'next') nowPage = Number(nowPage) + 1;
        else nowPage = Number(nowPage) - 1;
        gg(nowPage);
    };
    $().ready(function () {
            gg(1);
            gg02(1);
    });
</script>
</body>
</html>
