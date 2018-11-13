<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script type="text/javascript" src="/js/wangEditor-3.1.1/release/wangEditor.min.js"></script>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/vue.min.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<%--<link href="/js/MyProject-master/css/bootstrap.css" rel="stylesheet" type="text/css" />--%>
<link href="/js/MyProject-master/css/city-picker.css" rel="stylesheet" type="text/css" />
<%--<link href="/js/MyProject-master/css/main.css" rel="stylesheet" type="text/css" />--%>
<%--<script src="/js/MyProject-master/js/jquery.js"></script>--%>
<%--<script src="/js/MyProject-master/js/bootstrap.js"></script>--%>
<script src="/js/MyProject-master/js/city-picker.data.js"></script>
<script src="/js/MyProject-master/js/city-picker.js"></script>
<script src="/js/MyProject-master/js/main.js"></script>

