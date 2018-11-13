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
</head>
<body>
<div style="text-align:center;">
    <table class="table table-bordered">
        <tr id="jz">
            <td>序号</td>
            <td>姓名</td>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>养老保险</td>
            <td>失业保险</td>
            <td>医疗保险</td>
            <td>工伤保险</td>
            <td>生育保险</td>
            <td>住房公积金</td>
            <td>迟到</td>
            <td>病假</td>
            <td>事假</td>
            <td>早退</td>
            <td>旷工</td>
            <td>加班</td>
            <td>缴税</td>
            <td>补发</td>
            <td>奖金</td>
            <td>实际工资</td>
            <td>操作</td>
        </tr>
        <tbody id="tbody" ></tbody>
    </table>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改员工工资
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>基本工资:<input type="text" id="jbgz"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>绩效工资:<input type="text" id="jxgz"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>养老保险:<input type="text" id="yanglao"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>失业保险:<input type="text" id="shiye"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>医疗保险:<input type="text" id="yiliao"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>工伤保险:<input type="text" id="gongshang"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>生育保险:<input type="text" id="shengyu"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>公&nbsp;&nbsp;积&nbsp;&nbsp;金:<input type="text" id="gongjijin"  disabled="disabled" ></td>
                            </tr>
                            <tr>
                                <td>迟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到:<input type="text" id="chidao"></td>
                            </tr>
                            <tr>
                                <td>病&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假:<input type="text" id="bingjia"></td>
                            </tr>
                            <tr>
                                <td>事&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假:<input type="text" id="shijia"></td>
                            </tr>
                            <tr>
                                <td>早&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退:<input type="text" id="zaotui"></td>
                            </tr>
                            <tr>
                                <td>旷&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工:<input type="text" id="kuanggong"></td>
                            </tr>
                            <tr>
                                <td>加&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班:<input type="text" id="jiaban"></td>
                            </tr>
                            <tr>
                                <td>缴&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;税:<input type="text" id="jiaoshui"></td>
                            </tr>
                            <tr>
                                <td>实际工资:<input type="text" id="shijigongzi"></td>
                            </tr>
                            <tr>
                                <td>实际工资:<input type="text" id="id"></td>
                            </tr>
                            <tr>
                                <td>za:<input type="text" id="zz"  ></td>
                            </tr>
                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="update">
                    修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabela">
                    工资补发
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <center>
                        <table>
                            <tr>
                                <td>员工id:<input type="text" id="id1" ></td>
                            </tr>
                            <tr>
                                <td>补发工资:<input type="text" id="bf"  ></td>
                            </tr>

                        </table>
                    </center>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updatebf">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<center>
    <input type="button" value="保存" class="btn btn-primary" id="eidBtn">
</center>
</body>

<script !src="text/javascript">

       $().ready(function () {
           ${param.id}
           $.ajax({
               url:"${path}/selectGza",
               data:{"id":${param.id}},
               dataType:"json",
               type:"post",
               success:function(data){
                   console.log(data)
                   $("#tbody").html('');
                   if(data!=null){
                       for(var i=0;i<data.length;i++){
                           var st=data[i];
                           var tr="<tr>";
                           tr=tr+"   <td>"+(i+1)+"</td>";
                           tr=tr+"   <td>"+st.xm+"</td>";
                           tr=tr+"    <td>"+st.xz+"</td>";
                           tr=tr+"    <td>"+st.jx+"</td>";
                           tr=tr+"    <td>"+st.yanglaobx+"</td>";
                           tr=tr+"    <td>"+st.shiyebx+"</td>";
                           tr=tr+"    <td>"+st.yiliaobx+"</td>";
                           tr=tr+"    <td>"+st.gsbx+"</td>";
                           tr=tr+"    <td>"+st.sybx+"</td>";
                           tr=tr+"    <td>"+st.zfgjj+"</td>";
                           tr=tr+"    <td>"+st.cd+"</td>";
                           tr=tr+"    <td>"+st.bingjia+"</td>";
                           tr=tr+"    <td>"+st.shijia+"</td>";
                           tr=tr+"    <td>"+st.zt+"</td>";
                           tr=tr+"    <td>"+st.kg+"</td>";
                           tr=tr+"    <td>"+st.jiaban+"</td>";
                           tr=tr+"    <td>"+st.js+"</td>";
                           tr=tr+"    <td>"+st.bf+"</td>";
                           tr=tr+"    <td>"+st.jj+"</td>";
                           tr=tr+"    <td>"+st.sjgz+"</td>";
                           tr=tr+"    <td><input type=\"button\" value='修改' onclick='cc("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\"/>";
                           tr=tr+"    <input type=\"button\" value='补发' onclick='bb("+st.id+")' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModala\"/></td>";
                           $("#tbody").append(tr);
                       }
                   }
               }
           });
       })
function cc(id){
    $.ajax({
        url:"${path}/selectGzId",
        data:{"id":id,},
        dataType:"json",
        type:"post",
        success:function(data){
            $("#id").val(data.id);
            $("#jbgz").val(data.xz);
            $("#jxgz").val(data.jx);
            $("#yanglao").val(data.yanglaobx);
            $("#shiye").val(data.shiyebx);
            $("#yiliao").val(data.yiliaobx);
            $("#shengyu").val(data.sybx);
            $("#gongshang").val(data.gsbx);
            $("#chidao").val(data.cd);
            $("#bingjia").val(data.bingjia);
            $("#shijia").val(data.shijia)
            $("#zaotui").val(data.zt);
            $("#gongjijin").val(data.zfgjj);
            $("#kuanggong").val(data.kg);
            $("#jiaoshui").val(data.js);
            $("#shijigongzi").val(data.sjgz);
            $("#zz").val(data.zz);
            $("#jiaban").val(data.jiaban);

           /* $("#bufa").val(data.bf);*/
        }
    })
}
$("#update").click(function () {

    var xz=$("#jbgz").val();
    var jx=$("#jxgz").val();
    var yanglao1=$("#yanglao").val();
    var shiye1=$("#shiye").val();
    var yiliao1=$("#yiliao").val();
    var gongshang1=$("#gongshang").val();
    var shengyu1=$("#shengyu").val();
    var gongjijin1=$("#gongjijin").val();
    var cd1=$("#chidao").val();
    var bj1=$("#bingjia").val();
    var sj1=$("#shijia").val();
    var zt1=$("#zaotui").val();
    var kg1=$("#kuanggong").val();
    var zz1=$("#zz").val();
    var jb1=$("#jiaban").val();
    var sjgz2=Number(xz)+Number(jx)+Number(jb1)-Number(cd1)-Number(bj1)-Number(sj1)-Number(zt1)-Number(kg1)-
    Number(yanglao1)-Number(shiye1)-Number(yiliao1)-Number(gongshang1)-Number(shengyu1)-Number(gongjijin1)-Number(zz1);
   /* alert(xz+"*"+jx+"*"+yanglao1+"*"+shiye1+"*"+yiliao1+"*"+gongshang1+"*"+shengyu1+"*"+gongjijin1+"*"+cd1+"*"+bj1+"*"+sj1+"*"+zt1+"*"+kg1+"*"+sjgz2)*/
    var jsgz=sjgz2-5000;
    var js1;
    var zhxz;

    if(jsgz<0){
        js1=0;
        zhxz=sjgz2-js1;
    }else if(3000>=jsgz){
        js1=(jsgz*0.03-0);

        zhxz=sjgz2-js1;
    }else if(12000>=jsgz){
        js1=(jsgz*0.1-210);

        zhxz=sjgz2-js1;
    }else if(25000>=jsgz){
        js1=(jsgz*0.2-1410);
        zhxz=sjgz2-js1;
    }else if(35000>=jsgz){
        js1=(jsgz*0.25-2660);
        zhxz=sjgz2-js1;
    }else if(55000>=jsgz){
        js1=(jsgz*0.3-4410);
        zhxz=sjgz2-js1;
    }else if(80000>=jsgz){
        js1=(jsgz*0.35-7160);
        zhxz=sjgz2-js1;
    }else{
        js1=(jsgz*0.4-15160);
        zhxz=sjgz2-js1;
    }
    $.ajax({
        url:"${path}/updateGz",
        data:{"id": $("#id").val(),
            "cd1":cd1,
            "bj1":bj1,
            "sj1":sj1,
            "zt1": zt1,
            "kg1": kg1,
            "jb1": jb1,
            "js1":js1,
            "zhxz1": zhxz
        },
        dataType:"json",
        type:"post",
        success:function(data) {
            console.log(data)
            if(data>0) {
                window.location.reload();

            }
        }
    })
})
    function bb(id){
        $("#id1").val(id);
        cc(id);
    }
    $("#updatebf").click(function () {
        var id2=$("#id1").val();
        var bf1=$("#bf").val();
        var a =$("#jiaoshui").val();
        var a1=$("#shijigongzi").val();
        var a5=Number(a1)+Number(a)+Number(bf1);
        var a2=a5-5000;
        var a3;
        var a4;
        if(a2<0){
            a3=0;
           a4=a5-a3;
        }else if(3000>=a2){
            a3=(a2*0.03-0);

            a4=a5-a3;
        }else if(12000>=a2){
            a3=(a2*0.1-210);

            a4=a5-a3;
        }else if(25000>=a2){
            a3=(a2*0.2-1410);
            a4=a5-a3;
        }else if(35000>=a2){
            a3=(a2*0.25-2660);
            a4=a5-a3;
        }else if(55000>=a2){
            a3=(a2*0.3-4410);
            a4=a5-a3;
        }else if(80000>=a2){
            a3=(a2*0.35-7160);
            a4=a5-a3;
        }else{
            a3=(a2*0.4-15160);
            a4=a5-a3;
        }
        $.ajax({
            url:"${path}/updateGzb",
            data:{"id": id2,
                "bf":bf1,
                "js":a3,
                "sjgz":a4

            },
            dataType:"json",
            type:"post",
            success:function(data) {
                console.log(data)
                if(data>0) {
                    window.location.reload();

                }
            }
        })
    })
    $("#eidBtn").click(function () {
        window.location.href="${path}/jds/Xzlc.jsp";
    })
</script>

</html>

