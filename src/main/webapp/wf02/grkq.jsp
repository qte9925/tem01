<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../gy.jsp" %>
<html>
<head>
    <title>个人考勤</title>
    <style>
        .div01{
            display: table-cell;
            width: 200px;
            background-color: #efefef;
            font-size:18px;
            height: 60px;
            line-height:60px;
            text-align:center;
            border: 1px solid saddlebrown;
            position: relative;
            left: 20px;
            top: 0px;
        }
        .div02{
            text-align:center;
            border: 1px solid saddlebrown;
            height: 180px;
            /*line-height:200px;*/
            width: 200px;
            display: table-cell;
            position: relative;
            left: 20px;
            top: 80px;
        }
        .div02 span{
            font-size:10px;
        }
    </style>
</head>
<script type="text/javascript">
    function sg() {
        $.ajax({
        url: "${path}/gzrl",
        type: "post",
        // data:{"id":date.getMonth()+1},
        data:{"id":$("#gs").val()},
        dataType: "json",
        success: function (data) {
        // console.log(data);
        $("#opp01").html("");var a = 0;var b= 7;var c = 13;var d = 19;var e = 25;var f = 31;
        for (var i = 0; i < data.length; i++) {
            var p = data[i];
                var html = '<DIV style="position: absolute;" >' +
                    '<DIV class="div01" >'+data[0].WEEK_DESC+'</DIV>' +
                    '<DIV class="div01" >'+data[1].WEEK_DESC+'</DIV>' +
                    '<DIV class="div01" >'+data[2].WEEK_DESC+'</DIV>' +
                    '<DIV class="div01" >'+data[3].WEEK_DESC+'</DIV>' +
                    ' <DIV class="div01">'+data[4].WEEK_DESC+'</DIV>' +
                    '<DIV class="div01" >'+data[5].WEEK_DESC+'</DIV>' +
                    '<DIV class="div01" >'+data[6].WEEK_DESC+'</DIV>' +
                    '</DIV>' ;
                for(c01=0;c01<5;c01++){
                     html=html+'<DIV >' ;
                     for(c02=0;c02<7;c02++){
                         if(c01==0){
                             html=html+'<DIV class="div02"   ><span>'+data[c02+a].DAY_LONG_DESC+'</span>';
                             if(data[c02+a].sfgz==0){
                                 html=html+'<span style="margin-top: -30px;" >工作日</span>';
                             }
                             if(data[c02+a].sfgz==1){
                                 html=html+'<span >非工作日</span>';
                             }
                             if(data[c02+a].gzsjid==1){
                                 html=html+'<span>上午工作时间：'+data[c02+a].swsbsj+' -- '+data[c02+a].swxbsj+'下午工作时间：'+data[c02+a].xwsbsj+' -- '+data[c02+a].xwxbsj+'</span>';
                             }
                             if(data[c02+a].gzsjid==2){
                                 html=html+'<span >上午工作时间：'+data[c02+a].swsbsj+' -- '+data[c02+a].swxbsj+'下午工作时间：'+data[c02+a].xwsbsj+' -- '+data[c02+a].xwxbsj+'</span>';
                             }
                             html=html+'</DIV>' ;
                         }
                         if(c01==1){
                             html=html+'<DIV class="div02"   ><span>'+data[c02+b].DAY_LONG_DESC+'</span>';
                             if(data[c02+b].sfgz==0){
                                 html=html+'<span style="margin-top: -30px;" >工作日</span>';
                             }
                             if(data[c02+b].sfgz==1){
                                 html=html+'<span >非工作日</span>';
                             }
                             if(data[c02+b].gzsjid==1){
                                 html=html+'<span>上午工作时间：'+data[c02+b].swsbsj+' -- '+data[c02+b].swxbsj+'下午工作时间：'+data[c02+b].xwsbsj+' -- '+data[c02+b].xwxbsj+'</span>';
                             }
                             if(data[c02+b].gzsjid==2){
                                 html=html+'<span >上午工作时间：'+data[c02+b].swsbsj+' -- '+data[c02+b].swxbsj+'下午工作时间：'+data[c02+b].xwsbsj+' -- '+data[c02+b].xwxbsj+'</span>';
                             }
                             html=html+'</DIV>' ;
                         }
                         if(c01==2){
                             html=html+'<DIV class="div02"   ><span>'+data[c02+c].DAY_LONG_DESC+'</span>';
                             if(data[c02+c].sfgz==0){
                                 html=html+'<span style="margin-top: -30px;" >工作日</span>';
                             }
                             if(data[c02+c].sfgz==1){
                                 html=html+'<span >非工作日</span>';
                             }
                             if(data[c02+c].gzsjid==1){
                                 html=html+'<span>上午工作时间：'+data[c02+c].swsbsj+' -- '+data[c02+c].swxbsj+'下午工作时间：'+data[c02+c].xwsbsj+' -- '+data[c02+c].xwxbsj+'</span>';
                             }
                             if(data[c02+c].gzsjid==2){
                                 html=html+'<span >上午工作时间：'+data[c02+c].swsbsj+' -- '+data[c02+c].swxbsj+'下午工作时间：'+data[c02+c].xwsbsj+' -- '+data[c02+c].xwxbsj+'</span>';
                             }
                             html=html+'</DIV>' ;
                         }
                         if(c01==3){
                             html=html+'<DIV class="div02"   ><span>'+data[c02+d].DAY_LONG_DESC+'</span>';
                             if(data[c02+d].sfgz==0){
                                 html=html+'<span style="margin-top: -30px;" >工作日</span>';
                             }
                             if(data[c02+d].sfgz==1){
                                 html=html+'<span >非工作日</span>';
                             }
                             if(data[c02+d].gzsjid==1){
                                 html=html+'<span>上午工作时间：'+data[c02+d].swsbsj+' -- '+data[c02+d].swxbsj+'下午工作时间：'+data[c02+d].xwsbsj+' -- '+data[c02+d].xwxbsj+'</span>';
                             }
                             if(data[c02+d].gzsjid==2){
                                 html=html+'<span >上午工作时间：'+data[c02+d].swsbsj+' -- '+data[c02+d].swxbsj+'下午工作时间：'+data[c02+d].xwsbsj+' -- '+data[c02+d].xwxbsj+'</span>';
                             }
                             html=html+'</DIV>' ;
                         }
                         if(c01==4){
                             // alert(c02+e+","+data.length)
                             if(c02+e<data.length){
                                 html=html+'<DIV class="div02"   ><span>'+data[c02+e].DAY_LONG_DESC+'</span>';
                                 if(data[c02+e].sfgz==0){
                                     html=html+'<span style="margin-top: -30px;" >工作日</span>';
                                 }
                                 if(data[c02+e].sfgz==1){
                                     html=html+'<span >非工作日</span>';
                                 }
                                 if(data[c02+e].gzsjid==1){
                                     html=html+'<span>上午工作时间：'+data[c02+e].swsbsj+' -- '+data[c02+e].swxbsj+'下午工作时间：'+data[c02+e].xwsbsj+' -- '+data[c02+e].xwxbsj+'</span>';
                                 }
                                 if(data[c02+e].gzsjid==2){
                                     html=html+'<span >上午工作时间：'+data[c02+e].swsbsj+' -- '+data[c02+e].swxbsj+'下午工作时间：'+data[c02+e].xwsbsj+' -- '+data[c02+e].xwxbsj+'</span>';
                                 }
                                 html=html+'</DIV>' ;
                             }else{
                                 html=html+'<DIV class="div02"   ></DIV>' ;
                             }
                         }
                     }
                    html=html+'</DIV>';
                }

            }
            $("#opp01").append(html);}
        });
    }
</script>
<body >
<form class="form-inline" role="form" id="name01" style="margin-top: 20px;padding-left: 20px;">
    <button class="btn btn-default btn-sm"><a href="grkq.jsp">工作日历</a></button>
    <button class="btn btn-default btn-sm"><a href="sxbdj.jsp">上下班登记</a></button>
    <%--<button class="btn btn-default btn-sm"><a href="#">外出登记</a></button>--%>
    <button class="btn btn-default btn-sm"><a href="qjdj.jsp">请假登记</a></button>
    <button class="btn btn-default btn-sm"><a href="ccdj.jsp">出差登记</a></button>
    <%--<button class="btn btn-default btn-sm"><a href="#">加班登记</a></button>--%>
    <button class="btn btn-default btn-sm"><a href="rcjl.jsp">上下班记录</a></button>
</form>
<form class="form-inline" role="form" id="name02" style="margin-top: 20px;padding-left: 20px;">
    <select class="form-control" id="gs" onchange="sg();" >
        <option value="01">1月</option><option value="02">2月</option><option value="03">3月</option><option value="04">4月</option><option value="05">5月</option><option value="06">6月</option>
        <option value="07">7月</option><option value="08">8月</option><option value="09">9月</option><option value="10">10月</option><option value="11">11月</option><option value="12">12月</option>
    </select>
    <button class="btn btn-default btn-sm"><a href="javascript:gg();">当前</a></button>
</form>
<table class="table table-bordered" style="margin-left: 20px;" >
    <caption id="cap">2018年 </caption>
</table>
<div id="opp01">
<DIV style="position: absolute;" >
    <DIV class="div01" >{{msg[0].WEEK_DESC}}</DIV>
    <DIV class="div01" >{{msg[1].WEEK_DESC}}</DIV>
    <DIV class="div01" >{{msg[2].WEEK_DESC}}</DIV>
    <DIV class="div01" >{{msg[3].WEEK_DESC}}</DIV>
    <DIV class="div01" >{{msg[4].WEEK_DESC}}</DIV>
    <DIV class="div01" >{{msg[5].WEEK_DESC}}</DIV>
    <DIV class="div01" >{{msg[6].WEEK_DESC}}</DIV>
</DIV>
<DIV v-for="c01 in 5">
    <DIV class="div02" v-for="c02 in 7"  v-if="c01==0"  >
        <span>{{msg[c02+a].DAY_LONG_DESC}}</span>
        <span style="margin-top: -30px;" v-if="msg[c02+a].sfgz==0">工作日</span>
        <span v-if="msg[c02+a].sfgz==1">非工作日</span>
        <span v-if="msg[c02+a].gzsjid==1">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
        <span v-if="msg[c02+a].gzsjid==2">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>

    </DIV>
    <DIV class="div02" v-for="c02 in 7"  v-if="c01==1"  >
        <span>{{msg[c02+a].DAY_LONG_DESC}}</span>
        <span style="margin-top: -30px;" v-if="msg[c02+a].sfgz==0">工作日</span>
        <span v-if="msg[c02+a].sfgz==1">非工作日</span>
        <span v-if="msg[c02+a].gzsjid==1">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
        <span v-if="msg[c02+a].gzsjid==2">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>

    </DIV>
    <DIV class="div02" v-for="c02 in 7"  v-if="c01==2"  >
        <span>{{msg[c02+a].DAY_LONG_DESC}}</span>
        <span style="margin-top: -30px;" v-if="msg[c02+a].sfgz==0">工作日</span>
        <span v-if="msg[c02+a].sfgz==1">非工作日</span>
        <span v-if="msg[c02+a].gzsjid==1">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
        <span v-if="msg[c02+a].gzsjid==2">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
    </DIV>
    <DIV class="div02" v-for="c02 in 7"  v-if="c01==3"  >
        <span>{{msg[c02+a].DAY_LONG_DESC}}</span>
        <span style="margin-top: -30px;" v-if="msg[c02+a].sfgz==0">工作日</span>
        <span v-if="msg[c02+a].sfgz==1">非工作日</span>
        <span v-if="msg[c02+a].gzsjid==1">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
        <span v-if="msg[c02+a].gzsjid==2">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
    </DIV>
    <DIV class="div02" v-for="c02 in 7"  v-if="c01==4"  >
        <span>{{msg[c02+a].DAY_LONG_DESC}}</span>
        <span style="margin-top: -30px;" v-if="msg[c02+a].sfgz==0">工作日</span>
        <span v-if="msg[c02+a].sfgz==1">非工作日</span>
        <span v-if="msg[c02+a].gzsjid==1">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
        <span v-if="msg[c02+a].gzsjid==2">上午工作时间：{{msg[c02+a].swsbsj}} -- {{msg[c02+a].swxbsj}}下午工作时间：{{msg[c02+a].xwsbsj}} -- {{msg[c02+a].xwxbsj}}</span>
    </DIV>
</DIV>
</div>

<script type="text/javascript">
    function gg(){
        var date = new Date();
        // alert();
        $.ajax({
            url: "${path}/gzrl",
            type: "post",
            data:{"id":date.getMonth()+1},
            // data:{"id":'02'},
            dataType: "json",
            success: function (data) {
                console.log(data);
                var vm = new Vue({
                    el:'#opp01',
                    data:{
                        msg:data,
                        a:0,
                        b:7,
                        c:13,
                        d:19,
                        e:25,
                        f:31
                    }
                });
            }
        });
    }
    $().ready(function () {
            gg();
    });
</script>
</body>
</html>
