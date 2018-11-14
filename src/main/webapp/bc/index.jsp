<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>考核任务管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <link href="${path}/css/bootstrap-select.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/css/bootstrap-datetimepicker.min.css">
    <script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/js/vue.min.js"></script>
    <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
    <script type="text/javascript" src = "${path}/css/bootstrap.min.css"></script>
    <script type="text/javascript" src = "${path}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path }/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="${path}/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${path}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>

        //异步查询部门
        function showDept(){
            $.ajax({
                url:'${path}/showTbDept',
                data:{"tbDeptState":1},
                dataType:'json',
                async : false,
                type:'post',
                success:function(data){
                    $("#deptOne").html("");
                    var opt = '';
                    opt = opt+'<option value="0">--请选择部门--</option>';
                    for(var i= 0; i<data.length;i++){
                        var dep = data[i];
                        opt = opt+'<option value="'+dep.tb_dept_id+'" >'+dep.tb_dept_name+'</option>';
                    }
                    $("#deptOne").append(opt);
                }
            })
        }
    </script>
    <style type="text/css">
    #customerses{

    }
    </style>
</head>

<body style="padding: 0px;margin: 0px">

<div class="tab-pane fade" id="ios" >
    <table id = "customerses" class="table table-hover">
        <tr class = "alt1">
            <td>考核计划名称</td>
            <td><input type="text" class="form-control " id="tbTaskName" style="width: 40%"></td>
        </tr>
        <tr class = "alt">
            <td>考核计划说明</td>
            <td><input type="text" class="form-control " id="tbTaskText" style="width: 40%"></td>
        </tr>
        <tr class = "alt1">
            <td>考核人</td>
            <td>
                <div>
                    <select name="level1" id="level1" class="form-control "  style="width:150px;">
                    </select>
                </div>
                <div>
                    <select name="level2" id="level2" class="form-control " style="width:150px;">
                    </select>
                </div>
                <div>
                    <select name="level3" id="level3" class="form-control "  style="width:150px;">
                    </select>
                </div>
            </td>
        </tr>

        <tr class = "alt1">
            <td>被考核人</td>
            <td>
                <select id="slpk"  class="selectpicker" data-live-search="true" multiple onchange="showvalue()" style="width: 40%"></select>
                <%--<input type="text" id="deptinput">--%>
            </td>
        </tr>
        <tr class = "alt1">
            <td>考核优先级</td>
            <td><select type="text" class="form-control " id="tbStepId" style="width: 40%"></select></td>
        </tr>
        <tr class = "alt">
            <td>考核生效时间</td>
            <td><input type="text" class="form-control " id="tbTaskStarttime" style="width: 40%"></td>
        </tr>
        <tr class = "alt1">
            <td>考核截止时间</td>
            <td><input type="text" class="form-control " id="tbTaskEndtime" onblur="checkdate()" style="width: 40%"></td>
        </tr>
        <tr>
            <td>考核项</td>
            <td><input type="text"  id="tbEventIdOne" disabled="disabled" class="form-control " style="width: 40%" placeholder="考核项"></td>
            <input type="text"  class="tbEventIdOne" hidden/>
            <td style="cursor: pointer;width: 20px;">
                <img src="${path}/js/timg.jpg" id="HBtn" style="width: 20px;height: 20px;">
            </td>
        </tr>

    </table>
    <div>
    </div>
    <div style=" margin-left: 520px; margin-top: -5px;">
        <button class="btn btn-info FB" onclick="InsertTbTask()">发布</button>
    </div>
    <%--<div><button class="btn btn-default" onclick="()">测试</button></div>--%>
</div>
    </div>
<!-- 模态框 -->
<div class="modal fade" id="Nameid"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    考核人员列表
                </h4>
            </div>
            <table class="table table-bordered" style="text-align: center;">
                <tr style="text-align: center">
                    <td>考核人</td>
                    <td>部门</td>
                    <td>职位</td>
                    <td>评价状态</td>
                </tr>
                <tbody id = "tbody1">

                </tbody>
            </table>
            <div class="modal-footer" >
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>


<%--添加考核项--%>
<div class = "modal" id = "reimburse">
    <div class = "modal-dialog">
        <div class="modal-content">
            <div class = "modal-footer">
                <input type = "hidden" id = "rtid">
                <table class = "table table-bordered table-hover">
                    <tr>
                        <td>考核项</td>
                        <td >
                            <select class="form-control tbEventId" type="text"  ></select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class = "modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id ="InsetreimOne">关闭</button>
                <%-- <button type="button" class="btn btn-default"  id ="Insetreim">提交</button>--%>
            </div>
        </div>
    </div>
</div>
<!-- 模态框 post_id -->
<div class="modal fade" id="NameidTwo"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                <h4 class="modal-title" id="myModalLabelTwo">
                    考核人员列表
                </h4>
            </div>
            <table class="table table-bordered" style="text-align: center;">
                <tr style="text-align: center">
                    <td>被考核人</td>
                    <td>职位</td>
                </tr>
                <tbody id = "tbody2">
                <tr v-for="post in polist">
                    <td>{{post.tb_prople_ygkh_name}}</td>
                    <td>{{post.tb_staff_type}}</td>
                </tr>
                </tbody>
            </table>
            <div class="modal-footer" >
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框 NameidThree -->
<div class="modal fade" id="NameidThree"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                <h4 class="modal-title" id="myModalLabelThree">
                    考核项目
                </h4>
            </div>
            <table class="table table-bordered" style="text-align: center;">
                <tr style="text-align: center">
                    <td>考核项目</td>
                    <td>分值</td>
                </tr>
                <tbody id = "tbody3">
                <tr v-for="post in delist">
                    <td>{{post.tb_event_value}}</td>
                    <td>{{post.tb_event_mark}}</td>
                </tr>
                </tbody>
            </table>
            <div class="modal-footer" >
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
</div>

<!--  选择发布任务部门模态框 -->
<div class = "modal" id = "show4">
    <div class = "modal-dialog" style="width: 800px">
        <div class="modal-content" style="width: 800px">
            <div class = "modal-footer" style="width: 800px">
                <center><h4>选择导师</h4></center>
                <table class="table table-bordered" >
                    <tr>
                        <td>
                            <select class="form-control" id="deptOne" style="width:100%;float: left">
                                <option value="">--请选择部门--</option>
                            </select>
                        </td><td>
                        <select class="form-control" id="post" style="width:100%;float: left">
                            <option value="">--请选择职位--</option>
                        </select>
                    </td><td>
                        <select class="form-control" id="staffs" style="width:100%">
                            <option value="">--请选择导师--</option>
                        </select>
                    </td>
                    </tr>
                </table>
            </div>
            <div class = "modal-footer">
                <button type="button" class="btn btn-default" id="closeBtn1" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
    </div>
</div>
</body>
<script>
    var vueModel = {plist:[]};
    var vueModels = new Vue({
        el:'#tbody',
        data :vueModel
    });
    getTbTask({"pageNow":1});
    function getTbTask(json){
        $.ajax({
            url:'${path }/selectTbTask',
            data:json,
            dataType:'json',
            type:'post',
            success:function(data){
                vueModels.plist=data.list;
                $("#pageNow").html(data.pageNum);
                $("#allPage").html(data.pages);
                nextPage = data.nextPage;
                prePage = data.prePage;
                if(data.isLastPage){
                    $("#downPage").attr("disabled","disabled");
                }else{
                    $("#downPage").removeAttr("disabled");
                }
                if(data.isFirstPage){
                    $("#upPage").attr("disabled","disabled");
                }else{
                    $("#upPage").removeAttr("disabled");
                }
            }
        })
    };
    $("#Btn").click(function(){
        getTbTask({"tbTaskName":$("#tname").val(),"pageNow":1});
    });
    $("#upPage").click(function(){
        getTbTask({"tbTaskName":$("#tname").val(),"pageNow":prePage});
    });
    $("#downPage").click(function(){
        getTbTask({"tbTaskName":$("#tname").val(),"pageNow":nextPage});
    });
    //添加考核任务
    $(document).ready(
        function(){
            $.ajax({
                url:"${path}/showTbDept",
                data:{},
                dataType:"json",
                type:"post",
                ansy:false,
                success:function(data){
                    $("#level1").append("<option>------请选择------</option>");
                    for(var i=0;i<data.length;i++){
                        var obj=data[i];
                        $("#level1").append("<option value='"+obj.tb_dept_id+"'>"+obj.tb_dept_name+"</option>");
                    }
                }
            });

            $("#level1").change(function(){
                $.ajax({
                    url:"${path}/SelectTbPostByid",
                    data:{tbDeptId:$("#level1").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        $("#level2").html("");
                        $("#level3").html("");
                        $("#level2").append("<option>------请选择-----</option>");
                        $("#level3").append("<option>------请选择-----</option>");
                        for(var i=0;i<data.length;i++){
                            var obj=data[i];
                            $("#level2").append("<option value='"+obj.tb_post_id+"'>"+obj.tb_post_name+"</option>");
                        }
                    }
                })
            });
            $("#level2").change(function(){
                $.ajax({
                    url:"${path}/SelectPostBytbPostId",
                    data:{tbPostId:$("#level2").val()},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        $("#level3").html("");
                        $("#level3").append("<option>------请选择-----</option>");
                        for(var i=0;i<data.length;i++){
                            var obj=data[i];
                            $("#level3").append("<option value='"+obj.tb_staff_id+"'>"+obj.tb_staff_name+"</option>");
                        }
                    }
                })
            });

        }
    );
    $(".selectpicker").selectpicker({
        noneSelectedText : '请选择'
    });
    $(window).on('load', function() {
        $('.selectpicker').selectpicker('val', '');
        $('.selectpicker').selectpicker('refresh');
    });
    //下拉数据加载
    $.ajax({
        type : 'post',
        url : "${path}/showTbDept",
        dataType : 'json',
        success : function(datas) {//返回list数据并循环获取
            var select = $("#slpk");
            for (var i = 0; i < datas.length; i++) {
                select.append("<option value='"+datas[i].tb_dept_id+"'>"
                    + datas[i].tb_dept_name + "</option>");
            }
            $('.selectpicker').selectpicker('val', '');
            $('.selectpicker').selectpicker('refresh');
        }
    });
    function showvalue(){
        var arrayselectdept = $("#slpk").val();
        $("#deptinput").val(arrayselectdept);
    }
    //获取评价类别
    $().ready(function(){
        $.ajax({
            url:'${path }/selectStep',
            data:{},
            dataType:'json',
            type:'post',
            success:function(data){
                console.log(data);
                $("#tbStepId").html('');
                $("#tbStepId").append("<option>------请选择-----</option>");
                for(var i=0;i<data.length;i++){
                    var t = data[i];
                    var op = "<option value = '"+t.tb_step_id+"'>"+t.tb_step_nam+"</option>";
                    $("#tbStepId").append(op);
                }
            }
        });
    });
    ///////
    $("#deptOne").change(function(){
        if($("#deptOne").val()>0){
            $.ajax({
                url:'${path}/showTbPostByTbDeptId',
                data:{"tbDeptId":$("#deptOne").val(),"tbPostState":2},
                dataType:'json',
                async : false,
                type:'post',
                success:function(data){
                    $("#post").html("");
                    var opt = '';
                    opt = opt+' <option value="0">--请选择职位--</option>';
                    for(var i= 0; i<data.length;i++){
                        var dep = data[i];
                        opt = opt+'<option value="'+dep.tb_post_id+'">'+dep.tb_post_name+'</option>';

                    }
                    $("#post").append(opt);
                }
            })
        }
    })
    //更换职位
    $("#post").change(function () {
        if($("#post").val()>0){
            var postname = $("#post").find("option:selected").text();
            var deptname = $("#deptOne").find("option:selected").text();
            //获取员工
            $.ajax({
                url:'${path}/showStaffByPostId',
                data:{
                    "dname":deptname,
                    "pname":postname
                },
                dataType:'json',
                async : false,
                type:'post',
                success:function(data){
                    $("#staffs").html("");
                    var opt = '';
                    opt = opt+' <option value="0">--请选择导师--</option>';
                    for(var i= 0; i<data.length;i++){
                        var ca = data[i];
                        opt = opt+'<option value="'+ca.tb_staff_id+'">'+ca.tb_staff_name+'</option>';
                    }
                    $("#staffs").append(opt);
                }
            })
        }
    })
    //查询类别
    function texts(){
        $.ajax({
            url:'${path }/selectEventName',
            data:{},
            dataType:'json',
            type:'post',
            success:function(data){
                $(".tbEventId").html("<option>------请选择-----</option>");
                for(var i=0;i<data.length;i++){
                    var t = data[i];
                    var op = "<option value = '"+t.tb_event_id+"'>"+t.tb_event_value+"</option>";
                    $(".tbEventId").append(op);
                }
            }
        });
    };
    var eventIds ;
    $(".tbEventId").change(function(){
        var staffsname =  $(".tbEventId").find("option:selected").text();

        var ss = $(".tbEventIdOne").val();
        var s =  ss.split(",");
        var sss = 0;
        for ( var i = 0; i <s.length; i++){
            if(s[i]==staffsname){
                alert("已存在");
                sss=1;
                break;
            }else{
                sss=0;
            }
        }
        if(sss==0){
            if($("#tbEventIdOne").val() == ""){
                $("#tbEventIdOne").val(staffsname);
                $(".tbEventIdOne").val(staffsname);
                eventIds = $(".tbEventId").val();
            }else{
                var  name = $(".tbEventIdOne").val()+","+staffsname;
                eventIds = $(".tbEventId").val()+","+eventIds;
                $("#tbEventIdOne").val(name);
                $(".tbEventIdOne").val(name);
            }
        }
    })
    $("#staffs").change(function () {
        if($("#staffs").val()>0){
            var staffsname = $("#staffs").find("option:selected").text();
            if($("#Triningteacher").val() == ""){
                $("#Triningteacher").val(staffsname);
            }else{
                var  name = $("#Triningteacher").val()+","+staffsname;
                $("#Triningteacher").val(name);
            }
        }
    });

    $("#HBtn").click(function(){
        texts();
        $("#reimburse").show();
    });
    $("#InsetreimOne").click(function(){
        $("#reimburse").hide();
    })
    var jsonArray1 = new Array();// 存应聘申请
能和
    function message(){

    }

    //添加数据
    function InsertTbTask(){
        alert("+++++++++++++");
        $.ajax({
            url:"${path}/InsertTbTask",
            data:{
                "tbTaskName":$("#tbTaskName").val(),
                "tbTaskText":$("#tbTaskText").val(),
                "tbStaffId":$("#level3").val(),
                "tbStepId":$("#tbStepId").val(),
                "tbEventIdOne":eventIds,
                "tbTaskStarttime":$("#tbTaskStarttime").val(),
                "tbTaskEndtime":$("#tbTaskEndtime").val(),
                "tdTaskState":2,
                "deptString":$("#deptinput").val()
            },
            dataType:"json",
            type:"post",
            success:function(data){
                alert(data.message);
                window.location.href = "${path }/bc/management.jsp";
            }
        });
    };
    /*获取id */
    var vueModel2 = {tlist:[]};
    var vueModels2 = new Vue({
        el:'#tbody1',
        data :vueModel2
    });
    function OnBtnTask(tid){
        $.ajax({
            url:'${path }/selecttaskdept',
            data:tid,
            dataType:'json',
            type:'post',
            success:function(data){
                $("#tbody1").html("");
                var trinfo = '';
                for (var i  = 0 ; i<data.length;i++){
                    var sd = data[i];
                    trinfo = trinfo +'<tr>';
                    trinfo = trinfo +'<td>'+sd.tb_dept_men+'</td>';
                    trinfo = trinfo +'<td>'+sd.tb_dept_name+'</td>';
                    trinfo = trinfo +'<td>'+sd.tb_post_name+'</td>';
                    var state = sd.tb_task_state;
                    if(state == '1'){
                        trinfo = trinfo +'<td style="color: green">完成</td>';
                    }else {
                        trinfo = trinfo +'<td style="color: black">未完成</td>';
                    }
                    trinfo = trinfo +'</tr>';
                }
                $("#tbody1").append(trinfo);
            }
        })
    };
    /*根据postid获取部门信息*/
    var vueModelTwo = {polist:[]};
    var  vueModelsTwo = new Vue({
        el:'#tbody2',
        data :vueModelTwo
    })
    function onBtnPostid(name){
        alert("name==="+name);
        $.ajax({
            url:'${path}/selectPostid',
            data:name,
            dtaType:'json',
            type:'post',
            success:function(data){
                console.log(data);
                vueModelsTwo.polist=data;
            }
        });
    };

    /*查询考核项*/
    var vueModelThree = {delist:[]};
    var  vueModelsThree = new Vue({
        el:'#tbody3',
        data :vueModelThree
    })
    function onDeonltid(taid){
        $.ajax({
            url:'${path}/selectDetailone',
            data:taid,
            dtaType:'json',
            type:'post',
            success:function(data){
                console.log(data);
                vueModelsThree.delist=data;
            }
        });
    };
    function gettaskidOne(taskidone){
        alert("++++++"+taskidone)
        $.ajax({
            url:'${path}/UpdateTaskState',
            data:taskidone,
            dtaType:'json',
            type:'post',
            success:function(data){
                console.log(data);
                window.location.href = "${path }/bc/management.jsp";
            }
        });
    }
    //删除修改状态
    function  getDeleteid(uid){
        $.ajax({
            url:'${path}/DeleteTaskid',
            data:uid,
            dtaType:'json',
            type:'post',
            success:function(data){
                alert(data.message);
                console.log(data);
                window.location.href = "${path }/bc/management.jsp";
            }
        });
    }
    var did =0;//初始化
    $("#tbody").on("click",".DetailBtnOne",function(){
        did = this.id;
        OnBtnTask({'TbTaskId':did});
    });
    /*NameidTwo*/
    var name = ''; //初始化
    $("#tbody").on("click",".DetailBtnTwo",function(){
        name = this.id;
        onBtnPostid({'tbTaskName':name});
    });
    /*查询考核项*/
    var taid = 0 ; //初始化
    $("#tbody").on("click",".DetailBtnThree",function(){
        taid = this.id;
        onDeonltid({'TbTaskId':taid});
    });
    /* uid修改*/
    var uid = 0;
    $("#tbody").on("click",".DeleteById",function(){
        uid = this.id;
        alert("5555===="+uid);
        getDeleteid({'TbTaskId':uid});
    });
    var taskidone = 0;
    $("#tbody").on("click",".DeleteByIdOne",function(){
        taskidone = this.id;
        alert("6666===="+taskidone);
        gettaskidOne({'TbTaskId':taskidone});
    })
    //维护考核惹任务
    function show(tidOne){
        alert(tidOne);
        window.location.href = "${path }/bc/UpdateTask.jsp?tidOne="+tidOne;
    };
    $("#tbTaskName").blur(function(){
        if($("#tbTaskName").val() != ''){
            //验证考核任务名
            $.ajax({
                url:'${path}/selectTbTaskName',
                data:{
                    "tbTaskName" : $("#tbTaskName").val()
                },
                dataType:'json',
                type:'post',
                success:function(data){
                    if(data.state){
                        alert(data.message);
                        $(".FB").removeAttr("disabled");
                    }else{
                        alert(data.message);
                        $(".FB").attr("disabled","disabled");
                    }
                }
            })
        }
    })
    /*时间插件js*/
    $(function () {
        $('#tbTaskStarttime').datetimepicker({
            format:    'yyyy-mm-dd hh:mm',     // 设置时间年月日时分的格式 如: 2016/11/15 18:00 */
            autoclose:true,//选中关闭
            language:"zh-CN"
        });
    });
    $(function () {
        $('#tbTaskEndtime').datetimepicker({
            format:    'yyyy-mm-dd hh:mm',     // 设置时间年月日时分的格式 如: 2016/11/15 18:00 */
            autoclose:true,//选中关闭
            language:"zh-CN"
        });
    });
    function checkdate()
    {
        //得到日期值并转化成日期格式，replace(/\-/g, "\/")是根据验证表达式把日期转化成长日期格式，这样
        //再进行判断就好判断了
        var sDate = new Date(document.getElementById("tbTaskStarttime").value.replace(/\-/g, "\/"));
        var eDate = new Date(document.getElementById("tbTaskEndtime").value.replace(/\-/g, "\/"));
        if(sDate > eDate)
        {
            alert("结束日期不能小于开始日期");
            return false;
        }
        return true;
    }
    //切换卡js
    $(function(){
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e){
            var activeTab = $(e.target).text();
            var previousTab = $(e.relatedTarget).text();
            $(".active-tab span").html(activeTab);
            $(".previous-tab span").html(previousTab);
        });
    });
    $(function(){
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var activeTab = $(e.target).text();
            var previousTab = $(e.relatedTarget).text();
            $(".active-tab span").html(activeTab);
            $(".previous-tab span").html(previousTab);
        });
    });
</script>
</html>