<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newAppraise.aspx.cs" Inherits="Web.Module.BankCall.newAppraise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="js/jquery-1.9.1.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <title>评价页面</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Microsoft YaHei';
        }

        ul, li {
            list-style: none;
        }

        html, body, form {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        #appraiseBody {
            display: block;
            width: 100%;
            height: 100%;
            background: url(images/newAppraiseBg.jpg) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
        }

        #head {
            display: block;
            width: 100%;
            height: 140px;
            overflow: hidden;
        }

            #head .headLeft {
                display: block;
                width: 45%;
                height: 140px;
                overflow: hidden;
                float: left;
                margin-right: 5%;
            }

                #head .headLeft img {
                    display: block;
                    height: 90px;
                    margin-top: 25px;
                    margin-bottom: 25px;
                    float: left;
                }

            #head .headRight {
                display: block;
                width: 30%;
                height: 140px;
                float: right;
                margin-left: 5%;
            }

        .topImg {
            display: block;
            width: 100%;
            height: 30px;
        }

            .topImg img {
                display: block;
                width: 100%;
                height: 100%;
            }

        .rightDate {
            display: block;
            width: 100%;
            height: 100px;
            font-size: 30px;
            text-align: center;
            line-height: 50px;
            margin-top: 20px;
        }

        .rightH {
            font-size: 70px;
        }

        #main {
            display: none;
            width: 100%;
            height: 100px;
            text-align: center;
            font-size: 52px;
            font-weight: bold;
            line-height: 100px;
        }

        #content {
            position: absolute;
            top: 270px;
            width: 100%;
            height: 100%;
        }

        .mainContent {
            display: block;
            width: 90%;
            margin: 0 auto;
            height: 500px;
            /*ie不支持*/
            /*background: rgb(255,255,255,0.4);*/
            background: rgba(255,255,255,0.4);
            border-radius: 10px;
        }

        .leftContent {
            width: 40%;
            height: 100%;
            padding: 20px 0;
            box-sizing: border-box;
            float: left;
        }

        .imgTopLeft {
            display: block;
            width: 100%;
            height: 48%;
        }

        .brImg {
            display: block;
            width: 100%;
            height: 0.5%;
        }

        .infoTopLeft {
            display: block;
            width: 100%;
            height: 51.5%;
            overflow: hidden;
        }

        .mainRightTitle {
            text-align: center;
            font-size: 30px;
            line-height: 60px;
        }

        .commonInfo {
            width: 100%;
            font-size: 26px;
        }

            .commonInfo span {
                display: block;
                width: 50%;
                float: left;
                height: 40px;
                line-height: 40px;
            }

            .commonInfo .conmmonTitle {
                text-align: right;
            }

            .commonInfo .conmmonContent {
                text-align: left;
            }

        .imgTopLeft {
            display: block;
            width: 100%;
            height: 48%;
            overflow: hidden;
            position: relative;
        }

            .imgTopLeft img {
                display: block;
                max-height: 80%;
                margin: 0 auto;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

        .hBr {
            width: 0.5%;
            float: left;
            height: 100%;
            padding: 20px 0;
            box-sizing: border-box;
        }

            .hBr img {
                height: 100%;
            }

        .mainRight {
            display: block;
            width: 59.5%;
            float: left;
            height: 100%;
            padding: 20px 0;
            box-sizing: border-box;
        }

        .mainRightContent {
            display: block;
            width: 96%;
            height: 100%;
            /* padding: 0 20px; */
            box-sizing: border-box;
            background: #1C5389;
            margin-left: 2%;
            border-radius: 10px;
        }

        .appraiseDiv {
            display: block;
            width: 100%;
            height: 33.3%;
        }

            .appraiseDiv .appraiseImg {
                display: block;
                width: 50%;
                height: 100%;
                float: left;
                position: relative;
            }

        .appraiseContent {
            display: block;
            width: 100%;
            height: 100%;
        }

        .appraiseImg img {
            display: block;
            /*width: 80%;*/
            height: 90%;
            margin: 0 auto;
            margin-top: 5%;
            background-size: 100%;
        }

        .appraiseImg span {
            position: absolute;
            text-align: center;
            width: 80%;
            text-align: center;
            font-size: 40px;
            /* margin: auto; */
            left: 20%;
            color: #fff;
            top: 50%;
            left: 60%;
            transform: translate(-50%, -50%);
        }

        .defaultRight {
            text-align: center;
            font-size: 100px;
            width: 100%;
            height: 100%;
        }

            .defaultRight button {
                display: inline-block;
                zoom: 1;
                *display: inline;
                vertical-align: baseline;
                outline: none;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                padding: 0.5em 1em 0.55em;
                text-shadow: 0 1px 1px rgb(0 0 0 / 30%);
                -webkit-border-radius: 0.5em;
                -moz-border-radius: .5em;
                border-radius: 0.5em;
                -webkit-box-shadow: 0 1px 2px rgb(0 0 0 / 20%);
                -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
                box-shadow: 0 1px 2px rgb(0 0 0 / 20%);
                font-size: 25px;
                color: #d9eef7;
                border: solid 1px #0076a3;
                background: #0095cd;
                background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
                background: -moz-linear-gradient(top, #00adee, #0078a5);
            }

        .newAppraiseFrame {
            display: none;
            /* width: 49.5%;
            height: 80%;*/
            width: 80%;
            height: 84%;
            position: absolute;
            /* top: 6%;
            right: 7.5%;*/
            top: 8%;
            right: 10%;
            z-index: 999;
            background: #fff;
            border-radius: 10px;
        }

        .closeAppraiseBtn {
            height: 40px;
            position: absolute;
            right: -20px;
            top: -20px;
            cursor: pointer;
            z-index: 9999;
        }

        .pj {
            position: absolute;
            top: 5%;
            left: 5%;
            height: 30px;
            width: 80px;
            font-size: 18px;
        }

        #newAppraiseMain, #appraseIframe {
            height: 100%;
            width: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <audio id="music1" controls="controls" style="display: none" muted>
            <source src="images/appraise.wav" type="audio/mpeg" />
        </audio>
        <audio id="music2" controls="controls" style="display: none;">
            <source src="images/thanks.wav" type="audio/mpeg" />
        </audio>
        <div id="appraiseBody">
            <div id="head">
                <div class="headLeft">
                    <%-- <img src="images/LOGOB.png" />--%>
                    <img src="images/DSLogo.png" />
                    <span style="font-size: 40px; line-height: 140px;">德胜街道政务服务中心</span>
                </div>
                <div class="headRight">
                    <div class="rightDate">
                        <p class="rightH"></p>
                        <p class="rightD"></p>
                    </div>

                </div>
            </div>
            <div class="topImg">
                <img src="images/brLine.png" />
            </div>
            <div id="main">
                <div class="mainTitle">
                    <span class="winName"></span>
                </div>
            </div>
            <div id="content">
                <div class="mainContent">
                    <div class="leftContent">
                        <div class="imgTopLeft">
                            <img class="workerPic" src="images/default.jpg" onerror="errImg(this)" />
                        </div>
                        <img src="images/newW.png" class="brImg" />
                        <div class="infoTopLeft">
                            <p class="mainRightTitle">员工信息</p>
                            <p class="lName commonInfo">
                                <span class="conmmonTitle">姓名：</span>
                                <span class="mlName conmmonContent"></span>
                            </p>
                            <p class="lWork commonInfo" style="display: none;">
                                <span class="conmmonTitle">工号：</span>
                                <span class="mlWork conmmonContent"></span>
                            </p>
                            <p class="lService commonInfo">
                                <span class="conmmonTitle">业务：</span>
                                <span class="mlService conmmonContent">综合业务</span>
                            </p>
                        </div>

                    </div>
                    <div class="hBr">
                        <img src="images/newH.png" />
                        <p id="testaaa"></p>
                    </div>
                    <div class="mainRight">
                        <div class="mainRightContent" style="display: none;">
                            <div class="appraiseContent">
                                <div class="appraiseTop appraiseDiv">
                                    <div class="appraiseImg" onclick="clickImg(this)">
                                        <span>非常满意</span>
                                        <img src="images/newbest.png" data-type="5" />

                                    </div>
                                    <div class="appraiseImg" onclick="clickImg(this)">
                                        <span>满意</span>
                                        <img src="images/newGood.png" data-type="4" />
                                    </div>
                                </div>
                                <div class="appraiseMain appraiseDiv">
                                    <div class="appraiseImg" style="width: 40%; margin-left: 30%;" onclick="clickImg(this)">
                                        <span>一般</span>
                                        <img src="images/newLike.png" data-type="3" style="width: 100%;" />
                                    </div>

                                </div>
                                <div class="appraiseBottom appraiseDiv">
                                    <div class="appraiseImg" onclick="clickImg(this)">
                                        <span>差</span>
                                        <img src="images/newBad.png" data-type="2" />

                                    </div>
                                    <div class="appraiseImg" onclick="clickImg(this)">
                                        <span>非常差</span>
                                        <img src="images/newWorst.png" data-type="1" />
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="defaultRight">
                            <p>欢迎光临！</p>
                        </div>
                        <%-- 由于音视频不能主动播放，需要用户操作任意动作后才能播放音视频，所以第一次触发播放评价的音频的时候需要保证当前界面用户进行了点击操作 --%>
                    </div>
                </div>

            </div>
        </div>
        <input type="hidden" id="statusFlg" value="0" style="position: absolute; top: 0;" />
        <button type="button" onclick="clickApprase()" class="pj">评价</button>
        <div class="newAppraiseFrame">
            <img src="images/closeBtn.png" class="closeAppraiseBtn" onclick="closeAppraise()" />
            <div id="newAppraiseMain">
                <iframe src="http://172.25.79.59:8088/CurrencyEvaluate/Evaluate?userid=1&workNo=1006" id="appraseIframe"></iframe>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        getDate();
        setInterval("getDate()", 1000);
        var winID = "";
        var appraiseID = "0";
        var time = 20;
        var timeCounter = 20;//设置全局变量不再改变，为了在倒计时时重新把倒计时的时间重置
        var timeLoop = "";
        var deviceID = "0";
        var nodeName = "";
        var sourceUrl = "";
        var winUrl = (window.location.href).toLowerCase();
        var closeTimer = 60;
        var cp = "wisepeak";
        var oldImg = "";

        var appraseFrameOrOpen = 0;//评价弹框是否打开了，=0未打开，=1打开了

        var evaluateState = 0;//=0未评价，=1点击了请评价，=2已评价

        if (winUrl.indexOf("sourceurl") >= 0) {
            sourceUrl = winUrl.split("sourceurl=")[1].split(":")[0] + ":8080"
        } else {
            sourceUrl = "localhost:8080";
        }

        if (winUrl.indexOf("nodename") >= 0) {
            nodeName = winUrl.split("nodename=")[1]
        } else {
            nodeName = "";
        }
        if (winUrl.indexOf("deviceid") >= 0) {
            deviceID = winUrl.split("deviceid=")[1];
            if (deviceID.indexOf("&") >= 0) {
                deviceID = deviceID.split("&")[0];
            }
        } else {
            deviceID = "0";
        }
        if (winUrl.indexOf("cp") >= 0) {
            cp = winUrl.split("cp=")[1];
            if (cp.indexOf("&") >= 0) {
                cp = cp.split("&")[0];
            }
        } else {
            cp = "wisepeak";
        }
        if (winUrl.indexOf("comname") >= 0) {
            if (winUrl.split("comname=")[1].indexOf("&") >= 0) {
                comname = winUrl.split("comname=")[1].split("&")[0];
            } else {
                comname = winUrl.split("comname=")[1];
            }
        } else {
            comname = "慧峰科技股份有限公司";
        }

        var appraisetimer = "";
        var oldData = "";
        $(function () {

            document.onselectstart = function () { return false; };
            $(".headLeft span").html(decodeURI(comname))
            getWinID();
            getUserInfo();
            setInterval("getUserInfo()", 3000);



            //setInterval("orHaveEvaluated()", 5000);

            $(".headLeft img").css("marginLeft", ($(".headLeft").width() - $(".headLeft img").width() - $(".headLeft span").width()) / 2);
            $("#content").css("height", $("body").height() - $("#head").height() - $(".topImg").height() - $("#main").height());
            $(".mainContent").css("height", $("#content").height() - 50);
            appraisetimer = setInterval("getWinID()", 2000);
            //setTimeout(function () {
            //    $(".appraiseImg img").css("marginTop", ($(".appraiseDiv .appraiseImg").height() - $(".appraiseImg img").height()) / 2 + "px");
            //}, 200);

            $(".defaultRight").css("lineHeight", $(".defaultRight").height() + "px");
        })
        //测试评价这个之后要删除的
        function clickApprase() {
            $.ajax({
                //url: "API/Bank_CallAPI.ashx?type=EvaluationDocking&rand=" + Math.random(999),
                url: "http://10.161.100.181:8010/getno?workNo=1006&evaluateUrl=http://172.25.79.59:8088/CurrencyEvaluate/Evaluate?userid=1006&rand=" + Math.random(999),
                type: "post",
                dataType: "text",
                //data: {
                //    "workNo": "1006",
                //    "evaluateUrl": "http://172.25.79.59:8088/CurrencyEvaluate/Evaluate?userid=1"
                //},
                success: function (data) {

                },
                error: function (a) {

                }
            })
        }
        //根据单位号和userid得到工号id,启动评价的时候需要用到
        var webid = "";
        function getWebid(userid) {
            $.ajax({
                //url: "API/Bank_CallAPI.ashx?type=EvaluationDocking&rand=" + Math.random(999),
                //url: "http://10.161.100.181:8010/Evaluation?com="+cp+"&userid="+userid+"&rand=" + Math.random(999),
                url: "http://10.161.100.181:8010/Evaluation?rand=" + Math.random(999),
                type: "get",
                dataType: "json",
                data: {
                    "com": cp,//单位号
                    "userid": userid//userid
                },
                success: function (data) {
                    if (data != "") {
                        //alert(data[0].webid)
                        //var webid = data[0].webid;
                        webid = data[0].webid;
                        getAppraseUrl(webid);
                        //getAppraseDivOrClose(webid);
                    }
                },
                error: function (a) {

                }
            })
        }

        //根据工号获取评价地址 
        var olddata = "";
        function getAppraseUrl(webid) {
            $.ajax({
                //url: "API/Bank_CallAPI.ashx?type=EvaluationDocking&rand=" + Math.random(999),
                url: "http://10.161.100.181:8010/Evaluation?rand=" + Math.random(999),
                type: "get",
                dataType: "text",
                data: {
                    "webid": webid//工号
                },
                success: function (data) {
                    if (olddata != data) {
                        olddata = data;
                        var data = eval("(" + data + ")");
                        if (data.success) {
                            if (data.message == webid) {//不需要评价，此时需要关闭评价弹框
                                appraseFrameOrOpen = 0;
                                $(".newAppraiseFrame").fadeOut(500);
                            } else {//需要评价 
                                appraseFrameOrOpen = 1;
                                $(".newAppraiseFrame").fadeIn(500);
                                var appraseNewUrl = (data.message).split(";")[1]
                                //$("#newAppraiseMain").load(appraseNewUrl);
                                $("#appraseIframe").attr("src", appraseNewUrl);
                            }
                        } else {//不需要评价
                            appraseFrameOrOpen = 0;
                            $(".newAppraiseFrame").fadeOut(500);
                        }
                    }
                },
                error: function (a) {

                }
            })
        }
        //根据工号判断评价弹框是否关闭--改成用来清数据
        function getAppraseDivOrClose(webid) {
            if (appraseFrameOrOpen == 1 && webid != "") {
                $.ajax({
                    // url: "API/Bank_CallAPI.ashx?type=EvaluationDocking&rand=" + Math.random(999),
                    url: "http://10.161.100.181:8010/Evaluation?rand=" + Math.random(999),
                    type: "get",
                    dataType: "json",
                    data: {
                        "Gwebid": webid//工号
                    },
                    success: function (data) {
                        if (data.success) {
                            if (data.message == webid) {//不需要评价，此时需要关闭评价弹框
                                $(".newAppraiseFrame").fadeOut(500);
                                olddata = "";
                            } else {//需要评价
                                $(".newAppraiseFrame").fadeIn(500);
                            }

                        } else {

                        }
                    },
                    error: function (a) {

                    }
                })
            }
        }

        //检测评价状态-2022-4-2号新加的
        // var orFirstEvaluate=1;//检测是否是第一次评价，=1是第一次
        //function orHaveEvaluated() {//检测是否启动评价
        //    if (webid != "") {
        //        $.ajax({
        //            url: "API/Bank_CallAPI.ashx?type=EvaluationDocking&rand=" + Math.random(999),
        //            type: "get",
        //            dataType: "json",
        //            data: {
        //                "webid": webid//工号id
        //            },
        //            success: function (data) {
        //                if (data == 1) {//启动评价
        //                    timeLoop = setInterval("timeDo()", 1000);
        //                    bf('music1');
        //                    //$(".defaultRight").hide();
        //                    //$(".mainRightContent").show();
        //                    $("#statusFlg").val("1");
        //                    $(".newAppraiseFrame").load("http://192.168.1.145:8090/Module/BankCall/Dongcheng/newappraise.aspx?sourceurl=192.168.1.179:8080&deviceid=5&cp=wisepeak&comname=%E5%BE%B7%E8%83%9C%E8%A1%97%E9%81%93%E6%94%BF%E5%8A%A1%E6%9C%8D%E5%8A%A1%E4%B8%AD%E5%BF%83")
        //                } else {
        //                    $(".defaultRight").show();
        //                    $(".mainRightContent").hide();
        //                }
        //            },
        //            error: function (a) {

        //            }
        //        })
        //    }
        //}

        function clickImg(thisImg) {
            clearInterval(timeLoop);
            time = closeTimer;
            var dataType = $(thisImg).find("img").attr("data-Type");
            sedAppraise(dataType);
            bf('music2');
            //评价完成后更改评价状态
            //evaluateState = 2;
            //gbEvaluteState(2)
        }

        //function gbEvaluteState(state) {//改变评价状态
        //    //evaluateState = 2;
        //    $.ajax({
        //        url: "API/Bank_CallAPI.ashx?type=evaluate&rand=" + Math.random(999),
        //        type: "get",
        //        dataType: "json",
        //        data: {
        //            "state": state
        //        }, success: function (data) {


        //        }, error: function (a) {

        //        }
        //    })
        //}
        function getUserInfo() {
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                //url:"http://192.168.1.10:8080/wpqueuedata.asp?wpqueuedata=douserlogin&devid=5&cp=wisepeak&wnduser=1001",
                type: "get",
                dataType: "json",
                data: {
                    "wpqueuedata": "userlogin",
                    "devid": deviceID,
                    "cp": cp,
                    "utf8": "1"
                }, success: function (data) {

                    var datastr = data;
                    if (datastr != "") {
                        var userid = datastr.wpqueuelogin[1].userid;
                        getWebid(userid);//得到工号id以及判断是否需要评价

                        if (datastr.wpqueuelogin[0].result == "200 OK") {
                            if (JSON.stringify(oldData) != JSON.stringify(datastr)) {
                                var logStatus = datastr.wpqueuelogin[1].wndstatus;
                                if (logStatus == "0") {
                                    $(".mlName").html("");
                                    $(".mlWork").html("");
                                    $(".workerPic").attr("src", "");
                                    oldImg = "";


                                } else {
                                    var username = datastr.wpqueuelogin[1].username;
                                    var wnduser = datastr.wpqueuelogin[1].wnduser;
                                    var business = datastr.wpqueuelogin[1].business;
                                    var userpic = datastr.wpqueuelogin[1].userpic;
                                    var fullname = datastr.wpqueuelogin[1].fullname;
                                    //$(".mlName").html(username);
                                    $(".mlName").html(fullname);
                                    $(".mlWork").html(wnduser);
                                    //$(".mlService").html(business);
                                    if (oldImg != userpic) {
                                        $(".workerPic").attr("src", "http://" + sourceUrl + "/" + userpic);
                                        oldImg = userpic;
                                    } else {
                                    }
                                }

                            }
                            oldData = datastr;
                        } else {
                            $(".mlName").html("");
                            $(".mlWork").html("");
                            $(".workerPic").attr("src", "");
                            oldImg = "";
                        }
                    }

                }, error: function (a, b, c) {
                    console.log(a, b, c)
                }
            })
            //setTimeout(function () {
            //    $(".workerPic").css("marginTop", ($(".imgTopLeft").height() - $(".workerPic").height()) / 2 + "px");

            //}, 100);
        }
        var mu1Count = 0;
        var testCount = 0;
        function getWinID() {
            // var checkcode = md5("wpqueuedata=winquery&node=" + nodeName + "&utf8=1&devid=" + deviceID + "&json=&cp=" + cp)
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "text",
                data: {
                    "wpqueuedata": "winquery",
                    "node": nodeName,
                    "utf8": "1",
                    "devid": deviceID,
                    "retbusiness": "1",
                    "json": "",
                    "cp": cp
                    //, "checkcode": checkcode
                }, success: function (data) {
                    var dataStr = $(data);
                    var newDataStr = "";
                    var statusPar = parseInt(dataStr.find("lv1").attr("status"));
                    $("#appraiseFlg").val(dataStr.find("tdi").eq(6).text());
                    winID = dataStr.find("tdi").eq(5).text();//获取窗口ID
                    $(".winName").text($(data).find("lv1").attr("id"));
                    //判断当前窗口是否是暂停办理业务的状态，若是暂停，判断是否有评价数据，若有评价数据则直接提交
                    if (parseInt(statusPar / 100) == 1) {
                        //百位为1表示暂停--由业务员设置
                        if (dataStr.find("tdi").eq(6).text() == "1") {
                            // alert("百位为1表示暂停--由业务员设置");
                            sedAppraise(0);
                        }
                        //if (evaluateState != 1) {
                        //    //$(".mainRightContent").hide();
                        //    $(".defaultRight").show();
                        //} else {
                        //    $(".defaultRight").hide();
                        //}
                        $("#statusFlg").val("0");
                        $(".defaultRight p").html("暂停业务");
                        newDataStr = "";

                    } else {
                        $(".defaultRight p").html("欢迎光临");
                        if (statusPar % 100 == 3 || statusPar % 100 == 4 || statusPar % 100 == 6) {
                            //顺呼或则重呼
                            //3表示登录正常呼叫下一条中（请xxx到窗口nnn办理业务。显示15秒后转正在办理内容。5秒钟后可重复按键，3次内（15秒内）只能叫同一个号；3次后，或者15秒后，可叫下一个号。如果想多次呼叫，可用重呼键），
                            //4登录正常表示办理中（xxx正在办理业务）
                            //6表示重呼中（同3呼叫--但号不变）
                            //在此程序中以上三种状态使用同一种处理方式
                            var nowDate = Date.parse(new Date());
                            var oldDate1 = (dataStr.find("tdi").eq(7).text()).replace('-', '/').replace('-', '/');
                            var oldDate = Date.parse(oldDate1);
                            //增加倒计时显示窗口名称功能，3分钟后隐藏呼叫信息，显示窗口名称
                            if (nowDate - oldDate <= 60 * 3 * 1000) {
                                var nowName = dataStr.find("tdi").eq(0).text();
                                var nowTag = dataStr.find("tdi").eq(1).text();
                                var nowWinName = dataStr.find("tdi").eq(2).text();
                                var nameStr = "";

                                if (nowName != "") {
                                    if (nowName.indexOf(",") >= 0) {
                                        if (nowName.split(",")[1] == "") {
                                            // $(".defaultRight p").html("欢迎光临");
                                        } else {
                                            nameStr = nowName.split(",")[1];
                                            newDataStr = "请" + nameStr + "办理业务";
                                            if (nowName.split(",")[1] != "") {
                                                // switchType("CallNumber", newDataStr + "," + statusPar, 200, switchtype);

                                                $(".defaultRight p").html(newDataStr);
                                            }
                                        }
                                    } else {
                                        nameStr = nowName;
                                        newDataStr = "请" + nameStr + "办理业务";
                                        //switchType("CallNumber", newDataStr + "," + statusPar, 200, switchtype);
                                        $(".defaultRight p").html(newDataStr);
                                    }
                                }
                                console.log(newDataStr)
                            }
                        }
                        if (dataStr.find("tdi").eq(6).text() == "0" || dataStr.find("tdi").eq(6).text() == "3") {
                            // testCount++;
                            // $("#testaaa").html(testCount+"_" + dataStr.find("tdi").eq(6).text() + "_" + $("#statusFlg").val());
                            if ($("#statusFlg").val() == "1") {
                                // alert("2_" + dataStr.find("tdi").eq(6).text())
                                //  alert("下一哦条");
                                sedAppraise(0);
                            } else {

                            }
                            //if (evaluateState != 1) {
                            //    //$(".mainRightContent").hide();
                            //    $(".defaultRight").show();
                            //    $("#statusFlg").val("0");
                            //} else {
                            //    $(".defaultRight").hide();
                            //}


                        } else if (dataStr.find("tdi").eq(6).text() == "1") {
                            //启动评价
                            if (timeLoop == "") {
                                timeLoop = setInterval("timeDo()", 1000);
                                bf('music1');
                                $(".defaultRight").hide();
                                $(".mainRightContent").show();
                                $("#statusFlg").val("1");
                            }
                        } else if (dataStr.find("tdi").eq(6).text() == "2") {
                            //启动评价的状态，同时访问过边缘计算中心
                            if (timeLoop == "") {
                                timeLoop = setInterval("timeDo()", 1000);
                                bf('music1');
                                //bf('music2');
                                /*   getSound("请您对本次服务进行评价")*/
                                //appraiseID = data.Table[0].ID;
                                $(".defaultRightt").hide();
                                $(".mainRightContent").show();
                                $("#statusFlg").val("1");
                            }

                        }
                        $(".appraiseImg span").css("lineHeight", ($(".appraiseImg").height() - 30) + "px");
                    }


                }, error: function (a) {
                }
            })
        }

        function timeDo() {
            time--;
            if (time == 0) {
                clearInterval(timeLoop);
                time = timeCounter;
                // alert("超时");
                sedAppraise(0);
            }
        }

        //音频播放暂停
        // var flag = true;
        function bf(musicID) {
            var audio = document.getElementById(musicID);
            //console.log(audio)
            //if (flag) {
            //    audio.play();// 这个就是播放
            //}
            //flag = false;
            if (audio !== null) {
                //检测播放是否已暂停.audio.paused 在播放器播放时返回false.
                if (audio.paused) {
                    // alert(audio.paused);
                    audio.play();// 这个就是播放
                    audio.muted = false;
                } else {
                    audio.pause();// 这个就是暂停
                    audio.load();//此处重新加载，保证下一次加载音频时从头开始播放
                }
            }
        }
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
        function sedAppraise(thisType) {
            //debugger;
            var rnd = Math.random(999);
            var checkcode = md5("rnd=" + rnd + "&wpqueuedata=evalue&towin=" + winID + "&value=" + thisType);
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "text",
                data: {
                    "rnd": rnd,
                    "wpqueuedata": "evalue",
                    "towin": winID,
                    "value": thisType,
                    "checkcode": checkcode
                }, success: function (data) {
                    if (data.indexOf("OK") >= 0) {
                        //getSound("谢谢");
                        clearInterval(appraisetimer);
                        clearInterval(timeLoop);
                        timeLoop = "";
                        bf();
                        if (evaluateState != 1) {
                            //$(".mainRightContent").hide();
                            $(".defaultRight").show();
                            $("#statusFlg").val("0");
                        } else {
                            $(".defaultRight").hide();
                        }

                        time = 20;
                        appraisetimer = setInterval("getWinID()", 2000);
                    }
                }, error: function (data) {
                }
            })
            // appraisetimer = setInterval("getWinID()", 1000);
        }
        function errImg(thisImg) {
            $(thisImg).attr("src", "images/default.jpg");
        }

        function closeAppraise() {
            $(".newAppraiseFrame").fadeOut(500);
            //模拟关闭评价，需要删除后期
            $.ajax({
                //url: "API/Bank_CallAPI.ashx?type=EvaluationDocking&rand=" + Math.random(999),
                url: "http://10.161.100.181:8010/getno?workNo=1006&rand=" + Math.random(999),
                type: "post",
                dataType: "text",
                //data: {
                //    "workNo": "1006",
                //    "evaluateUrl": "http://172.25.79.59:8088/CurrencyEvaluate/Evaluate?userid=1"
                //},
                success: function (data) {
                    if (data.success) {
                        //if()
                        $(".newAppraiseFrame").fadeOut(500);
                    }
                },
                error: function (a) {

                }
            })
            getAppraseDivOrClose(webid);
        }
    </script>

</body>
</html>
