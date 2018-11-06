<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>办公用品申领</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<script>
function   ante(json){
$.ajax({
url:"${path}/select",
data:json,
dataType:"json",
type:"post",
success:function(data){
$("#sl").html("");
if(data!=null){
var  tr=null;
for(var i=0;i<data.length;i++){
var  da=data[i];
tr +="<tr>";
    tr +="<td><font size=4>"+da.type_id+"</font></td>" ;
    tr +="<td><font size=4>"+da.Stock+"</font></td>";
    tr +="<td><font size=4>"+da.category+"</font></td>";
    tr +="<td><font size=4>"+da.type_name+"</font></td>";
    tr +="<td><font size=4>"+da.price+"</font></td>";
    tr +="<td><font size=4>"+da.number+"</font></td>";
    tr +="<td><font size=4>"+da.shenpi_name+"</font></td>";
    tr +="<td><font size=4>"+da.bemarks+"</font></td>";
   tr +="<td><input type='button'class=\"btn btn-info\" data-toggle=\"modal\" data-target=\"#myModal2\" onclick='updateA("+da.type_id+")' value='修改'/>" +
        "&nbsp;&nbsp;<input type='button'class=\"btn btn-warning\" onclick='deleteA("+da.type_id+")' value='删除'/><td/>";
    tr +="</tr>";
}
$("#sl").append(tr);
}
}
})
}

$(document).ready(function(){
ante();


})
function insert(){
    $.ajax({
        url:"${path}/insert",
        data:{
            "Stock":$("#Stock").val(),
            "category":$("#category").val(),
            "type_name":$("#type_name").val(),
            "price":$("#price").val(),
            "number":$("#number").val(),
            "shenpi_name":$("#shenpi_name").val(),
            "bemarks":$("#bemarks").val()
        },
        dataType:"json",
        type:"post",
        success:function(data){
            window.location.href = "${path}/fzl/sl.jsp";
        }
    });
}
function deleteA(type_id){
    $.ajax({
        url:"/deleteA",
        data:{"type_id":type_id},
        dataType:"json",
        type:"post",
        success:function(data){
            window.location.href = "${path}/fzl/sl.jsp";
        }
    });
}
function  selectA(type_id){

    $.ajax({
        url:"${path}/selectA",
        data:{"type_id":type_id},
        dataType:"json",
        type:"post",
        ansy:false,
        success:function(data){
            if(data!=null){
                $("#type_id").val(data.type_id);
                $("#Stock2").val(data.Stock);
                $("#category2").val(data.category);
                $("#type_name2").val(data.type_name);
                $("#price2").val(data.price);
                $("#number2").val(data.number);
                $("#shenpi_name2").val(data.shenpi_name);
                $("#bemarks2").val(data.bemarks);
            }
        }
    })


}
function updateA(){
    $.ajax({
        url:'${path}/updateA',
        data:{
            "type_id":$("#type_id").val(),
            "Stock2":$("#Stock2").val(),
            "category2":$("#category2").val(),
            "type_name2":$("#type_name2").val(),
            "price2":$("#price2").val(),
            "number2":$("#number2").val(),
            "shenpi_name2":$("#shenpi_name2").val(),
            "bemarks2":$("#bemarks2").val()
        },
        dataType:"json",
        type:"post",
        success:function(data){
            window.location.href = "${path}/fzl/sl.jsp";
        }
    });
}
</script>
<body>
<table class="table">
    <caption>办公用品申领</caption>
    <thead>
    <tr>
        <th>登记类型</th>
        <th>办公用品库</th>
        <th>办公用品类别</th>
        <th>办公用品</th>
        <th>单价</th>
        <th>申请数量</th>
        <th> 部门审批人</th>
        <th>备注</th>
    </tr>
    </thead>
    <tbody id="sl">

    </tbody>

</table>
<button type="submit" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添加</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    申领单
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="Stock">办公用品库</label>
                    <form role="form">
                        <div class="form-group">
                            <select id="Stock"class="form-control">
                                <option>电脑数码</option>
                                <option>办公消耗品</option>
                                <option>办公设备</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="form-group">
                    <label for="category">办公用品类别</label>
                    <form role="form">
                        <div class="form-group">
                            <select id="category"class="form-control">
                                <option>电脑数码</option>
                                <option>办公消耗品</option>
                                <option>办公设备</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="form-group">
                    <label for="type_name">办公用品</label>
                    <input type="text" class="form-control" id="type_name" >
                </div>
                <div class="form-group">
                    <label for="price">单价</label>

                    <input type="text" class="form-control" id="price" >
                </div>
                <div class="form-group">
                    <label for="number">申请数量</label>
                    <input type="text" class="form-control" id="number" >
                </div>
                <div class="form-group">
                    <label for="shenpi_name">部门审批人</label>
                    <input type="text" class="form-control" id="shenpi_name" >
                </div>
                <div class="form-group">
                    <label for="bemarks">备注</label>
                    <input type="text" class="form-control" id="bemarks" >
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary"onclick='insert()'>添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">修改申领单</h4>
            </div>
            <div class="form-group">
                <label for="Stock2">办公用品库</label>
                <form role="form">
                    <div class="form-group">
                        <select id="Stock2"class="form-control">
                            <option>电脑数码</option>
                            <option>办公消耗品</option>
                            <option>办公设备</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="form-group">
                <label for="category2">办公用品类别</label>
                <form role="form">
                    <div class="form-group">
                        <select id="category2"class="form-control">
                            <option>电脑数码</option>
                            <option>办公消耗品</option>
                            <option>办公设备</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="form-group">
                <label for="type_name2">办公用品</label>
                <input type="text" class="form-control" id="type_name2" >
            </div>
            <div class="form-group">
                <label for="price2">单价</label>
                <input type="text" class="form-control" id="price2" >
            </div>
            <div class="form-group">
                <label for="number2">申请数量</label>
                <input type="text" class="form-control" id="number2" >
            </div>
            <div class="form-group">
                <label for="shenpi_name2">部门审批人</label>
                <input type="text" class="form-control" id="shenpi_name2" >
            </div>
            <div class="form-group">
                <label for="bemarks2">备注</label>
                <input type="text" class="form-control" id="bemarks2" >
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
