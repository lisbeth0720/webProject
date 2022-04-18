<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newTagClassification.aspx.cs" Inherits="Web.Module.BankCall.newTagClassification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>取号</title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
    <style>
         * {
            list-style: none;
            margin: 0px;
            padding: 0px;
            color: #333;
            font-family: '微软雅黑';
            text-decoration: none;
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            -khtml-user-select: none;
            user-select: none;
        }
        html {
         background:url("Dongcheng/images/call_bg.jpg") no-repeat;
            background-size:100% 100%;
        }
        html,body {
            width:100%;
            height:100%;
            overflow:hidden;   
        }
        #mainContent {
            width: 90%;
            height: 100%;
            margin-left: 5%;
            padding-top: 50px;
            box-sizing: border-box;
        }
        #topLogo {
            width: 100%;
            height: 168px;
        }

        #topLogo .leftLogo {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
            line-height: 168px;
            font-size: 36px;
            position:relative;
        }
        #topLogo .leftLogo img {
            /*height: 50%;*/
            float:left;
            width: 50%;
        }
        #topLogo .leftLogo span{
            color:#fff;
            font-size:2.7vw;
            /*float:left;*/
           
            position:absolute;
            left:50.4%;
            top:16.6%;
            line-height:1;
        }
        #topLogo .rightTime {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
        }
        #topLogo .rightTime p {
            width: 100%;
            height: 50%;
            line-height: 84px;
            text-align: right;
            color:#fff;
        }
        #topLogo .rightTime .rightH {
            height: 100px;
            font-size: 68px;
            line-height: 100px;
        }
        #topLogo .rightTime .rightD {
            height: 68px;
            font-size: 38px;
            line-height: 68px;
        }
        #mainList {
            width: 92%;
            margin:auto;
             margin-top:25px;
        }
        #tagName {
            height: 100%;
            margin: 0 auto;
           
        }
        #tagName li {
            display: block;
            width: 25%;
            height: 170px;
            float: left;
            font-size: 34px;
            margin-top: 30px;
            line-height: 60px;
            overflow: hidden;
        }
        #tagName li:first-child {
            margin-left: 0;
        }
        #tagName li a {
            display: block;
            width: 90%;
            height: 98%;
            margin:auto;
            /*background:url("images/newBtnBg.png") no-repeat;
            background-size:100% 100%;*/
           background: #69a2e6;/*#4890e8*/
            /*box-shadow: 3px 3px 3px #493e3e;*/
            text-align: center;
            border-radius: 10px;
        }
        #tagName li a span {
            font-size:40px;
            line-height:90px;
        }
        .mainTitleList {
            width: 100%;
            height: 80px;
        }
        .mainTitleList span {
            display: block;
        }

        .mainTitle {
            float: left;
            line-height: 80px;
            font-size: 48px;
            width: 400px;
        }
        #topTripMain {
            top: 0;
            display: block;
            width: 100%;
            height: 100%;
            position: absolute;
            background: rgba(0,0,0,0.7);
        }
        #topTripShadow {
            background: #fff;
            margin-left: 25%;
            top: 0;
            bottom: 0;
            width: 1000px;
            height: 600px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -300px 0 0 -500px;
            border-radius: 20px;
            display: block;
            background-size: 100% 100%;
            min-width: 420px;
            max-width: 1000px;
            color: #aaa;
        }
        .shadowHead {
            height: 80px;
            width: 100%;
            background: #eee;
            border-radius: 20px 20px 0px 0px;
        }
        .shadowHead img {
            display: block;
            height: 50px;
            margin-top: 15px;
        }
        .shadowHead span {
            display: block;
            float: left;
            width: 200px;
            font-size: 42px;
            line-height: 80px;
            color:#aaa;
        }
        .shadowHead .leftImg {
            height: 100%;
            width: 100%;
            box-sizing: border-box;
            float: left;
        }
        .shadowHead .leftImg span {
            display:inline-block;
            text-align:center;
            width:50%;
            box-sizing:border-box;
        }
        .shadowHead .closeShadow {
            height: 60px;
            width: 100px;
            float: right;
            margin-right: 20px;
            /*margin-top: 10px;*/
        }
        .shaoadowBottom {
            width: 100%;
            height: 520px;
            display: block;
            position: relative;
        }
        .bottomContent {
            display: block;
            width: 90%;
            /* height: 100%; */
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .bottomContent .contentLeft {
            display: block;
            float: left;
            width: 44%;
            height: 100%;
        }
        .bottomContent .contentLeft img {
            width: 100%;
        }

        .bottomContent .contentRight {
            display: block;
            width: 56%;
            height: 100%;
            float: left;
        }
        .rightTop {
            height: 200px;
            width: 100%;
            border: 1px solid #fff;
            box-sizing: border-box;
        }
        .rightTop p {
            color: #000 !important;
            width: 100%;
            text-align: center;
        }
        .chTip {
            font-size: 50px;
            height: 80px;
            margin-top: 70px;
            line-height: 80px;
        }
        .enTip {
            height: 50px;
            font-size: 32px;
            line-height: 50px;
        }
        .rightMain {
            height: 70px;
            margin-top: 30px;
        }
        .rightMain img {
            display: block;
            height: 100%;
            margin: 0 auto;
        }
        .rightBottom {
            width: 100px;
            float: right;
            background: #aaa;
            height: 40px;
            border-radius: 20px;
            font-size: 30px;
            text-align: center;
            margin-top: 30px;
        }
        .chTip1 {
            font-size: 50px;
            height: 80px;
            margin-top: 30px;
            line-height: 80px;
        }
        .enTip1 {
            height: 30px;
            font-size: 25px;
            line-height: 30px;
        }
        .rightMain p {
            color: #000;
        }
        .shaoadowBottom2 {
            display: block;
            width: 100%;
            height: 100%;
            color: #000;
        }
        .shaoadowBottom2 p {
            color: #000;
            text-align: center;
            line-height: 420px;
            font-size: 50px;
        }
        .activeClass {
            color:#fff!important;
            background:#69a2e6;
            border-radius:20px 0 0 0;
        }
        .showFunc2Btn {
            width: 100%;
            margin: auto;
            height: 470px;
            margin-top: 20px;
            display:none;
        }
        .showFunc2Btn input[type=button]{
            color:#000!important;
            display: block;
            width: 25%;
            float: left;
            border:1px solid #aaa;
        }
        .topFunc2 {
            display: block;
            width: 93%;
            margin: auto;
        }
        .topFunc2 input {
            display: block;
            width: 100%;
            height: 70px;
            line-height: 70px;
            font-size: 60px;
            color: #000 !important;
            border-radius: 10px;
            border: none;
            border: 1px solid #aaa;
            padding: 0 10px;
            box-sizing: border-box; 
        }
        .func2BtnContent {
            display:block;
            width:100%;
            height:400px;
            margin-top:15px;
        }
        .func2BtnContent ul {
            display: block;
            width: 100%;
            height: 100%;
        }

        .func2BtnContent ul li {
            display: block;
            width: 33.33%;
            height: 70px;
            float: left;
            margin-top: 10px;
        }
        .func2BtnContent ul li input {
            display: block;
            width: 80% !important;
            margin: auto;
            height: 100%;
            border-radius: 10px;
            background: #fff;
            font-size: 50px;
            outline: none;
            margin-left: 10%;
            border:1px solid #000;
        }
        .sysTip {
            position: absolute;
            background: #fff;
            width: 30%;
            height: 50px;
            margin: auto;
            left: 50%;
            transform: translate(-50%, -0);
            top: 0;
            border-radius: 0px 0px 10px 10px;
            display: none;
            z-index: 9;
        }
        .leftSysTip {
            display:block;
            float:left;
            width:85%;
        }
        .leftSysTip p {
            color: #000;
            width: 100%;
            line-height: 50px;
            text-align: center;
        }
        .rightSysTip {
            display: block;
            width: 15%;
            float: left;
        }

        .rightSysTip img {
            display: block;
            margin: auto;
            height: 30px;
            margin-top: 10px;
        }
        .closeThisShadow {
            position: absolute;
            right: -40px;
            top: -40px;
        }
    </style>
</head>
<body>
    <div class="sysTip">
        <div class="leftSysTip">
            <p>aaaaaa</p>
        </div>
        <div class="rightSysTip" >
            <img src="images/error.png" onclick="closeSysTip()"/>
        </div>
    </div>
    <form>
         <div id="mainContent">
            <div id="topLogo">
                <div class="leftLogo">
                    <%--<span>德胜门街道公共服务大厅</span>--%>
                   <%-- <img src="images/DSLogo.png" />--%>
                     <img src="Dongcheng/images/logo.png" />
                    <span>登记事务中心</span>
                </div>
                <div class="rightTime">
                    <p class="rightH"></p>
                    <p class="rightD"></p>
                </div>
            </div>
        </div>
        <div id="mainList">
             <ul id="tagName">
              </ul>
        </div>
    </form>
    <div id="topTripMain" style="display:none;"> 
        <div id="topTripShadow">
            <img src="images/newcloseShadow.png" class="closeThisShadow"/>
            <div class="shadowHead">
                <div class="leftImg">
                    <span style="border-right:2px solid #aaa;" class="ticketFun1 activeClass">请刷二代身份证</span>
                     <span class="ticketFun2">请输入证件号</span>
                </div>
            </div>
            <div class="showFunc2Btn">
                <div class="topFunc2">
                    <input type="text" maxlength="18" onclick="test(this)"/>
                </div>
                <div class="func2BtnContent">
                    <ul>
                        <li><input type="button" value="1" class="keyboardClass"/> </li>
                        <li><input type="button" value="2" class="keyboardClass"/> </li>
                        <li><input type="button" value="3" class="keyboardClass"/> </li>
                        <li><input type="button" value="4" class="keyboardClass"/> </li>
                        <li><input type="button" value="5" class="keyboardClass"/> </li>
                        <li><input type="button" value="6" class="keyboardClass"/> </li>
                        <li><input type="button" value="7" class="keyboardClass"/> </li>
                        <li><input type="button" value="8" class="keyboardClass"/> </li>
                        <li><input type="button" value="9" class="keyboardClass"/> </li>
                         <li><input type="button" value="X" class="keyboardClass"/> </li>
                        <li><input type="button" value="0" class="keyboardClass"/> </li>
                        <li style=" position: relative;">
                            <img src="images/deleteBg.png" style=" position: absolute; left: 50%; top: 50%; transform: translate(-50%,-50%)"/>
                            <input type="button" class="backspaceBtn"/> 
                        
                        </li>
                       
                        <li><input type="button" value="清空" class="clearBtn"/></li>
                        <li style="width:66.66%"><input type="button" value="确认" class="submitCard" style="width:90%!important;margin-left:5%;"/></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        //http://192.168.1.145:8090/Module/HFhuixinbi/Bankcall/Parent.aspx?targetUrl=192.168.1.10:8081&sourceUrl=192.168.1.10:8080#
        var names = "";
        //var switchs1 =<%=ConfigurationManager.AppSettings["switch"]%>;
        var names = "";
        var timer = 30;//设置倒计时时间
        var carTimer = "";
        var getwaitTime = "";
        var winUrl = window.location.href;
        winUrl = winUrl.toLocaleLowerCase();
        var sourceUrl = "localhost:8080";
        var targetUrl = "";
        var timeClickTimer = 45 * 1000;//设置倒计时，超过时间返回首页
        var timeFun = "";
        var closeStr = "";
        var closeNumStr = "";
        var cp = "wisepeak";//单位号
        var comname = "登记事务中心";//单位名称
        var winH = document.documentElement.clientHeight;
        var oldData = "";
        var infoNumber = "0";
        var infoName = "咨询统计";
        var enInfoName = "";//英文咨询统计
        var infoNum = 0;//获取咨询人数
        //获取URL中传递的参数值，没有参数则返回空
        function requestUrl(key) {
            var queryString = window.location.search.substring(1);
            queryString = queryString.toLowerCase();
            var vars = queryString.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == key) { return decodeURI(pair[1]); }
            }
            return "";
        }

        if (requestUrl("sourceurl") != "") { sourceUrl = requestUrl("sourceurl"); }
        //判断参数中是否包含infonumber，如果有就显示计数按钮
        if (requestUrl("infonumber") != "") { infoNumber = requestUrl("infonumber"); }
        if (requestUrl("infoname") != "") { infoName = requestUrl("infoname"); infoName = decodeURI(infoName); }
        //if (winUrl.indexOf("targeturl") >= 0) {
        //    if (winUrl.split("targeturl=")[1].indexOf("&") >= 0) {
        //        targetUrl = winUrl.split("targeturl=")[1].split("&")[0];
        //    } else {
        //        targetUrl = winUrl.split("targeturl=")[1]
        //    }
        //    //targetUrl = winUrl.split("targeturl=")[1].split(":")[0] + ":8081"
        //} else {
        //    targetUrl = "localhost:8081";
        //}
        if (requestUrl("cp") != "") { cp = requestUrl("cp"); }

        if (requestUrl("comname") != "") { comname = requestUrl("comname"); }
        
        $(function () {
            $(".leftLogo span").html(decodeURI(comname))
            $("#mainList").css("height", winH - $("#topLogo").height() - parseFloat($("#mainList").css("marginTop")) - parseFloat($("#mainContent").css("marginTop")));
            $("#mainList .tagList").css("width", $("#mainProgress img").width() + "px");
            $("#mainProgress img").css("paddingTop", ($("#mainProgress").height() - $("#mainProgress img").height()) / 2 + "px");
            $("#tagName").css("height", $("#mainList").height() - $(".mainTitleList").height());
            GetSelectTagAll();
            setInterval(function () {
                GetSelectTagAll();
            }, 2000)
            getwaitTime = setInterval(function () {
                tagWaitNum($("#conLoad").attr("tagStr"));
            }, 2000)
            //禁止在页面中选择
            document.onselectstart = function () { return false; };
            getDate();
            setInterval("getDate()", 1000);
            $(".leftImg span").click(function () {
                debugger;
                $(".leftImg span").css("borderRadius", "0");
                $(".leftImg span").removeClass("activeClass");
                $(this).addClass("activeClass");
                if ($(this).index() == 0) {
                    //清除手动输入倒计时定时器
                  
                    $(this).css("borderRadius","20px 0 0 0");
                    $(".showFunc2Btn").hide();
                    $(".commonShadowContent").show();
                   
                    clearInterval(closeNumStr);
                    //清除手动输入倒计时定时器
                    clearInterval(closeStr);
                    //清除读卡定时器
                    clearInterval(carTimer);
                    timer = 30;
                    timer = 30;
                    //启动读卡倒计时定时器
                    closeStr = setInterval("cardTime()", 1000);
                    //启动读卡定时器
                    carTimer = setInterval("getNumber()", 1000);
                 
                } else if ($(this).index() == 1) { 
                   
                    showFunc2();
                    $(this).css("borderRadius", "0 20px 0 0");
                }
            })
            $(".keyboardClass").click(function () {
                $(this).css("background", "#69a2e6");
                setTimeout(function () {
                    $(".keyboardClass").css("background", "#fff");
                },200)
               
                if ($(".topFunc2 input").val().length < 18) {
                    $(".topFunc2 input").iAddField($(this).val());
                }
            })         
            $(".backspaceBtn").parent().click(function () {   
                $(".topFunc2 input").iDelField(1);
                
            })
            $(".clearBtn").click(function () {
                $(".topFunc2 input").val("");
            })
            $(".closeThisShadow").click(function () {
                closeShadow();
            })
            $(".submitCard").click(function () {
                if (checkIDCard($(".topFunc2 input[type=text]").val())) {
                    timer = 15;
                    //清除手动输入倒计时定时器
                    clearInterval(closeNumStr);
                    clearInterval(closeStr);
                    $(".showFunc2Btn").hide();
                    $(".commonShadowContent").show();
                    //显示打印相关内容，并启动打印倒计时（用读卡）
                    timer = 15;
                    commonShadow("#topTripShadow", "温馨提示", "print", 15, "");
                   
                    closeStr = setInterval("cardTime()", 1000);
                   // getWaitNum($(".topFunc2 input[type=text]").val());
                    getPrintStatus($(".topFunc2 input[type=text]").val());
                } else {
                    showSysTip("证件有误！请重新输入");
                    setTimeout(function () {
                        closeSysTip()
                    },2000)
                }              
            })
            $("#topTripShadow").on("click", ":not(.submitCard,.closeThisShadow)", function () {
                timeClick();
            })
            $("#topTripShadow").on("topuchstart", ":not(.submitCard)", function () {
                timeClick();
            })
            $(".leftImg").on("click", function () {
                event.stopPropagation();
            })
            $(".submitCard").click(function (event) {
                event.stopPropagation();
            })
            $(".closeThisShadow").click(function (event) {
                event.stopPropagation();
            })
            $(".func2BtnContent input").click(function () {
                $(this).css("background", "#69a2e6");
                setTimeout(function () {
                    $(".func2BtnContent input").css("background", "#fff");
                }, 100)
            })
        })
        //200 OK[等待人数查询成功！]-% s -% d -% s，后面分别为：业务名 - 队列还剩多少人; 业务名 - 队列还剩多少人; 业务名 - 队列还剩多少人
        //http://192.168.10.128:8080/wpqueuedata.asp?wpqueuedata=businessquery&utf8=0&node=200&retqueue=1&json=1&cp=wisepeak
        function GetSelectTagAll() {  
            $.ajax({
                type: "get",
                //url: "API/Bank_CallAPI.ashx",
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                dataType: "json",
                data: {
                    "wpqueuedata": "businessquery",
                    "utf8": "1",
                    "node": "",
                    "json": "1",
                    "retqueue": "1",
                    "cp": cp

                }, success: function (data) {
                    //"m_d1": "状态",
                    //"m_d2": "优先级",
                    //"m_d3": "等待人数"
                   //\"m_d12\":\"%s\",\"m_d13\": m_d12这个是增加的业务名对应的英文名(json);m_d13返回的是当前业务组的英文名
                    var thisData = data
                    if (JSON.stringify(oldData) != JSON.stringify(thisData)) {
                        var count = 1;
                        var str = "";
                        var tagStr = "";
                        var Count = data;
                        //data = Count.tbis[0];
                        var insoStr = "<li data-name='" + infoName + "' edata-name='" + enInfoName+"'id='infoid' onmouseup='addNum('1')'><a><span >" + infoName + "</span><br>(" + infoNum+"人次)" + "</a></li>";
                        names = "";
                        for (var j = 0; j < Count.tbis.length; j++) {
                            var data = Count.tbis[j];
                            for (var i = 0; i < data.lv1data.length; i++) {

                                names += "" + data.lv1data[i].triid + "" + ";";
                                str += "<li data-name='" + data.lv1data[i].triid + "' edata-name='" + data.lv1data[i].tridata[0].m_d12+"' id='li_name' class='dataList' onmouseup='getCard(this)'><a><span >" + data.lv1data[i].triid + "</span><br>(0人等待)" + "</a></li>";
                               
                                tagStr += data.lv1data[i].triid + ";"
                            }
                        }

                        $("#conLoad").attr("tagStr", tagStr);
                        $("#tagName").html(str);
                        if (infoNumber == "0") {
                           
                            $("#tagName").html(str);
                        } else {
                            addNum("0");
                            $("#tagName").html(str + insoStr);
                        }
                        
                        tagWaitNum($("#conLoad").attr("tagStr"));
                        oldData = thisData;
                    }
                    

                }, error:function(data) {
                    console.log(data)
                }
            })
        }
        function tagWaitNum(str) {
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "waitnum",
                    "utf8": "1",
                    "node": str,
                   
                }, success: function (data) {
                    var dataStr = $(data);
                    if (dataStr.find("wpretstr").text().indexOf("200") >= 0) {
                        var waitStr = dataStr.find("wpretstr").text().split("]")[1];
                        var waitArr = "";  //获取等待人数的数据               
                        if (waitStr.trim() != "") {
                            waitArr = waitStr.split(";");
                            for (var i = 0; i < $("#tagName .dataList").length; i++) {
                                for (var j = 0; j < waitArr.length; j++) {
                                    if (waitArr[j] != "") {
                                        if ($("#tagName .dataList").eq(i).attr("data-name") == waitArr[j].split("-")[1]) {
                                            $("#tagName .dataList").eq(i).find("a").html("<span>"+$("#tagName li").eq(i).attr("data-name") + "</span><br>(" + waitArr[j].split("-")[2] + "人等待)");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }, error: function (data) {
                    showSysTip("系统错误，请联系工作人员！")
                }
            })
        }
        //咨询统计计数功能
        function addNum(identType) {
            $.ajax({
                url: "API/Bank_CallAPI.ashx",
                type: "get",
                dataType: "text",
                data: {
                    "Type": "SelectPrintNumberState",
                    "number": infoNumber,
                    "ident":identType
                }, success: function (data) {
                    $("#infoid").html("<a><span>" + $("#infoid").attr("data-name") + "</span><br>(" + data + "人次)</a>");
                    $("#infoid").removeAttr("onmouseup");
                    $("#infoid span,#infoid a").css("color", "#777");
                    if (identType == "1") {
                        window.setTimeout(function () {
                            $("#infoid").attr("onmouseup", "addNum('1');");
                            $("#infoid span,#infoid a").css("color", "#333");
                        }, 3000);
                        infoNum = data;
                    } else { 
                        $("#infoid").attr("onmouseup", "addNum('1');");
                        $("#infoid span,#infoid a").css("color", "#333");
                    }
                    
                    
                }, error: function (a,b,c) {
                    Console(data);
                }

            })
        }
        var orInputCard = 0;//是否需要输入身份证，=0不需要，=1需要
        if (requestUrl("type") != "" && requestUrl("type") != null){
            orInputCard = requestUrl("type");
        }
        function getCard(thisID) {
            //debugger;
            if ($("#topTripMain").css("display") == "none") {
                if (orInputCard == 1) {//需要输入身份证
                    //恢复成原来的背景颜色
                    $("#topTripMain").show();
                    clearInterval(closeStr);
                    $(".showFunc2Btn").hide();
                    $(".commonShadowContent").show();
                    $(".leftImg span").removeClass("activeClass");
                    $(".leftImg span").eq(0).addClass("activeClass");
                    timer = 30;
                    tagname = thisID
                    clearInterval(getwaitTime);
                    //clearInterval(carTimer);
                    $(".ticketFun1").css("borderRadius", "20px 0 0 0");
                    commonShadow("#topTripShadow", "温馨提示", "card", timer, "");
                    closeStr = setInterval("cardTime()", 1000);
                    carTimer = setInterval("getNumber()", 1000);
                } else if (orInputCard == 0) {
                    tagname = thisID
                    $(".commonShadowContent").show();
                    //显示打印相关内容，并启动打印倒计时（用读卡）
                    //timer = 15;
                    //commonShadow("#topTripShadow", "温馨提示", "print", 15, "");
                   // closeStr = setInterval("cardTime()", 1000);
                    getPrintStatus("412724199707141543");
                    //console.log(thisID)
                }
            }

        }
        //获取当前数据
        function getNumber() {
            console.log("time");
            clearInterval(getwaitTime);
            var rnd = Math.random(999);       
           $.ajax({
                type: "get",
               // url: "http://" + targetUrl + "/wpreadcard.asp",
               url: "http://localhost:8081/wpreadcard.asp",
                dataType: "html",
                data: {
                    "wpreadcard": "10",
                    "type": "6",
                    "port": "USB1",  //设备端口名称
                    "utf8": "1",  //utf8=0表示返回utf8编码，=1表示gb2312
                    "json": "1", //json=1表示返回json格式数据，=0表示返回XML格式的数据
                    "rnd": rnd
                },
                success: function (data) {
                    //判断卡号是否相同
                    var thisCard = "";
                  
                    if (data.indexOf("xml") >= 0 || data.indexOf("XML") >= 0) {
                        if ($(data).find("tdi").eq(0).text().indexOf("FAIL") >= 0 | $(data).find("tdi").eq(0).text().indexOf("Failure") >= 0 || $(data).find("tdi").eq(5).text().indexOf("FAIL") >= 0 | $(data).find("tdi").eq(5).text().indexOf("Failure") >= 0) {
                            if (timer <= 0) {
                                clearInterval(carTimer);
                                $(".commonShadowContent").remove();
                                timer = 30;
                                commonShadow("#topTripShadow", "温馨提示", "tip", timer, "读取信息失败");
                                setTimeout(function () {
                                    closeShadow()
                                },3000)
                                getwaitTime = setInterval(function () {
                                    tagWaitNum($("#conLoad").attr("tagStr"));
                                }, 2000)
                            }
                        } else {
                            timer = 15;
                            clearInterval(carTimer);
                            clearInterval(closeStr);
                            commonShadow("#topTripShadow", "温馨提示", "print", 15, "");
                            closeStr = setInterval("cardTime()", 1000);
                            thisCard = data[0].cardinfo.cardno;
                            //getWaitNum(thisCard);
                            getPrintStatus(thisCard)
                           
                        }
                    } else {
                        var data = eval("(" + data + ")")
                        if (data[0].cardinfo.cardno.indexOf("FAIL") >= 0 || data[0].cardinfo.cardno.indexOf("Failure") >= 0) {
                            if (timer <= 0) {
                                clearInterval(carTimer);
                                timer = 30;
                                $(".commonShadowContent").remove();
                                commonShadow("#topTripShadow", "温馨提示", "tip", timer, "读取信息失败");
                                setTimeout(function () {
                                    closeShadow()
                                }, 2000);
                                console.log(2);
                                getwaitTime = setInterval(function () {
                                    tagWaitNum($("#conLoad").attr("tagStr"));
                                }, 2000)
                            }
                        } else {
                            timer = 15;
                            clearInterval(carTimer);
                            clearInterval(closeStr);
                            commonShadow("#topTripShadow", "温馨提示", "print", 15, "");
                            closeStr = setInterval("cardTime()", 1000);
                            thisCard = data[0].cardinfo.cardno;
                            //getWaitNum(thisCard);
                            getPrintStatus(thisCard);
                        }
                    }
                }, error: function (data) {
                    showSysTip("系统错误，请联系工作人员！");
                  //  clearInterval(carTimer);
                   
                }

            })
        }

        //获取当前的等候数据
        //function getWaitNum(cardID) {
        //    var name = $(tagname).attr('data-name');
        //    var rnd = Math.random(999);
        //    $.ajax({
        //        type: "get",
        //        url: "http://" + sourceUrl + "/wpqueuedata.asp",
        //        dataType: "html",
        //        data: {
        //            "wpqueuedata": "queue",
        //            "cp": "wisepeak",
        //            "utf8": "1",
        //            "t0": "",
        //            "t1": "1",
        //            "t2": "",
        //            "t3": "",
        //            "t4": "",
        //            "t50": name,
        //            "t51": "",
        //            "t52": cardID,
        //            "t53": "",
        //            "dprint": "1",
        //            "rnd": rnd
        //        }, success: function (data) {
        //            // alert("打印小票")
        //            //此时已经没有读卡的计时器，所以此时不需要清                
        //            tagWaitNum();
        //            if (parseInt($(data).find("wpretstr").text().split("[")[0]) >= 330 && parseInt($(data).find("wpretstr").text().split("[")[0]) <= 339) {
        //                if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 331) {
        //                    showSysTip("打印机卡纸，请联系工作人员！");
                            
        //                } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 332) {
        //                    showSysTip("打印机缺纸，请联系工作人员！");
                            
        //                } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 338) {
        //                    showSysTip("打印机未联机，请联系工作人员！");

        //                }else {
        //                    showSysTip("数据处理失败，请联系工作人员！");                         
        //                }
        //                setTimeout(function () {
        //                    closeShadow()
        //                }, 2000);

        //            } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 307) {
        //                commonShadow("#topTripShadow", "温馨提示", "tip", timer, "今日号已发完！");
                     
        //                console.log(5)
        //                setTimeout(function () {
        //                    closeShadow()
        //                }, 2000);
        //            } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 309) {
        //                commonShadow("#topTripShadow", "温馨提示", "tip", timer, "系统访问频繁，请稍后刷卡！");
                     
        //                console.log(5)
        //                setTimeout(function () {
        //                    closeShadow()
        //                }, 2000);
        //            } else {
        //                //此时只需要将定时器关闭即可
                       
        //                setTimeout(function () {
        //                    closeShadow();  
        //                }, 3000);
        //                console.log(4);
        //            }
        //            getwaitTime = setInterval(function () {
        //                tagWaitNum($("#conLoad").attr("tagStr"));
        //            }, 2000)
        //        }, error: function (a) {
        //            showSysTip("系统错误，请联系工作人员！")
        //        }
        //    })
        //}
        function img_li() {
            clearTimeout(timeFun);
            $("#conLoad").html("");
            $("#conLoad").load('callNumber.aspx');

            clearInterval(getwaitTime);
            clearInterval(carTimer);
            clearInterval(closeStr);

        }
        function GetPrintingState() {
            $("#topTripMain").show();
            commonShadow("#topTripShadow", "温馨提示", "tip", timer, "此业务暂不可办理！");
            setTimeout(function () {
                closeShadow();
            }, 3000)
        }
        //关闭弹窗
        function closeShadow() {
            $(".topFunc2 input[type=text]").val("");
            //关闭时将弹框操作所有的定时器都清除
            clearInterval(carTimer);
            clearInterval(closeStr);
            clearInterval(closeNumStr);
            closeStr=null
            $(".commonShadowContent").remove();
            timer = 30;
            $("#topTripMain").hide();
            clearInterval(getwaitTime);
            getwaitTime = setInterval(function () {
                tagWaitNum($("#conLoad").attr("tagStr"));
            }, 2000)
        }
        function timeClick() {
            
            //冒泡方式实现点击最里层，同时触发外层
            clearInterval(closeNumStr);
            timer = 30;
           
            closeNumStr = setInterval("numTime()", 1000);
        }
        getDate();
        function getDate() {
            var date = new Date();
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            var H = date.getHours();
            var M = date.getMinutes();
            var S = date.getSeconds();
            var dayStr = y + "/" + padding2(m, 2) + "/" + padding2(d, 2);
            var timeStr = padding2(H, 2) + ":" + padding2(M, 2);
            $(".rightH").html(timeStr);
            $(".rightD").html(dayStr);
        }
        //在数字前补0
        function padding2(num, length) {
            if ((num + "").length >= length) {
                return num;
            }
            return padding2("0" + num, length)
        }
        function showFunc2() {
            
            $(".showFunc2Btn").show();
            $(".commonShadowContent").hide();
            clearInterval(closeNumStr);
            //清除手动输入倒计时定时器
            clearInterval(closeStr);
            //清除读卡定时器
            clearInterval(carTimer);
            timer = 30;
            //启动手动输入定时器
            closeNumStr = setInterval("numTime()", 1000);
        }
        function closeSysTip() {
            $(".sysTip").hide();
        }
        function cardTime() {
            timer--;
            console.log(11,timer);
            if (timer < 0) {
                $(".commonShadowContent").remove();
                timer = 30;
                clearInterval(closeStr)
                closeShadow();
            } else {
                $(".timerClass").html(timer + "s");
            }
        }
        function numTime() {
            timer--;
            console.log(22,timer);
            if (timer < 0) {
                closeShadow();
                timer = 30;
                //clearInterval(closeNumStr);
            }
        }
        function test(elem) {
            console.log($(elem).iGetFieldPos())
        }
        ; (function ($) {
            /*
             * 文本域光标操作（选、添、删、取）的jQuery扩展
             */
            $.fn.extend({
                /*
                 * 获取光标所在位置
                 */
                iGetFieldPos: function () {
                    var field = this.get(0);
                    if (document.selection) {
                        //IE
                        $(this).focus();
                        var sel = document.selection;
                        var range = sel.createRange();
                        var dupRange = range.duplicate();
                        dupRange.moveToElementText(field);
                        dupRange.setEndPoint('EndToEnd', range);
                        field.selectionStart = dupRange.text.length - range.text.length;
                        field.selectionEnd = field.selectionStart + range.text.length;
                    }
                    return field.selectionStart;
                },
                /*
                 * 选中指定位置内字符 || 设置光标位置
                 * --- 从start起选中(含第start个)，到第end结束（不含第end个）
                 * --- 若不输入end值，即为设置光标的位置（第start字符后）
                 */
                iSelectField: function (start, end) {
                    var field = this.get(0);
                    //end未定义，则为设置光标位置
                    if (arguments[1] == undefined) {
                        end = start;
                    }
                    if (document.selection) {
                        //IE
                        var range = field.createTextRange();
                        range.moveEnd('character', -$(this).val().length);
                        range.moveEnd('character', end);
                        range.moveStart('character', start);
                        range.select();
                    } else {
                        //非IE
                        field.setSelectionRange(start, end);
                        $(this).focus();
                    }
                },
                /*
                 * 选中指定字符串
                 */
                iSelectStr: function (str) {
                    var field = this.get(0);
                    var i = $(this).val().indexOf(str);
                    i != -1 ? $(this).iSelectField(i, i + str.length) : false;
                },
                /*
                 * 在光标之后插入字符串
                 */
                iAddField: function (str) {
                    var field = this.get(0);
                    var v = $(this).val();
                    var len = $(this).val().length;
                    if (document.selection) {
                        //IE
                        $(this).focus()
                        document.selection.createRange().text = str;
                    } else {
                        //非IE
                        var selPos = field.selectionStart;
                        $(this).val($(this).val().slice(0, field.selectionStart) + str + $(this).val().slice(field.selectionStart, len));
                        this.iSelectField(selPos + str.length);
                    };
                },
                /*
                 * 删除光标前面(-)或者后面(+)的n个字符
                 */
                iDelField: function (n) {
                    var field = this.get(0);
                    var pos = $(this).iGetFieldPos();
                    var v = $(this).val();
                    //大于0则删除后面，小于0则删除前面
                    $(this).val(n > 0 ? v.slice(0, pos - n) + v.slice(pos) : v.slice(0, pos) + v.slice(pos - n));
                    $(this).iSelectField(pos - (n < 0 ? 0 : n));
                }
            });
        })(jQuery);
  /*----------------------------以下程序为打印与获取数据分开的方式-----------------------*/
    //1、判断打印机是否正常工作
        function getPrintStatus(cid) {
            disClick();
            $.ajax({
                type: "get",
                url: "http://localhost:8080/wpprintdata.asp",
                dataType: "html",
                data: {
                    "wpprintdata": "",
                    "utf8": "1",  //utf8=0表示返回utf8编码，=1表示gb2312
                    "checkprint": "1",
                    "value1": "",
                    "value2": "",
                    "value3": "",//前面有几个人在等待
                    "value4": "",
                    "value5": "",
                    "value6": "",
                    "value7": "",
                    "value8": "",
                    "value9": "",
                    "value10": ""
                }, success: function (data) {
                    
                    tagWaitNum();
                    if (parseInt($(data).find("wpretstr").text().split("[")[0]) >= 330 && parseInt($(data).find("wpretstr").text().split("[")[0]) <= 339) {
                        if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 331) {
                            showSysTip("打印机卡纸，请联系工作人员！");

                        } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 332) {
                            showSysTip("打印机缺纸，请联系工作人员！");

                        } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 338) {
                            showSysTip("打印机未联机，请联系工作人员！");

                        } else {
                            showSysTip("数据处理失败，请联系工作人员！");
                        }
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);

                    } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 307) {
                        commonShadow("#topTripShadow", "温馨提示", "tip", timer, "今日号已发完！");

                        console.log(5)
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);
                    } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 309) {
                        commonShadow("#topTripShadow", "温馨提示", "tip", timer, "系统访问频繁，请稍后刷卡！");

                        console.log(5)
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);
                    } else {
                        //此时只需要将定时器关闭即可
                        getWaitNum(cid);
                    }
                }, error: function (data) {
                }
            })
        }
        function getWaitNum(cardID) {
            var name = $(tagname).attr('data-name');
            var ename = $(tagname).attr('edata - name');
            var rnd = Math.random(999);
            $.ajax({
                type: "get",
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                dataType: "html",
                data: {
                    "wpqueuedata": "queue",
                    "cp": "wisepeak",
                    "utf8": "1",
                    "t0": "",
                    "t1": "1",
                    "t2": "",
                    "t3": "",
                    "t4": "",
                    "t50": name,
                    "t51": "",
                    "t52": cardID,
                    "t53": "",
                    "dprint": "",
                    "rnd": rnd
                }, success: function (data) {
                    // alert("打印小票")
                    //此时已经没有读卡的计时器，所以此时不需要清                
                   // tagWaitNum();
                    var data = $(data);
                    //此时只需要将定时器关闭即可
                    if (data.find("wpretstr").text().indexOf("200") >= 0) {
                        if (data.find("wpretstr").text().indexOf("-") >= 0) {
                            var waitArr = data.find("wpretstr").text().split("-");
                            var waitNum1 = parseInt(waitArr[waitArr.length - 2]) > 0 ? parseInt(waitArr[waitArr.length - 2]) - 1 : parseInt(waitArr[waitArr.length - 2]);
                            var tagName1 = waitArr[waitArr.length - 1];
                            var callNum1 = waitArr[3];
                            if (callNum1.indexOf("_") >= 0) {
                                callNum1 = waitArr[3].split("_")[0];
                                if (callNum1.indexOf("#") >= 0) {
                                    var callNum1Arr = callNum1.split("#");                                   
                                    if (callNum1Arr[1] != "") {
                                        //判断是否有0
                                        var beforeStr = callNum1Arr[1].indexOf("0");                   
                                        if (beforeStr > 0) {
                                            //有0的情况从后向前找到第一个非0的index，并记录
                                            for (var k = callNum1Arr[1].length-1; k >= 0; k--) {
                                                if (callNum1Arr[1][k] != "0") {
                                                    var numLen = k + 1;//记录呼叫前缀的长度
                                                    callNum1 = (callNum1Arr[1]).substr(0, numLen) + padding2(parseInt(callNum1Arr[0]), callNum1Arr[1].length - 1-k);//根据第一个非0的字符计算出呼叫前缀的长度和呼叫前缀之后0的长度
                                                    break;
                                                }
                                            }  
                                        } else {
                                            callNum1 = callNum1Arr[0];
                                        }   
                                    } else {
                                        callNum1 = callNum1Arr[0];
                                    }
                                    
                                }
                            }
                            printNumber(tagName1, callNum1, waitNum1, ename);
                        }
                       
                    }
                }, error: function (a) {
                    showSysTip("系统错误，请联系工作人员！")
                }
            })
        }
        //打印
        function printNumber(tagName, callNum, waitNum,engName) {
            //value1=传递业务名；value2=传递分配到的号码；value3=为等待人数；value4=为业务呼叫前缀；value5=为身份证号。
            $.ajax({
                type: "get",
                url: "http://localhost:8080/wpprintdata.asp",
                dataType: "html",
                data: {
                    "wpprintdata": "",
                    "utf8": "1",  //utf8=0表示返回utf8编码，=1表示gb2312
                    "value1": tagName,
                    "value2": callNum,
                    "value3": waitNum,//前面有几个人在等待
                    "value4": "",
                    "value5": "",
                    "value6": engName,//英文名
                    "value7": "",
                    "value8": "",
                    "value9": "",
                    "value10": "",
                    "checkprint":"0"

                }, success: function (data) {
                   // clearInterval(carTimer);
                    //timer = 30;
                    if (parseInt(data) >= 330 && parseInt(data) <= 339) {
                        showSysTip("系统错误，请联系工作人员！")
                      
                    } else {
                        setTimeout(function () {
                            closeShadow();
                            addClick();
                        }, 3000);
                        console.log(4);
                    }
                    getwaitTime = setInterval(function () {
                        tagWaitNum($("#conLoad").attr("tagStr"));
                    }, 2000)
                }, error: function (data) {

                }
            })
        }
        //在数字前补0
        function padding2(num, length) {
            if ((num + "").length >= length) {
                return num;
            }
            return padding2("0" + num, length)
        }
        //当打印时禁用选择读卡还是手动输入卡号
        function disClick() {
            $(".shadowHead .leftImg span").attr("pointer-events", "none");
        }
        //打印结束后重新启用点击事件
        function addClick() {
            $(".shadowHead .leftImg span").removeAttr("pointer-events");
        }
    </script>
</body>
</html>
