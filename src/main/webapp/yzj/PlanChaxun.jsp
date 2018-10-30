<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    <%--<script type="text/javascript" src="'${path}'/js/jquery-1.8.3.min.js"></script>--%>
    <link rel="stylesheet" href="js/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script></head>
    <script src="${path}/yzj/laydate/laydate.js"></script>
</head>

<style>
#asss{
    width:1500px;
}
</style>

<script type="text/javascript">
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#gg' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#hh' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#beginclass' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#endclass' //指定元素
    });
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/selectPlan",
            data:{"aa":$("#staff").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                $("#yzj").html('');
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
                    html = html + "<td>" + p.planid + "</td>";
                    html = html + "<td>" + p.planname + "</td>";
                    html = html + "<td>" + p.joinpeople + "</td>";
                    html = html + "<td>" + p.trainingaddress + "</td>";
                    html = html + "<td>" + p.classname + "</td>";
                    html = html + "<td>" + p.totalhours + "</td>";
                    html = html + "<td>" + p.beginclass + "</td>";
                    html = html + "<td>" + p.endclass + "</td>";
                    html = html + "<td>" + p.rainingbudget + "</td>";
                    html = html + "<td>" + p.rainingRequirement + "</td>";
                    html = html + "<td>" + p.rainingexplain + "</td>";
                    html = html + "<td>" + p.bmname + "</td>";
                    html = html + "<td>" + p.ryxm + "</td>";
                    html = html + "<td>" + p.qvdaoname + "</td>";
                    html = html + "<td>" + p.xingshiname + "</td>";

                    html = html + "<td><button onclick='deleteNeed(" + p.Id + ")'  class='btn btn-primary' >删除</button>" +
                        "<button onclick='UpdateNeeds(" + p.Id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button></td>";
                    html = html + "</tr>";
                    $("#yzj").append(html);
                }
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);

                //最后一页的下一页显示隐藏

                if (data.isLastPage) {
                    $("#next").hide();
                } else {
                    $("#next").show();
                }
                //第一页的上一页显示隐藏

                if (data.isFirstPage) {
                    $("#pre").hide();
                } else {
                    $("#pre").show();
                }
            }
        })

    }
   $().ready(function() {
        getinfo(1);
        $("#selectBtn").click(function() {
            getinfo(1);
        });
    });
    function changePage(op){
        var nowPage=$("#nowPage").html();
        if(op=='next')
            nowPage=Number(nowPage)+1;
        else
            nowPage=Number(nowPage)-1;
        getinfo(nowPage);
    }

    function deleteNeed(Id){
        $.ajax({
            url:"${path}/deletePlan",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    $().ready(function(){

        $("#addPlan").click(function(){
            $.ajax({
                url:"${path}/AddPlan",
                data:{"planid":$("#planid").val(),
                    "planname":$("#planname ").val(),
                    "joinpeople":$("#joinpeople").val(),
                    "trainingaddress":$("#trainingaddress").val(),
                    "classname":$("#classname").val(),
                    "totalhours":$("#totalhours").val(),
                    "beginclass":$("#beginclass").val(),
                    "endclass":$("#endclass").val(),
                    "rainingbudget":$("#rainingbudget").val(),
                    "rainingRequirement":$("#rainingRequirement").val(),
                    "rainingexplain":$("#rainingexplain").val(),
                    "departmentid":$("#departmentid").val(),
                    "shenpirenid":$("#shenpirenid").val(),
                    "qvdaoid":$("#qvdaoid").val(),
                    "xingshiid":$("#xingshiid").val(),
                },
                dataType:"json",
                type:"post",
                success:function(data){
                       if(data>0){
                           window.location.reload();
                       }
                 }
            });
        });
    });
    /*---------------------------------------------------------------------------------------*/

    function UpdateNeeds(Id){
        //修改前查询
        $.ajax({
            url:"${path}/selectByIdPlan",
            type:"post",
            dataType:"json",
            data:{"Id":Id},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p = data[i];
                    $("#aa").val(p.planid);
                    $("#bb").val(p.planname);
                    $("#cc").val(p.joinpeople);
                    $("#dd").val(p.trainingaddress);
                    $("#ee").val(p.classname);
                    $("#ff").val(p.totalhours);
                    $("#gg").val(p.beginclass);
                    $("#hh").val(p.endclass);
                    $("#ii").val(p.rainingbudget);
                    $("#jj").val(p.rainingRequirement);
                    $("#kk").val(p.rainingexplain);

                }
            }
        })
        /*审批人*/
        $.ajax({
            url:"${path}/Findshenpiren",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#mm").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.ryid+"'>"+p.ryxm+"</option>";
                    $("#mm").append(html);
                }
            }
        })
        /*部门*/
        $.ajax({
            url:"${path}/FindDepartmentTypePlan",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#ll").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.bmid+"'>"+p.bmname+"</option>";
                    $("#ll").append(html);
                }
            }
        })
        /*渠道*/
        $.ajax({
            url:"${path}/Findqvdao",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#nn").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.id+"'>"+p.qvdaoname+"</option>";
                    $("#nn").append(html);
                }
            }
        })
        /*形式*/
        $.ajax({
            url:"${path}/FindXingshi",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#oo").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.id+"'>"+p.xingshiname+"</option>";
                    $("#oo").append(html);
                }
            }
        })
        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/updatePlan",
                type:"post",
                dataType:"json",
                data:{
                    "planid":$("#aa").val(),
                    "planname":$("#bb").val(),
                    "joinpeople":$("#cc").val(),
                    "trainingaddress":$("#dd").val(),
                    "classname":$("#ee").val(),
                    "totalhours":$("#ff").val(),
                    "beginclass":$("#gg").val(),
                    "endclass":$("#hh").val(),
                    "rainingbudget":$("#ii").val(),
                    "rainingRequirement":$("#jj").val(),
                    "rainingexplain":$("#kk").val(),
                    "departmentid":$("#ll").val(),
                    "shenpirenid":$("#mm").val(),
                    "qvdaoid":$("#nn").val(),
                    "xingshiid":$("#oo").val(),
                    "Id":Id
                },
                success:function(data){
                    if(data>0){
                       /* window.location.href="/yzj/PlanChaxun.jsp";*/
                        window.location.reload();
                    }

                }
            })
        })
    }
</script>
<div style="text-align:center;">
    需求内容<input type="text" id="staff">
    <button id="selectBtn" class='btn btn-primary'>查询</button>
    <button class='btn btn-primary' data-toggle="modal" data-target="#myModal">
        增加
    </button>
</div>
<div class="container" id="asss">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>计划编码</th>
            <th>计划名称</th>
            <th>参加人数</th>
            <th>培训地点</th>
            <th>课程名称</th>
            <th>总课时</th>
            <th>开课时间</th>
            <th>结课时间</th>
            <th>培训预算</th>
            <th>培训要求</th>
            <th>培训说明</th>
            <th>部门</th>
            <th>审批人</th>
            <th>培训渠道</th>
            <th>培训形式</th>
        </tr>
        </thead>
        <tbody id="yzj">

        </tbody>
    </table>
</div>

<table>
    <center>
    <a id="pre" onclick="changePage('pre')">上一页</a>
    <a id="next" onclick="changePage('next')">下一页</a>
    当期页<span id="nowPage"></span>
    总共<span id="total"></span>条
</center>
</table>
<center>

</center>
<!-- 增加得---------------------------------------模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>计划编码:</td>
                        <td><input type="text" name="staffName" id="planid"></td>
                    </tr>
                    <tr>
                        <td>计划名称:</td>
                        <td><input type="text" name="post" id="planname"></td>
                    </tr>
                    <tr>
                        <td>参加人数:</td>
                        <td><input type="text" name="shenpimode" id="joinpeople"></td>
                    </tr>
                    <tr>
                        <td>培训地点:</td>
                        <td><input type="text" name="education" id="trainingaddress"></td>
                    </tr>
                    <tr>
                        <td>课程名称:</td>
                        <td><input type="text" name="writePeople" id="classname"></td>
                    </tr>
                    <tr>
                        <td>总课时:</td>
                        <td><input type="text" name="department" id="totalhours"></td>
                    </tr>
                    <tr>
                        <td>开课时间:</td>
                        <td><input type="text" name="department" id="beginclass"></td>
                    </tr>
                    <tr>
                        <td>结课时间:</td>
                        <td><input type="text" name="department" id="endclass"></td>
                    </tr>
                    <tr>
                        <td>培训预算:</td>
                        <td><input type="text" name="department" id="rainingbudget"></td>
                    </tr>
                    <tr>
                        <td>培训要求:</td>
                        <td><input type="text" name="department" id="rainingRequirement"></td>
                    </tr>
                    <tr>
                        <td>培训说明:</td>
                        <td><input type="text" name="department" id="rainingexplain"></td>
                    </tr>
                    <tr>
                        <td>部门ID:</td>
                        <td><input type="text" name="department" id="departmentid"></td>
                    </tr>
                    <tr>
                        <td>审批人ID:</td>
                        <td><input type="text" name="department" id="shenpirenid"></td>
                    </tr>
                    <tr>
                        <td>培训渠道:</td>
                        <td><input type="text" name="department" id="qvdaoid"></td>
                    </tr>
                    <tr>
                        <td>培训形式:</td>
                        <td><input type="text" name="department" id="xingshiid"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="addPlan">
                    增加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   修改信息
                </h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>计划编码:</td>
                        <td><input type="text" id="aa"></td>
                    </tr>
                    <tr>
                        <td>计划名称:</td>
                        <td><input type="text" id="bb"></td>
                    </tr>
                    <tr>
                        <td>参加人数:</td>
                        <td><input type="text" id="cc"></td>
                    </tr>
                    <tr>
                        <td>培训地点</td>
                        <td><input type="text"id="dd"></td>
                    </tr>
                    <tr>
                        <td>课程名称:</td>
                        <td><input type="text" id="ee"></td>
                    </tr>
                    <tr>
                        <td>总课时:</td>
                        <td><input type="text"id="ff"></td>
                    </tr>
                    <tr>
                        <td>开课时间:</td>
                        <td><input type="text"id="gg"></td>
                    </tr>
                    <tr>
                        <td>结课时间:</td>
                        <td><input type="text"id="hh"></td>
                    </tr>
                    <tr>
                        <td>培训预算:</td>
                        <td><input type="text"id="ii"></td>
                    </tr>
                    <tr>
                        <td>培训要求:</td>
                        <td><input type="text"id="jj"></td>
                    </tr>
                    <tr>
                        <td>培训说明:</td>
                        <td><input type="text"id="kk"></td>
                    </tr>
                    <tr>
                        <td>部门:</td>
                        <td><select id="ll"></select></td>
                    </tr>
                    <tr>
                        <td>审批人:</td>
                        <td><select id="mm"></select></td>
                    </tr>
                    <tr>
                        <td>培训渠道:</td>
                        <td><select id="nn"></select></td>
                    </tr>
                    <tr>
                        <td>培训形式:</td>
                        <td><select id="oo"></select></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateBtn">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</html>
