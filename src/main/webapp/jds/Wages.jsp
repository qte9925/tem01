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
    <script src="https://cdn.staticfile.org/vue/2.4.2/vue.min.js"></script>
    <script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
    <script src="${path}/jds/laydate/laydate.js"></script>
</head>


<body>
<center><h1>工资核算</h1></center>
<div>

    <table class="table table-bordered">
        <tr>
             <td>
                 员工工号：
             </td>
              <td>
                  <input type="text" id="ygid">
              </td>
            <td>
                早退次数：
            </td>
            <td>
                <input type="text" id="ztcs">
            </td>
         </tr>
        <tr>
            <td>
                员工姓名：
            </td>
            <td>
                <input type="text" id="ygxm">
            </td>
            <td>
                请假次数：
            </td>
            <td>
                <input type="text" id="qjcs">
            </td>
        </tr>
        <tr>
            <td>
                入职日期：
            </td>
            <td>
                <input type="text" id="rzrq">
            </td>
            <td>
               加班次数：
            </td>
            <td>
                <input type="text" id="jbcs">
            </td>
        </tr>
        <tr>
            <td>
                员工类别：
            </td>
            <td>
                <input type="text" id="yglb">
            </td>
            <td>
                本月打卡次数：
            </td>
            <td>
                <input type="text" id="bydkcs">
            </td>
        </tr>
        <tr>
            <td>
                基本工资：
            </td>
            <td>
                <input type="text" id="jbgz">
            </td>
            <td>
                失业保险：
            </td>
            <td>
                <input type="text" id="sybx">
            </td>
        </tr>
        <tr>
            <td>
                基本绩效工资：
            </td>
            <td>
                <input type="text" id="jbjx">
            </td>
            <td>
                养老保险：
            </td>
            <td>
                <input type="text" id="yalbx">
            </td>
        </tr>
        <tr>
            <td>
                绩效点：
            </td>
            <td>
                <input type="text" id="jxd">
            </td>
            <td>
                医疗保险：
            </td>
            <td>
                <input type="text" id="ylbx">
            </td>
        </tr>
        <tr>
            <td>
                实际绩效工资：
            </td>
            <td>
                <input type="text" id="sjjx">
            </td>
            <td>
                奖金：
            </td>
            <td>
                <input type="text" id="jj">
            </td>

        </tr>
       <tr>
           <td>
               迟到次数：
           </td>
           <td>
               <input type="text" id="cdcs">
           </td>
           <td>
              税前工资：
           </td>
           <td>
               <input type="text" id="sqgz">
           </td>
        </tr>
       <tr>
           <td>
               日期：
           </td>
           <td>
               <input type="text" id="rq">
           </td>
            <td>
                应缴个人所得税：
            </td>
            <td>
                <input type="text" id="grsds">
            </td>


        </tr>


    </table>
    <center>
        <h4>
    <tr>
        <td>实发工资:</td>
        <td><input type="text" id="sfgz"></td>
    </tr>
        </h4>
        <tr>
            <td>
                <input type="button" id="insert" class="btn btn-primary" value="生成工资单">
            </td>
        </tr>
    </center>
</div>
<%--<div id="box">
    <input type="button" @click="get()" value="点我异步获取数据(Get)">
</div>--%>
<div style="display:none;">
    <input type="text" id="bx1">
    <input type="text" id="bx2">
    <input type="text" id="bx3">
</div>
</body>

<script !src="text/javascript">

    $("#ygid").blur(function(){

        $.ajax({
            url:"${path}/selectWByid",
            data:{"id":$("#ygid").val(),
            },
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data);
                $("#jbgz").val(data.jbgz);
                $("#jbjx").val(data.jxgz);
                $("#ygxm").val(data.ryxm);
                $("#yglb").val(data.rylxid);
                $("#cdcs").val(data.rep_late_fre);
                $("#ztcs").val(data.rep_retreat_fre);
                $("#qjcs").val(data.rep_bsen_time);
                $("#jbcs").val(data.rep_service);
                $("#bydkcs").val(data.rep_Sign_fre);
                $("#jxd").val(data.tb_task_achieve);
                $("#jj").val(data.jjsl);
                var jx=$("#jbjx").val();
                var jxd=$("#jxd").val();
                var sjx=(jx*jxd);
                $("#sjjx").val(sjx);
                var bx1=$("#bx1").val()*$("#jbgz").val();
                var bx2=$("#bx2").val()*$("#jbgz").val();
                var bx3=$("#bx3").val()*$("#jbgz").val();
                $("#sybx").val(bx1);
                $("#yalbx").val(bx2);
                $("#ylbx").val(bx3)
                var jb=$("#jbgz").val();
                var sy=$("#sybx").val();
                var ya=$("#yalbx").val();
                var yl=$("#ylbx").val();
                var cd=$("#cdcs").val();
                var zt=$("#ztcs").val();
                var qj=$("#qjcs").val();
                var jb1=$("#jbcs").val();11122[]
                var jl=$("#jj").val();
                var by=$("#bydkcs").val();
                var sq=Number(jb)/22*Number(by)+Number(sjx)-Number(sy)-Number(ya)-Number(yl)-Number(cd)*50-Number(zt)*50-Number(qj)*100+Number(jb1)*150;

                $("#sqgz").val(sq);
                var sfgz1;



                var ks=0;
                var sq1=(sq-5000);
                if(sq1<0){

                    $("#grsds").val(ks)

                }else if(3000>=sq1){
                    ks=(sq1*0.03-0);
                    $("#grsds").val(ks);
                }else if(12000>=sq1){
                    ks=(sq1*0.1-210);
                    $("#grsds").val(ks);
                }else if(25000>=sq1){
                    ks=(sq1*0.2-1410);
                    $("#grsds").val(ks);
                }else if(35000>=sq1){
                    ks=(sq1*0.25-2660);
                    $("#grsds").val(ks);
                }else if(55000>=sq1){
                    ks=(sq1*0.3-4410);
                    $("#grsds").val(ks);
                }else if(80000>=sq1){
                    ks=(sq1*0.35-7160);
                    $("#grsds").val(ks);
                }else
                    ks=(sq1*0.4-15160);
                    $("#grsds").val(ks);
                console.log(ks+"aaa");
                if(ks==null){ sfgz1=Number(sq)+Number(jl);}else { sfgz1=Number(sq)+Number(jl)-Number(ks)}

                $("#sfgz").val(sfgz1);
            }
        });

    });

    $().ready(function () {
        $.ajax({
            url:"${path}/selectBx",
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data);
                for(var i=0;i<data.length;i++){
                    $("#bx1").val(data[i].Unemployments);
                    $("#bx2").val(data[i].Pensions);
                    $("#bx3").val(data[i].Medicals);
                }
            }
        });
    });

    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#rq' //指定元素
    });
    /*ygid,ygname,yglb,jbgz,jxgz,jxd,jxgz1,cdcs,ztcs,qjcs,jbcs,bydk,sybx,yabx,ylbx,jj,sqgz,grsds,sfgz,bz,state*/
    $("#insert").click(function(){
        alert($("#ygid").val())
       /* $.ajax({
            url:"/selectGz",
            data:{"ygid":$("#ygid").val(),"ygname":,"yglb":,"jbgz":,"jxgz":,
                "jxd":,"jxgz1":,"cdcs":,"ztcs":,"qjcs":,"jbcs":,
                "bydk":,"sybx":,"yabx":,"ylbx":,"jj":,"sqgz":,
                "grsds":,"sfgz":,"bz":
            },
            dataType:"json",
            type:"post",
            success:function(data){
                console.log(data);

            }
        });*/
    })

</script>
</html>
<%--
 如果员工在实习期的话没有绩效工资，转正后才会有绩效工资
 员工辞职时结算本月工资，按天算
--%>
