<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>新增合同信息</title>
</head>
<body>

<form class="form-inline" role="form" style="margin-top: 30px;">
    <div class="page-header">
        <h1>新建合同信息
            <small>说明：</small>
        </h1>
    </div>
    <p>1、合同试用日期应小于合同终止日期；2、合同解除日期应大于合同终止日期；3、合同续签日期应大于合同终止日期。</p>
</form>

<div class="panel panel-default" style="margin-top: 20px;">
    <div class="panel-heading">
        <h3 class="panel-title">新增合同信息</h3>
    </div>
    <div class="panel-body">

        <form class="form-horizontal" role="form">
                <table class="table table-condensed">
                <tbody>
                <tr>
                    <td>
                        <label  class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control"
                               placeholder="请输入昵称">

                        </div>
                    </td>
                    <td>
                        <label  class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control"
                               placeholder="请输入昵称">

                        </div>
                    </td>
                </tr>
                <tr><td>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default">添加</button>
                        </div>
                    </div>
                </td>

                </tr>
                </tbody>
            </table>


        </form>
    </div>
</div>
</body>
</html>
