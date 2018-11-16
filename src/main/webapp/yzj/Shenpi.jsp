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
    #jihua{
        width:1000px;
    }
    #zjbm{
        width:800px;
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
    lay('#version').html('-v'+ laydate.v);
    /*送审*/
    function SongShen(Id,statu){
        $.ajax({
            url:"${path}/UpdateStatu",
            type:"post",
            data:{"Id":Id,"statu":statu},
            dataType:"json",
            success:function(data){
                console.log(data);
                if(data>0){
                    window.location.reload();
                }
            }
        })
    }
    /*状态,驳回理由*/
    function UpdatePlanMessage(id,zt){
        $("#a1").val(id); $("#a3").val(zt);$("#a4").val(xinxi);
    }
    /*通过驳回*/
    function tijiao(){
        $.ajax({
        url:"${path}/updatestatu",
        type:"post",
        data:{"id":$("#a1").val(),"zt":$("#a3").val(),"xinxi":$("#a4").val()},
        dataType:"json",
        success:function(data){
            if(zt==1){
                $("#a3").val("审批中")
            }

        console.log(data);
        if(data>0){
        window.location.reload();
        }
        }
        })
    }
    /*统计报名限制查询*/
    $().ready(function(){
        $.ajax({
            url:"${path}/SelectBaoMingStatu",
            type:"post",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p=data[i];
                    $("#g").val(p.ryid);
                    if(p.bmpd>0){
                        $("#adda").attr("disabled",true);

                    }
                }
            }
        })
    })
    function getinfo(nowPage) {
        $.ajax({
            url : "${path}/shenpirendechaxun",
            data:{"aa":$("#staff").val(),"Pid":$("#Pid").val(),"nowPage":nowPage},
            type : "post",
            dataType : "json",
            success : function(data) {
                $("#yzj").html('');
                console.log(data);
                for (var i = 0; i < data.list.length; i++) {
                    var p = data.list[i];
                    var html = "<tr>";
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
                    html = html + "<td>" + p.qvdao + "</td>";
                    html = html + "<td>" + p.xingshi + "</td>";
                    if(p.statu==0){
                        html = html + "<td>未审批</td>";
                    }else if(p.statu==1){
                        html = html + "<td>审批中</td>";
                    }else if(p.statu==2){
                        html = html + "<td>已通过</td>";
                    }else if(p.statu==3){
                        html = html + "<td>未通过</td>";
                    }

                     if(p.statu==0){
                        html = html + "<td><button onclick='deleteNeed(" + p.Id + ")'  class='btn btn-primary' >删除</button>" +
                            "<button onclick='UpdateNeeds(" + p.Id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button>";
                        html = html + "<button onclick='SongShen("+p.Id+",1)'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModalb'>送审</button>";
                    }else if(p.statu==2){
                        html = html + "<td><button onclick='Sign("+p.totalhours+","+p.joinpeople+","+p.ryid+")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal'  data-target='#myModala01'>报名</button>";
                    }else if(p.statu==3){
                        html = html + "<td><button onclick='deleteNeed(" + p.Id + ")'  class='btn btn-primary' >删除</button>" +
                            "<button onclick='UpdateNeeds(" + p.Id + ")'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModala' id='xgk'>修改</button>";
                        html = html + "<button onclick='SongShen("+p.Id+",1)'  class='btn btn-primary' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModalb'>送审</button>";
                    }
                    html = html + "</td>";
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
    function Shenpi(Id){
        window.location.href="yzj/chaxun.jsp"
    }

    function deleteNeed(Id){
        alert("确认要删除吗")
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
                data:{
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
                    "departmentid":$("#lll").val(),
                    "qvdao":$("#qvdaoid").val(),
                    "xingshi":$("#xingshiid").val(),
                    "statu":$("#Zt").val(),
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
        /*部门*/
        $.ajax({
            url:"${path}/FindDepartmentTypePlan",
            type:"post",
            dataType:"json",
            success:function(data){
                console.log(data)
                $("#lll").html('');
                for(var i=0; i<data.length;i++){
                    var p = data[i];
                    var html="<option value='"+p.bmid+"'>"+p.bmname+"</option>";
                    $("#lll").append(html);
                }
            }
        })
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
                    $("#bb").val(p.planname);
                    $("#cc").val(p.joinpeople);
                    /*报名人数查询#e*/
                    $("#e").val(p.joinpeople);
                    $("#dd").val(p.trainingaddress);
                    $("#ee").val(p.classname);
                    $("#ff").val(p.totalhours);
                    $("#gg").val(p.beginclass);
                    $("#hh").val(p.endclass);
                    $("#ii").val(p.rainingbudget);
                    $("#jj").val(p.rainingRequirement);
                    $("#kk").val(p.rainingexplain);
                    $("#nn").val(p.qvdao);
                    $("#oo").val(p.xingshi);


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
        //修改
        $("#updateBtn").click(function(){
            $.ajax({
                url:"${path}/updatePlan",
                type:"post",
                dataType:"json",
                data:{
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
                    "qvdao":$("#nn").val(),
                    "xingshi":$("#oo").val(),
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
    /*添加报名*/
    $().ready(function(){
        $("#adda").click(function(){
            $.ajax({
                url:"${path}/AddBaomingYzj01",
                data:{
                    "ryid":$("#d").val(),
                    "beizhu":$("#c").val(),
                    "totalhours":$("#b").val(),
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data.state){
                        alert(data.message);
                        window.location.reload();
                    }
                }
            });
        });
    });
    /*统计查询*/
    function Sign(totalhours,joinpeople){
        console.log(totalhours)
        $.ajax({
                    url:"${path}/selectyijingbaoming",
                    type:"post",
                    dataType:"json",
                    data:{"totalhours":totalhours},
                    success:function(data){

                        $("#tishi").html("");
                        for(var i=0;i<data.length;i++){
                            var p=data[i];
                            console.log(p.number+"ppp");
                            console.log(joinpeople+"oooo");
                            $("#f").val(p.number);
                            if(p.number>=joinpeople){
                                $("#adda").attr("disabled",true);
                                $("#tishi").html("<font color='red'>报名人数已达上限!</font>");

                            }

                        }

                    }

                })

                    $("#b").val(totalhours);
                    $("#e").val(joinpeople);
    }
    /*统计报名限制得查询*/
   /* function Sign(planid,totalhours,joinpeople){
        $.ajax({
            url:"${path}/SelectBaoMingStatu",
            type:"post",
            dataType:"json",
            data:{"ryid":ryid},
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var p=data[i];
                    $("#g").val(p.bmpd);
                    if(p.bmpd>0){
                        $("#adda").attr("disabled",true);
                        $("#g").html("<font color='red'>不能重复报名!</font>");
                    }
                }
            }
        })
    }*/
</script>
<!-- 增加报名---------------------------------------模态框（Modal） -->
<div class="modal fade" id="myModala01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" id="zjbm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" >
                    <tr>
                        <td>总课时:</td>
                        <td><input type="text" name="post" id="b" disabled="disabled"></td>
                        <td>备注:</td>
                        <td><input type="text" name="shenpimode" id="c"></td>
                    </tr>
                    <tr>
                        <td>报名人:</td>
                        <td><input type="text" style="display: none;" readonly="readonly" id="d" value="${sessionScope.list[0].ryid}">
                            <input type="text" readonly="readonly"  value="${sessionScope.list[0].ryxm}"></td>
                    </tr>
                    <tr>
                        <td>培训总人数:</td>
                        <td><input type="text" name="shenpimode" id="e" disabled="disabled"></td>
                        <td>已报人数:</td>
                        <td><input type="text" id="f" disabled="disabled"></td>

                    </tr>
                </table>
                <span id="tishi"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="adda">
                    报名
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModalb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
            </div>
            <table class="table table-bordered">
            <tr>
                <td>修改的列ID</td>
                 <td><input type="text" id="a1"disabled="disabled"></td>
                <td>修改人</td>
                <td>${sessionScope.list[0].yhname}</td>
            </tr>
                <tr>
                    <td>修改状态</td>
                    <input type="text" value="" style="display:none" id="a3"/>
                    /*<td><input type="hidden" value=""  ></td>*/
                    <td>理由</td>
                    <td><input type="text" id="a4"></td>
                </tr>
            </table>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="tijiao();">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div style="text-align:center;">
    <button class='btn btn-primary' data-toggle="modal" data-target="#myModal">
        新建培训计划
    </button>
    <tr><td>总课时<input type="text" id="Pid"></td></tr>
    <tr><td>计划名称<input type="text" id="staff"></td></tr>
    <button id="selectBtn" class='btn btn-primary'>查询</button>
</div>

    </button>
    <table class="table table-bordered">
        <thead>
        <tr>
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
            <th>参与部门</th>
            <th>培训渠道</th>
            <th>培训形式</th>
            <th>状态</th>
            <th><center>操作</center></th>
        </tr>
        </thead>
        <tbody id="yzj">

        </tbody>
    </table>

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
    <div class="modal-dialog" id="jihua">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body" >
                <table class="table table-bordered" >
                    <tr>
                        <td>计划名称:</td>
                        <td><input type="text" name="post" id="planname"></td>
                    </tr>
                    <tr>
                        <td>参加人数:</td>
                        <td><input type="text" name="shenpimode" id="joinpeople"></td>
                        <td>培训地点:</td>
                        <td><input type="text" name="education" id="trainingaddress"></td>
                    </tr>
                    <tr>
                        <td>课程名称:</td>
                        <td><input type="text" name="writePeople" id="classname"></td>
                        <td>总课时:</td>
                        <td><input type="text" name="department" id="totalhours"></td>
                    </tr>
                    <tr>
                        <td>开课时间:</td>
                        <td><input type="text" name="department" id="beginclass"></td>
                        <td>结课时间:</td>
                        <td><input type="text" name="department" id="endclass"></td>
                    </tr>
                    <tr>
                        <td>培训预算:</td>
                        <td><input type="text" name="department" id="rainingbudget"></td>
                        <td>培训要求:</td>
                        <td><input type="text" name="department" id="rainingRequirement"></td>
                    </tr>
                    <tr>
                        <td>培训说明:</td>
                        <td><input type="text" name="department" id="rainingexplain"></td>
                        <td>参与部门:</td>
                        <td><select  name="department" id="lll"></select></td>
                    </tr>
                    <tr>
                        <td>培训渠道:</td>
                        <td><input type="text" name="department" id="qvdaoid"></td>
                    </tr>
                    <tr>
                        <td>培训形式:</td>
                        <td><input type="text" name="department" id="xingshiid"></td>
                    </tr>
                    <tr>
                        <td>状态:</td>
                        <td><input type="text" name="department" id="Zt"></td>
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
                <table class="table table-bordered">
                    <tr>
                        <td>计划名称:</td>
                        <td><input type="text" id="bb"></td>
                    </tr>
                    <tr>
                        <td>参加人数:</td>
                        <td><input type="text" id="cc"></td>
                        <td>培训地点</td>
                        <td><input type="text"id="dd"></td>
                    </tr>
                    <tr>
                        <td>课程名称:</td>
                        <td><input type="text" id="ee"></td>
                        <td>总课时:</td>
                        <td><input type="text"id="ff"></td>
                    </tr>
                    <tr>
                        <td>开课时间:</td>
                        <td><input type="text"id="gg"></td>
                        <td>结课时间:</td>
                        <td><input type="text"id="hh"></td>
                    </tr>
                    <tr>
                        <td>培训预算:</td>
                        <td><input type="text"id="ii"></td>
                        <td>培训要求:</td>
                        <td><textarea type="text"id="jj"></textarea></td>
                    </tr>
                    <tr>
                        <td>培训说明:</td>
                        <td><textarea type="text"id="kk"></textarea></td>
                        <td>部门:</td>
                        <td><select id="ll"></select></td>
                    </tr>
                    <tr>
                        <td>培训渠道:</td>
                        <td><input type="text" id="nn"></td>
                    </tr>
                    <tr>
                        <td>培训形式:</td>
                        <td><input type="text" id="oo"></td>
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
