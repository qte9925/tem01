<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>录入面试结果</title>
</head>
<body >
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    简历详情
                </h4>
            </div>
            <div class="modal-body">
                <table border="1">
                    <tr>
                        <td width="140" height="70;" align="center">应聘人姓名</td>
                        <td width="470" colspan="6" id="jlname">111 </td>
                    </tr>
                    <tr>
                        <td height="70">性别</td>
                        <td colspan="2"  width="180" id="xingbie"> </td>
                        <td colspan="2" width="125">手机号</td>
                        <td colspan="2" width="175" id="shoujihao"> </td>
                    </tr>
                    <tr>
                        <td height="65" >出生日期</td>
                        <td  colspan="6" id="chudate02"> </td>
                    </tr>
                    <tr>
                        <td height="70">户籍</td>
                        <td colspan="2"  width="180" id="huji"> </td>
                        <td colspan="2" width="125">现居地</td>
                        <td colspan="2" width="175" id="xianjudi"> </td>
                    </tr>
                    <tr>
                        <td height="65" >参加工作时间</td>
                        <td  colspan="6" id="canjiadate"> </td>
                    </tr>
                    <tr>
                        <td height="65" >学校名称</td>
                        <td  colspan="6" id="xuexiao"> </td>
                    </tr>
                    <tr>
                        <td height="70">学历</td>
                        <td colspan="2"  width="180" id="xueli"> </td>
                        <td colspan="2" width="125">是否统招</td>
                        <td colspan="2" width="175" id="tongzhao"> </td>
                    </tr>
                    <tr>
                        <td height="60">就读开始时间</td>
                        <td colspan="2" id="jiudukaishi"> </td>
                        <td colspan="2" >就读结束时间</td>
                        <td colspan="2" id="jiudujieshu"> </td>
                    </tr>
                    <tr>
                        <td><h3>工作经验</h3></td>
                    </tr>
                    <tr>
                        <td height="60">公司名称</td>
                        <td colspan="2" id="gongsimingc"> </td>
                        <td colspan="2" >职位名称</td>
                        <td colspan="2" id="zhiweimingcheng"> </td>
                    </tr>
                    <tr>
                        <td height="60">在职开始时间</td>
                        <td colspan="2" id="zhizhikaishi"> </td>
                        <td colspan="2" >在职结束时间</td>
                        <td colspan="2" id="zaizhijieshu"> </td>
                    </tr>
                    <tr>
                        <td height="65" >税前月薪</td>
                        <td  colspan="6" id="suiqianyuexin"> </td>
                    </tr>
                    <tr>
                        <td height="65" >工作描述</td>
                        <td  colspan="6" id="gzms"> </td>
                    </tr>
                    <tr>
                        <td height="65" >期望月薪</td>
                        <td  colspan="6" id="qwyx"> </td>
                    </tr>
                    <tr>
                        <td height="65" >期望工作地点</td>
                        <td  colspan="6" id="qwdd"> </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
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
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>学历</td>
                        <td id="zpsnamejl">
                            <select class="form-control" id="aas">
                                <option value="4">中专</option>
                                <option value="0">大专</option>
                                <option value="1">本科</option>
                                <option value="2">研究生</option>
                                <option value="3">博士</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="cxxxl();">
                筛选
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="huifu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelhuifu">
                    简历回复
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>审批<input type="text" id="aaaa"></td>
                        <td>
                            <select class="form-control" id="ds">
                            <option value="1">预约面试</option>
                            <option value="2">拒绝此人</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div id="editor">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="fwbid">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--//模态框 录入面试结果--%>
<div class="modal fade" id="lr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLalr">
                    面试结果
                </h4>
            </div>
            <div class="modal-body">
                <div id="editor02">
                </div>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>
                            当前是第<span id="djcms">1</span>面试
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select class="form-control" id="msst" >
                                <option value="0">通过面试</option>
                                <option value="1">继续下次面试</option>
                                <option value="2">面试不通过加入人才库</option>
                                <option value="3">面试不通过加入黑名单</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <Td>
                            <input type="text" id="idop" style="display: none;">
                        </Td>
                    </tr>
                    </tbody>
                </table>
                <div >

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="fwbid02">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <label >选择列表</label>
    <select class="form-control" id="ischange">
        <option value="999">请选择</option>
        <option value="1">待面试</option>
        <option value="0">面试通过</option>
        <option value="2">面试不通过拉入人才库</option>
        <option value="3">面试不通过拉入黑名单</option>
    </select>
    <button class="btn btn-default btn-sm"><a href="javascript:jlsx();">简历筛选</a></button>
</form>
<script type="text/javascript">
    //富文本编辑
    var E = window.wangEditor;
    var editor = new E('#editor');
    var editor02 = new E('#editor02');
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create();
    editor02.create();
    document.getElementById('fwbid').addEventListener('click', function () {
        // 读取 html
        var nr=editor.txt.html();
        console.log(nr);
        var id01=editor.txt.html();
        var id02=$("#ds").val();
        var id03=$("#aaaa").val();
        $.ajax({
            url: "${path}/zxiugai0041",
            type: "post",
            data:{"hf":id01,
                "tdstatic":id02,
                "tdid":id03
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data==1){
                    console.log("修改成功");
                    window.location.href="#";
                }else{
                    alert("修改失败");
                }
            }
        });
    });
    //简历筛选
    function jlsx(){
        $('#myModaljl').modal('show');
    }
    //查询当前是第几次面试
    function djcms(id) {
        var asda;
        $.ajax({
            url: "${path}/countwf_ms",
            type: "post",
            data:{"tdid":id
            },
            async : false,//
            dataType: "json",
            success: function (data) {
                console.log(data);
                asda = data[0].cc;
            }
        });
    return asda;
    }
    //修改表添加面试结果
    function updatewf_tdjl01(id,id02) {
        $.ajax({
            url: "${path}/updatewf_tdjl01",
            type: "post",
            data:{"tdid":id,
                "msjd":id02
            },
            dataType: "json",
            success: function (data) {
                console.log("修改表添加面试结果");
                console.log(data);
            }
        });
    }

    //录入面试结果
    function lrmsjg(id){
        $("#idop").val(id);
        $("#djcms").text(djcms(id)+1);
        $('#lr').modal('show');
    }
    document.getElementById('fwbid02').addEventListener('click', function () {
        // 读取 html
        // var nr=editor02.txt.html();
        // console.log(nr);
        var id01=$("#idop").val();
        var id02=editor02.txt.html();
        var id03=$("#msst").val();
        $.ajax({
            url: "${path}/insert_wf_ms",
            type: "post",
            data:{"tdid":id01,
                "msjg":id02,
                "msstatic":id03
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data==1){
                    console.log("增加成功");
                    $('#lr').modal('hide');
                    updatewf_tdjl01(id01,id03);
                    window.location.href="#";
                }else{
                    alert("增加失败");
                }
            }
        });
    });
</script>
<div id="ccc">

<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">招聘需求</caption>
    <%--<button class="btn  btn-xm zpjh01"><a href="zpsinsert.jsp">新建招聘计划</a></button>--%>
    <thead >
    <tr>
        <th>编号</th>
        <th>应聘名称</th>
        <th>应聘职位</th>
        <th>应聘人</th>
        <th>应聘时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="thead01">
    <tr >
        <td>{{index+1}}</td>
        <Td>{{i.zpsname}}</Td>
        <Td>{{i.zhiweimingcheng}}</Td>
        <Td>{{i.jlname}}</Td>
        <Td>{{i.ypsj}}</Td>
        <Td v-if="i.tdstatic==0" style="color: red">处理中</Td>
        <Td v-if="i.tdstatic!=0" style="color: black">已处理</Td>
        <Td>
            <input class="btn btn-primary btn-xm" type="button" onclick="zpxq('{{i.tdid}}');" value="详情">
            <input class="btn btn-primary btn-xm" type="button" onclick="huifu('{{i.tdid}}');" value="回复">
        </Td>
    </tr>
    </tbody>
</table>
</div>
<script type="text/javascript">
    //筛选学历
    function cxxxl(){
        var xueli = $("#aas").val();
        // console.log(tdstatic+","+xueli);
        gg(999,xueli);
        $('#myModaljl').modal('hide');
    }
    //筛选状态
    $("#ischange").change(function() {
        var tdstatic = $("#ischange").val();
        console.log(tdstatic);
        gg(tdstatic);
    });
    function huifu(id) {
        $("#aaaa").val(id);
        $('#huifu').modal('show');
    }
    //送审，修改状态
    function songshen(id01,id02) {
        if(window.confirm('你确定提交吗？')){
        $.ajax({
            url: "${path}/zpsxiugai",
            type: "post",
            data:{"zpsid":id01,
                "skzt":id02
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data==1){
                    window.location.href="zps_shengke.jsp";
                }else{
                    alert("修改失败");
                }
            }
        });
            return true;
        }else{
            console.log("不确定");
            return false;
        }
    }
    function zpjh(id) {
        window.location.href="zpsinsert.jsp?id="+id;
    }
    function zpxq(id){
        //手动打开模态框
        $.ajax({
            url: "${path}/cxtdjl002",
            type: "post",
            data:{"tdid":id},
            dataType: "json",
            success: function (data) {
                console.log(data);
                for(var i=0;i<data.length;i++){
                    var p= data[i];
                    $("#jlname").text(p.jlname);
                    $("#shoujihao").text(p.shoujihao);
                    if(p.xingbie==0){$("#xingbie").text("男");}
                    if(p.xingbie==1){$("#xingbie").text("女");}
                    $("#chudate02").text(p.chudate02);
                    $("#huji").text(p.huji);
                    $("#xianjudi").text(p.xianjudi);
                    $("#xuexiao").text(p.xuexiao);
                    if(p.xueli==0){$("#xueli").text("大专");}
                    if(p.xueli==1){$("#xueli").text("本科");}
                    if(p.xueli==2){$("#xueli").text("硕士");}
                    if(p.xueli==3){$("#xueli").text("博士");}
                    if(p.xueli==4){$("#xueli").text("中专");}
                    if(p.tongzhao==0){$("#tongzhao").text("是");}
                    if(p.tongzhao==1){$("#tongzhao").text("不是");}
                    $("#jiudukaishi").text(p.jiudukaishi);
                    $("#zhizhikaishi").text(p.zhizhikaishi);
                    $("#zaizhijieshu").text(p.zaizhijieshu);
                    $("#suiqianyuexin").text(p.suiqianyuexin);
                    $("#gzms").text(p.gzms);
                    $("#qwyx").text(p.qwyx);
                    $("#qwdd").text(p.qwdd);
                    $("#gongsimingc").text(p.gongsimingc);
                    $("#zhiweimingcheng").text(p.zhiweimingcheng);
                }
            }
        });
        $('#myModal').modal('show');
    }

    function gg(tdstatic,xueli){
        // console.log("xueli"+xueli);
        $.ajax({
            url: "${path}/cxtdjl003",
            type: "post",
            data:{
                "tdstatic":tdstatic,
                "tdid02":xueli
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#thead01").html("");
                for(var d=0;d<data.length;d++){
                    var cc = d+1;
                    var i=data[d];
                    var html ='<tr >';
                    html=html+' <td>'+cc+'</td>';
                    html=html+ '<Td>'+i.zpsname+'</Td>';
                    html=html+' <Td>'+i.zhiweimingcheng+'</Td>';
                    html=html+'<Td>'+i.jlname+'</Td>';
                    html=html+'<Td>'+i.ypsj+'</Td>';
                    if(i.msjg==999){html=html+'<Td  style="color: red">当前还未录入面试结果</Td>';}
                    if(i.msjg==0){html=html+'<Td  style="color: red">面试通过</Td>';}
                    if(i.msjg==1){html=html+'<Td  style="color: red">进行下一次面试</Td>';}
                    if(i.msjg==2){html=html+'<Td  style="color: red">面试不通过拉入人才库</Td>';}
                    if(i.msjg==3){html=html+' <Td style="color: red">面试不通过拉入黑名单</Td>';}
                    html=html+' <Td>';
                    html=html+'   <input class="btn btn-primary btn-xm" type="button" onclick="zpxq('+i.tdid+');" value="详情">';
                    if(i.tdstatic==0){html=html+'  <input class="btn btn-primary btn-xm" type="button" onclick="huifu('+i.tdid+');" value="回复">';}
                    if(i.msjg==1||i.msjg==999){html=html+'  <input class="btn btn-primary btn-xm" type="button" onclick="lrmsjg('+i.tdid+');" value="录入面试结果">';}
                    html=html+'   </Td>';
                    html=html+'    </tr>';
                    $("#thead01").append(html);
                }
            }
        });
    }
    $().ready(function () {
        console.log("1111"+'${sessionScope.list[0]}');
            gg();

    });
</script>
</body>
</html>
