<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>请假登记</title>
</head>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="grkq.jsp">工作日历</a></button>
    <button class="btn btn-default btn-sm"><a href="sxbdj.jsp">上下班登记</a></button>
    <button class="btn btn-default btn-sm"><a href="qjdj.jsp">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="ccdj.jsp">出差登记</a></button>
    <button class="btn btn-default btn-sm"><a href="rcjl.jsp">上下班记录</a></button>
</form>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="qjinsert.jsp">请假登记</a></button>
</form>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModaljl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabeljl">
                    简历筛选
                </h4>
            </div>
            <div class="modal-body" id="ccc01">
                <table class="table" >
                    <tbody id="tbo01">
                    <tr>
                        <td>所在部门</td>
                        <td>{{msg01[0].bmname}}</td>
                    </tr>
                    <tr>
                        <td>请假人员</td>
                        <td>{{msg01[0].ryxm}}</td>
                    </tr>
                    <tr>
                        <td>申请时间</td>
                        <td>{{msg01[0].qjsj}}</td>
                    </tr>
                    <tr>
                        <td>开始时间</td>
                        <td>{{msg01[0].ksrq}}</td>
                    </tr>
                    <tr>
                        <td>结束时间</td>
                        <td>{{msg01[0].jsrq}}</td>
                    </tr>
                    <tr>
                        <td>请假原因</td>
                        <td>{{msg01[0].yuanyin}}</td>
                    </tr>
                    <tr>
                        <td>申请类型</td>
                        <td>{{msg01[0].qjlxname}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div id="ccc">
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">请假登记 </caption>
    <thead >
    <Tr>
        <td>根据进度查询</td>
        <Td>
            <select class="form-control" id="hgccc01" onchange="cxgg();" >
            <option value="10">待审核</option>
            <option value="0">审核中</option>
            <option value="1">审核通过</option>
            <option value="2">审核不通过</option>
            </select>
        </Td>
    </Tr>
    <script>
        function cxgg() {
            var tgxz001 = $("#hgccc01").val();
            console.log(tgxz001);
            gg(undefined,tgxz001);
        }
    </script>
    <tr>
        <th>请假原因</th>
        <th>请假类型</th>
        <th>审批人员</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <%--<th>申请销假时间</th>--%>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr v-for="i in msg">
        <td>{{i.yuanyin}}</td>
        <Td>{{i.qjlxname}}</Td>
        <Td>{{i.shenpi}}</Td>
        <Td>{{i.ksrq}}</Td>
        <Td>{{i.jsrq}}</Td>
        <%--<Td v-if="i.qjxj == 0">未申请销假</Td>--%>
        <%--<Td v-if="i.qjxj == 1">申请销假中</Td>--%>
        <%--<Td v-if="i.qjxj == 2">销假审批成功</Td>--%>
        <%--<Td v-if="i.qjxj == 3">销假审批失败</Td>--%>
        <Td v-if="i.qjzt == 0">未送审</Td>
        <Td v-if="i.qjzt == 10">审批中</Td>
        <Td v-if="i.qjzt == 1">审批通过</Td>
        <Td v-if="i.qjzt == 2">审批失败</Td>
        <Td>
            <input class="btn btn-primary btn-xm" type="button" onclick="aaa('{{i.qjid}}');" value="详情">
            <input v-if="i.qjzt==0||i.qjzt==3" class="btn btn-primary btn-xm" type="button" onclick="gjidcx('{{i.qjid}}');" value="修改">
            <input v-if="i.qjzt==0||i.qjzt==3" class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.qjid}}');" value="删除">
            <input v-if="i.qjzt==0||i.qjzt==3" class="btn btn-primary btn-xm" type="button" onclick="songshen('{{i.qjid}}',10);" value="送审">
        </Td>
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
    function aaa(id) {
        $.ajax({
            url: "${path}/cxqinjiq02",
            data:{"id":id},
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                $("#tbo01").html("");
                if(data02.length>0){
                    if(data02[0].qjzt==10||data02[0].qjzt==0||data02[0].qjzt==1||data02[0].qjzt==2){
                        $("#myModalLabel").text("请假类型详情");
                    }
                }
                for(var i=0;i<data02.length;i++){
                    var html=' <tbody id="tbo01">';
                    var html='         <tr>';
                    html=html+'       <td>所在部门</td>';
                    html=html+'       <td>'+data02[0].bmname+'</td>';
                    html=html+'   </tr>';
                    html=html+'  <tr>';
                    html=html+'   <td>请假人员</td>';
                    html=html+'  <td>'+data02[0].ryxm+'</td>';
                    html=html+'  </tr>';
                    html=html+'   <tr>';
                    html=html+'   <td>申请时间</td>';
                    html=html+'   <td>'+data02[0].qjsj+'</td>';
                    html=html+'   </tr>';
                    html=html+'  <tr>';
                    html=html+'   <td>开始时间</td>';
                    html=html+'   <td>'+data02[0].ksrq+'</td>';
                    html=html+'   </tr>';
                    html=html+'   <tr>';
                    html=html+'   <td>结束时间</td>';
                    html=html+'  <td>'+data02[0].jsrq+'</td>';
                    html=html+'  </tr>';
                    html=html+'  <tr>';
                    html=html+'  <td>请假原因</td>';
                    html=html+'   <td>'+data02[0].yuanyin+'</td>';
                    html=html+'   </tr>';
                    // html=html+'  <tr>';
                    // html=html+'  <td>申请类型</td>';
                    // html=html+'  <td>'+data02[0].qjlxname+'</td>';
                    // html=html+'  </tr>';
                    $("#tbo01").append(html);
                }
                $('#myModaljl').modal('show');
            }

        });
    }
    function zpxq(id) {

    }
    function songshen(a1,a2) {
        $.ajax({
            url: "${path}/updateqj",
            data:{"qjzt":a2,
                "shenpiyijian":'',
                "shenpirenid":0,
                "sprname":0,
                "qjid": a1
            },
            type: "post",
            dataType: "json",
            success: function (data02) {
                console.log(data02);
                if(data02!=0){
                    window.location.reload();
                }else{
                    alert("提交失败");
                }
            }
        });
    }
    var StaffJobChangeApplication = {msg:[]};
    var vm = new Vue({
        el:'#ccc',
        data:StaffJobChangeApplication
    });
    function gg(nowPage,id){
        $.ajax({
            url: "${path}/qjspxq",
            type: "post",
            data:{"ryid":'${sessionScope.list[0].ryid}',"nowPage":nowPage,"id02":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                StaffJobChangeApplication.msg = data.list;
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
        });
    }
    function fy(op) {
        var nowPage = $("#nowPage").html();
        if (op == 'next') nowPage = Number(nowPage) + 1;
        else nowPage = Number(nowPage) - 1;
        gg(nowPage);
    };
    $().ready(function () {
        <%--console.log("1111"+'${sessionScope.list[0].rybmid}');--%>
        gg(1);
    });
</script>
</body>
</html>
