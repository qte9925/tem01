<%--
  Created by IntelliJ IDEA.
  User: LIUXIN
  Date: 2018/10/18
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <title>jQuery Tags Input Plugin Demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/js/jquery-tagsinput.min.css" />

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/color/jquery.color.plus-names-2.1.2.min.js" integrity="sha256-Wp3wC/dKYQ/dCOUD7VUXXp4neLI5t0uUEF1pg0dFnAE=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" defer></script>
    <script src="${path}/js/jquery-tagsinput.min.js" defer></script>
</head>
<body style="background-color: #ccc; margin: 0;">
<div class="container">
    <div class="row">
        <div  class="col-sm-12">
            <div class="form-group">
                <label>Edit mode</label>
                <input data-role='tags-input' value="First;Second;Third;"/>
            </div>
            <div class="form-group">
                <label>Read Only mode</label>
                <input data-role='tags-input' value="First;Second;Third;" disabled />
            </div>

        </div>
    </div>
</div>



<table class="table">
    <caption>基本的表格布局</caption>
    <thead>
    <tr>
        <th>名称</th>
        <th>城市</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Tanmay</td>
        <td>Bangalore</td>
    </tr>
    <tr>
        <td>Sachin</td>
        <td>Mumbai</td>
    </tr>
    </tbody>
</table>
</body>
<script>
    $(document).ready(function() {
        $('[data-role="tags-input"]').tagsInput();
    });
</script>
</html>

