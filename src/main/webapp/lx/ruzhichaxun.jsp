<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>入职登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="#">离职登记</a></button>
</form>
<div id="ccc">
    <table>
        <Tr>
            <td>模糊检索</td>
            <Td><input type="text" class="form-control"></Td>
        </Tr>
    </table>
    <table class="table table-bordered" style="margin-left: 20px;" >
        <caption id="cap">入职登记 </caption>
        <thead >
        <tr>
            <th>入职人员</th>
            <th>部门</th>
            <th>入职日期</th>
            <th>审批人员</th>
            <th>状态</th>
            <th>操作</th>

        </tr>
        </thead>
        <tbody id="thead01">
        <tr v-for="i in msg" v-if="i.rzzt!=3 && i.rzzt!=4 && i.rzzt!=5  ">
            <td>{{i.jlname}}</td>
            <td>{{i.bmname}}</td>
            <Td>{{i.rzdata}}</Td>
            <Td>{{i.ryxm}}</Td>
            <Td v-if="i.rzzt == 0">审批中</Td>
            <Td v-if="i.rzzt == 2">已入职</Td>
            <Td>
                <button>
                    <a href="javascript:lzdjupdate('{{i.rzid}}',2)" onclick="zjht('{{i.rzid}}');">通过并增加员工</a>
                </button>
            </Td>
        </tr>
        </tbody>
    </table>
    <center>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页
    </center>
</div>
<script type="text/javascript">
    function lzdjupdate(rzid,rzzt) {
        $.ajax({
            url: "${path}/rzzx",
            data:{"rzzt":rzzt,"rzid":rzid},
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                if(data02>0){
                    window.location.reload();
                }
            }
        });
    }
    //分页
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(){
        $.ajax({
            url: "${path}/rymssqselect2",
            type: "post",
            // data:{"id":date.getMonth()+1},
            // data:{"id":'02'},
            dataType: "json",
            success: function (data) {
                console.log("aaaa"+data);
                console.log(data);
                StaffJobChangeApplication.msg = data.list;
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);
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
        });
    }
    function zjht(rzid) {
        $.ajax({
            url: "${path}/rzzj",
            data:{"ryxm":$("#ryxm").val(),
                "ryzhanghao":$("#ryzhanghao").val(),
                "rybmid":$("#rybmid").val(),
                "rygangwei":$("#rygangwei").val(),
                "rydata":$("#rydata").val(),
                "ryzwzt":$("#ryzwzt").val(),
                "rzid":rzid
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(rzzt);
                if(rzzt==0){
                    alert("提交失败")
                }else{
                    window.location.href="/lx/ruzhichaxun.jsp";
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
    $().ready(function () {
        gg();
    });
</script>
</body>
</html>
