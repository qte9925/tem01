<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>角色与权限管理(添加或删除)</title>
    <link rel="stylesheet" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/config.js" ></script>
    <script type="text/javascript">
        var ddcc = [];
        function anniu01() {
            var tblEle = document.getElementsByClassName("f-iconRadioTrue");
            for(var i=0;i<tblEle.length;i++){
                console.log(tblEle[i].id);
            }
        }
        function cxjsqx01(id01){

            return ddcc;
        }


//删除
        $("#myButton").click(function() {
            $.ajax({
                url:'${path}/deleteFunctionByPostId',
                data:{"jsqxid":jsqxid},
                dataType:"json",
                type:'post',
                success:function(data){
                    if(data.state){
                        insertFunctionToPost();
                    }else{
                        alert(data.message);
                    }
                }
            });
        });

//删除后增加
        function insertFunctionToPost(){
            onCheckNode(jsqxid);
            $.ajax({
                url:'${path}/insertFunctionToPost',
                data:JSON.stringify(chkNodeStr),
                dataType:"json",
                contentType:'application/json',
                type:'post',
                success:function(data){
                    if(data.state){
                        alert(data.message);
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        //刷新父页面
                        window.parent.location.reload();
                    }else{
                        alert(data.message);
                    }

                }
            });
        }
    </script>
</head>
<body >
<center><h2>角色与权限管理</h2></center>
<form class="form-inline" role="form" id="name01" style="margin: 20px 0px 20px 20%;padding-left: 20px;">
    <input class="btn btn-bl" type="button" name="check" id="myButton" onclick="anniu01();" value="确定" />
</form>
<div class="f-tree" style="margin:0px 0px 0px 10%;"></div>
</body>
<!--数据封装在这里-->
<script type="text/javascript">

    $(document).ready(function () {
        function conaa(treeData,dd){
            config.tree({
                type:1,//1有选择框，没有则不传type或传0
                wrapper:'.f-tree',//容器
                data:treeData,//数据
                check:dd//选中的数据，可以不传
            });
        };
        ajax7 =$.ajax({
            url: "${path}/cxjsqx01",
            type: "post",
            data:{"id":'${param.id}'},
            // sync:false,
            dataType: "json",
            success: function (data) {
                console.log(data);
                ddcc=[];
                for(var i=0;i<data.length;i++){
                    var c = data[i].qxid;
                    ddcc.push(c);
                }
                // console.log(ddcc);
            }
        });
        $.when(ajax7).done(function () {
            $.ajax({
                url: "${path}/cxqxb",
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var treeData = [];
                    for (var i=0;i<data.length;i++){
                        var q = data[i];
                        if (q.qxdengji==0){
                            treeData.push({id:q.qxid,title:""+q.qxname+"",pid:0});
                        }
                        if(q.qxdengji!=0){
                            treeData.push({id:q.qxid,title:""+q.qxname+"",pid:q.qxdengji});
                        }
                    }
                    if('${param.id}'!=null){
                        var id01 = '${param.id}';
                        console.log("ddcc:"+ddcc);
                        // conaa(treeData,cxjsqx01(id01));
                        conaa(treeData,ddcc);
                    }
                }
            });
        });
    });
</script>
</html>
