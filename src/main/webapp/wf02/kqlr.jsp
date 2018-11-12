<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>考勤录入</title>
</head>
<body >
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="javascript:gg();">考勤录入</a></button>
</form>
<table>
    <tr>
        <td><input type="file" id="upload" name="upload" value="" /></td>
        <td><button onclick="uploadFile()">上传</button></td>
    </tr>
</table>

<script type="text/javascript">
    function uploadFile() {
        var file = $("#upload").val();
        file = file.substring(file.lastIndexOf('.'), file.length);
        if (file == '') {
            alert("上传文件不能为空！");
        } else if (file != '.xlsx' && file != '.xls') {
            alert("请选择正确的excel类型文件！");
        } else {
            ajaxFileUpload();
        }
    }
    function ajaxFileUpload() {

        var formData = new FormData();
        var name = $("#upload").val();
        formData.append("file", $("#upload")[0].files[0]);
        formData.append("name", name);
        $.ajax({
            url : "../InputExcel.do",
            type : "POST",
            async : false,
            data : formData,
            processData : false,
            contentType : false,
            beforeSend : function() {
                console.log("正在进行，请稍候");
            },
            success : function(e) {
                if (e == "01") {
                    alert("导入成功");
                } else {
                    alert("导入失败");
                }
            }
        });
    }

</script>


</body>
</html>
