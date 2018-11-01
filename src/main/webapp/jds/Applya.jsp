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

    <title>报销管理</title>

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
<center>
    员工编号:<input type="text" id="mjs">
    <button id="selectBtn" class="btn btn-primary">查询</button>
    <button id="addBtn"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">增加</button>
</center>
<div>
    <center>
        <table class="table table-bordered">
           <tr>
               <td>序号</td>
               <td>姓名</td>
               <td>员工编号</td>
               <td>申请主题</td>
               <td>申请日期</td>
               <td>状态</td>
               <td>操作</td>
           </tr>
            <tbody id="tbody"></tbody>
        </table>
        <a id="pre" onclick="fy('pre')">上一页</a>
        <a id="next" onclick="fy('next')">下一页</a>
        当第<span id="nowPage"></span>页
    </center>
</div>
<div class="modal fade" id="myModalb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabela">
                    修改报销申请
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    员工姓名：
                                </td>
                                <td>
                                <input type="text" id="s1">
                                 </td>

                            </tr>
                            <tr>
                                <td>
                                    员工编号：
                                </td>
                                <td>
                                    <input type="text" id="s2">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请主题：
                                </td>
                                <td>
                                    <input type="text" id="s3">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请金额：
                                </td>
                                <td>
                                    <input type="text" id="s4">
                                </td>
                            </tr>
                            <form id="addForm" action="${path}/uplode" method="post" enctype="multipart/form-data">
                            <tr>
                                <td>
                                    申请凭证：
                                </td>
                                <input type="text" id="aa" style="display:none">
                                <input type="text" id="a2" style="display:none">

                                <td>
                                    <img id="a1" src=""/> <input type="file" name="fileinfo" id="file">
                                </td>

                            </tr>
                                </form>
                            <tr>
                                <td>
                                    申请理由：
                                </td>
                                <td>
                                    <input type="text" id="s5">
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateBtn">
                    修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelb">
                    增加报销申请
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                    <table >
                        <tr>
                            <td>申请人：</td>
                            <td>
                                <input type="text" id="ygxm">以当前登陆人为准
                            </td>

                        </tr>
                        <tr>
                            <td>员工编号：</td>
                            <td>
                                <input type="text" id="ygid">请如实填写本人工号
                            </td>
                        </tr>
                        <tr>
                            <td>申请主题：</td>
                            <td>
                                <input type="text" id="sqzt">
                            </td>
                        </tr>
                        <tr>
                            <td>申请金额：</td>
                            <td>
                                <input type="text" id="sqje">请如实填写申请金额
                            </td>
                        </tr>
                        <form id="addForm1" action="${path}/uplode" method="post" enctype="multipart/form-data">
                            <tr>
                                <td>申请凭证：</td>

                                <td><input type="file" name="fileinfo" id="file1"></td>
                            </tr>
                        </form>
                        <tr>
                            <td>申请理由：</td>
                            <td> <textarea rows="10" cols="50" id="sqly"></textarea></td>
                        </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="addBtn1">
                   增加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModalc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelc">
                    报销申请详情
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    员工姓名：
                                </td>
                                <td>
                                    <input type="text" id="s11" disabled="disabled">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    员工编号：
                                </td>
                                <td>
                                    <input type="text" id="s21" disabled="disabled">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请主题：
                                </td>
                                <td>
                                    <input type="text" id="s31" disabled="disabled">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    申请金额：
                                </td>
                                <td>
                                    <input type="text" id="s41" disabled="disabled">
                                </td>
                            </tr>

                                <tr>
                                    <td>
                                        申请凭证：
                                    </td>
                                    <input type="text" id="aa1" style="display:none">
                                    <input type="text" id="a21" style="display:none">

                                    <td>
                                        <img id="a11" src=""/>
                                    </td>

                                </tr>

                            <tr>
                                <td>
                                    申请理由：
                                </td>
                                <td>
                                    <input type="text" id="s51" disabled="disabled">
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModalj" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelj">
                    审核未通过驳回原因
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    <textarea rows="10" cols="50" id="bz1"></textarea>
                                </td>
                            </tr>

                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <%--  <button type="button" class="btn btn-primary" >
                      确定
                  </button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
    function searchInfo(nowPage){
        $.ajax({
            url:"${path}/selectS",
            data:{"sqid":$("#mjs").val(),"nowPage":nowPage},
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data)
                $("#tbody").html('');
                if(data!=null){
                    for(var i=0;i<data.list.length;i++){
                        var st=data.list[i];
                        var tr="<tr>";
                        tr=tr+"   <td>"+(i+1)+"</td>";
                        tr=tr+"    <td>"+st.sqname+"</td>";
                        tr=tr+"    <td>"+st.sqid+"</td>";
                        tr=tr+"    <td>"+st.sqzt+"</td>";
                        tr=tr+"    <td>"+st.sqdata+"</td>";
                        if(st.state==0){
                            tr=tr+"    <td>"+"未审核"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalb\"/>"
                            tr=tr+"    <input type=\"button\" value='删除' onclick='bb("+st.id+")' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\"/></td>";
                        }
                        if(st.state==1){
                            tr=tr+"    <td>"+"审核中"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalb\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='删除' onclick='bb("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/></td>";

                        }
                        if(st.state==2){
                            tr=tr+"    <td>"+"已审核"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalb\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='删除' onclick='bb("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='详情' onclick='ee("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalc\"/></td>"

                        }
                        if(st.state==3){
                            tr=tr+"    <td>"+"已结束"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalb\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='删除' onclick='bb("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='详情' onclick='ee("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalc\"/></td>"
                            /*tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/></td>";*/
                        }
                        if(st.state==4){
                            tr=tr+"    <td>"+"审核未通过"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='修改' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalb\"/>";
                            tr=tr+"    <input type=\"button\" value='删除' onclick='bb("+st.id+")' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" />";
                            tr=tr+"    <input type=\"button\" value='原因' onclick='dd("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalj\"/></td>"
                        }

                        tr=tr+"   </tr>";
                        $("#tbody").append(tr);
                    }
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
            }
        });

    };
    $().ready(function() {
        searchInfo(1);
        $("#selectBtn").click(function () {
            searchInfo(1);
        });
    });
    function fy(op) {
        var nowPage = $("#nowPage").html();
        if (op == 'next') nowPage = Number(nowPage) + 1;
        else nowPage = Number(nowPage) - 1;
        searchInfo(nowPage);
    };
    function aa(id) {
        $.ajax({
            url:"${path}/selectSid",
            data:{"id":id,
            },
            dataType:"json",
            type:"post",
            success:function(data) {

                console.log(data.sqname + data.sqid + data.sqzt + data.sqje + data.sqly)
                $("#s1").val(data.sqname);
                $("#s2").val(data.sqid);
                $("#s3").val(data.sqzt);
                $("#s4").val(data.sqje);
                $("#s5").val(data.sqly);
                $("#aa").val(data.sqpz);
                $("#a2").val(data.id);
                var img1="${path}/jds/imgs/"+$("#aa").val();
                $("#a1").attr('src',img1);

                console.log(img1)

            }
        });
    };
    $().ready(function(){
        $("#updateBtn").click(function(){

            var targetUrl = $("#addForm").attr("action");
            var data = new FormData($( "#addForm" )[0]);
            alert(targetUrl)
            $.ajax({
                type:'post',
                url:targetUrl,
                cache: false,    //上传文件不需缓存
                processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
                contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
                data:data,
                dataType:'json',
                success:function(data){
                    addForm(data.message);

                }
            });

        });
        function addForm(imgName){

            $.ajax({
                url:"${path}/updateS",
                data:{
                    "id":$("#a2").val(),
                    "sqname":$("#s1").val(),
                    "sqid":$("#s2").val(),
                    "sqje":$("#s4").val(),
                    "sqpz":imgName,
                    "sqly":$("#s5").val(),
                    "sqzt":$("#s3").val(),
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data>0){
                        window.location.reload();

                   }
                }
            });
        }
    });
    function bb(id) {
        $.ajax({
            url:"${path}/deleteS",
            data:{"id":id,
            },
            dataType:"json",
            type:"post",
            success:function(data) {
                if(data>0){
                    window.location.reload();

                }
            }
        });
    };
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }

    var myDate = new Date();
    //获取当前年
    var year=myDate.getFullYear();
    //获取当前月
    var month=myDate.getMonth()+1;
    //获取当前日
    var date=myDate.getDate();
    var h=myDate.getHours();       //获取当前小时数(0-23)
    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    var s=myDate.getSeconds();     //获取当前秒钟数(0-59)

    var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
    $().ready(function(){
        $("#addBtn1").click(function(){

            var targetUrl = $("#addForm1").attr("action");
            var data = new FormData($( "#addForm1" )[0]);
            alert(targetUrl)
            $.ajax({
                type:'post',
                url:targetUrl,
                cache: false,    //上传文件不需缓存
                processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
                contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
                data:data,
                dataType:'json',
                success:function(data){
                    addForm(data.message);

                }
            });

        });
        function addForm(imgName){

            $.ajax({
                url:"${path}/insertS",
                data:{
                    "sqname":$("#ygxm").val(),
                    "sqid":$("#ygid").val(),
                    "sqje":$("#sqje").val(),
                    "sqpz":imgName,
                    "sqly":$("#sqly").val(),
                    "sqzt":$("#sqzt").val(),
                    "sqdata":now,
                    "sqr":1
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data>0){
                        window.location.reload();

                    }

                }
            });
        }
    });
    function cc(id) {
        $.ajax({
            url:"${path}/updateSa",
            data:{
                "id":id,
                "state":1
            },
            dataType:"json",
            type:"post",
            success:function(data){
                if(data>0){
                    window.location.reload();

                }

            }
        });
    }
    function ee(id) {
        $.ajax({
            url:"${path}/selectSid",
            data:{"id":id,
            },
            dataType:"json",
            type:"post",
            success:function(data) {

                console.log(data.sqname + data.sqid + data.sqzt + data.sqje + data.sqly)
                $("#s11").val(data.sqname);
                $("#s21").val(data.sqid);
                $("#s31").val(data.sqzt);
                $("#s41").val(data.sqje);
                $("#s51").val(data.sqly);
                $("#aa1").val(data.sqpz);
                $("#a21").val(data.id);
                var img1="${path}/jds/imgs/"+$("#aa1").val();
                $("#a11").attr('src',img1);

                console.log(img1)

            }
        });

    };
    function dd(id) {
        $.ajax({
            url:"${path}/selectSy",
            data:{"id":id,},
            dataType:"json",
            type:"post",
            success:function(data){
                    $("#bz1").val(data.bz);

            }
        });
    }
</script>

</html>

