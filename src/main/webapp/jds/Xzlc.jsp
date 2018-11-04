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

    <title>My JSP 'select.jsp' starting page</title>

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
    <script src="${path}/jds/laydate/laydate.js"></script>

</head>
<body>

<div>
    <table class="table table-bordered">
        <center>
            月份:<input type="text" id="yf">
            <button id="selectBtn" class="btn btn-primary">查询</button>
            <button id="addBtn"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">增加</button>
        </center>
        <tr>
            <td>序号</td>
            <td>流程创建时间</td>
            <td>流程创建人</td>
            <td>起始日期</td>
            <td>结束日期</td>
            <td>工资月份</td>
            <td>备注</td>
            <td>状态</td>
            <td>操    作</td>

        </tr>

        <tbody id="tbody"></tbody>
    </table>
    <center>
    <a id="pre" onclick="fy('pre')">上一页</a>
    <a id="next" onclick="fy('next')">下一页</a>
    当第<span id="nowPage"></span>页
    </center>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    增加薪资结算流程
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>起始日期:<input type="text" id="qs"></td>
                            </tr>
                            <tr>
                                <td>结束日期:<input type="text" id="jz"></td>
                            </tr>
                           <tr>
                                <td>工资月份:<input type="text" id="gzyf"></td>
                            </tr>
                            <tr>
                                <td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:<input type="text" id="bz"></td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="insert">
                    增加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModalb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabela">
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
            url:"${path}/selectX",
            data:{"yf":$("#yf").val(),"nowPage":nowPage},
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
                        tr=tr+"    <td>"+st.lcsj+"</td>";
                        tr=tr+"    <td>"+st.cjname+"</td>";
                        tr=tr+"    <td>"+st.qsrq+"</td>";
                        tr=tr+"    <td>"+st.jzrq+"</td>";
                        tr=tr+"    <td>"+st.gzyf+"</td>";
                        tr=tr+"    <td>"+st.bz+"</td>";
                        if(st.state==0){
                            tr=tr+"    <td>"+"待执行"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='核算' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\" >";
                            tr=tr+"    <input type=\"button\" value='详情' onclick='bb("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/>"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\"/></td>";
                        }
                        if(st.state==1){
                            tr=tr+"    <td>"+"执行中"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='核算' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\" >";
                            tr=tr+"    <input type=\"button\" value='详情' onclick='bb("+st.id+")' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\"/></td>";
                        }
                        if(st.state==2){
                            tr=tr+"    <td>"+"待审核"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='核算' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\" disabled=\"disabled\"/>";
                            tr=tr+"    <input type=\"button\" value='详情' onclick='bb("+st.id+")' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/></td>";
                        }
                        if(st.state==3){
                            tr=tr+"    <td>"+"已审核"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='核算' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\" disabled=\"disabled\"/>";
                            tr=tr+"    <input type=\"button\" value='详情' onclick='bb()' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/></td>";
                        }
                        if(st.state==4){
                            tr=tr+"    <td>"+"已结束"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='核算' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\" disabled=\"disabled\"/>";
                            tr=tr+"    <input type=\"button\" value='详情' onclick='bb("+st.id+")' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" disabled=\"disabled\"/></td>";
                        }
                        if(st.state==5){
                            tr=tr+"    <td>"+"审核未通过"+"</td>";
                            tr=tr+"    <td><input type=\"button\" value='核算' onclick='aa("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\"/>";
                            tr=tr+"    <input type=\"button\" value='详情' onclick='bb("+st.id+")' class=\"btn btn-primary\" />"
                            tr=tr+"    <input type=\"button\" value='送审' onclick='cc("+st.id+")' class=\"btn btn-primary\" />";
                            tr=tr+"    <input type=\"button\" value='原因' onclick='dd("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalb\"/></td>"
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
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#qs' //指定元素
    });
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#jz' //指定元素
    });

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
    $("#insert").click(function(){
        $.ajax({
            url:"${path}/insertX",
            data:{"cjname":"张三",
                  "qsrq":$("#qs").val(),
                  "jzrq":$("#jz").val(),
                  "gzyf":$("#gzyf").val(),
                  "bz":$("#bz").val(),
                  "lcsj":now

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
    function bb() {

        window.location.href = "/jds/gzxq.jsp";
    };
    function cc(id) {
        $.ajax({
            url:"${path}/updateX",
            data:{"id":id,
            },
            dataType:"json",
            type:"post",
            success:function(data){
                if(data>0){
                    window.location.reload();

                }
            }
        });

    };
    function dd(id) {
        $.ajax({
            url:"${path}/selectXb",
            data:{"id":id,},
            dataType:"json",
            type:"post",
            success:function(data){
                for(var i=0;i<data.length;i++) {
                    console.log(data[i].bz1)
                    $("#bz1").val(data[i].bz1);
                }
            }
        });

    };

</script>
</html>

