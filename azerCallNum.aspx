<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="azerCallNum.aspx.cs" Inherits="Web.Module.BankCall.azerCallNum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>叫号</title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
     <link href="/css/style.css" rel="stylesheet" />
    <style>
     * {
            list-style: none;
            margin: 0px;
            padding: 0px;
            color: #fff;
            font-family: '微软雅黑';
            text-decoration: none;
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            -khtml-user-select: none;
            user-select: none;
        }
        html,body {
            background:url("images/azerBg.jpg") no-repeat;
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
        }
        #topLogo .leftLogo img {
            height: 100%;
            float:left;
        }

        #topLogo .rightTime {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
            letter-spacing:5px;
        }
        #topLogo .rightTime p {
            width: 100%;
            height: 50%;
            line-height: 84px;
            text-align: right;
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
            width: 70%;
            margin:auto;
            margin-top:90px;
        }
        #tagName {
            height: 100%;
            margin: 0 auto;
           
        }
        #tagName li {
            display: block;
            width: 50%;
            height: 130px;
            float: left;
            font-size: 34px;
            margin-top: 30px;
            line-height: 60px;
            overflow: hidden;
            letter-spacing:5px;
        }
        #tagName li:first-child {
            margin-left: 0;
        }
        #tagName li a {
            display: block;
            width: 80%;
            height: 98%;
            margin:auto;
            background:url("images/defaultBtn.png") no-repeat;
            background-size:100% 100%;
          /*background: #69a2e6;*/ /*#4890e8*/
            /*box-shadow: 3px 3px 3px #493e3e;*/
            text-align: center;
            border-radius: 10px;
        }
        #tagName li a span {
            font-size:40px;
            line-height:70px;
            display:block;
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
         .enClassName {
            font-size:30px!important;
            line-height:40px!important;
        }
    </style>    
</head>
<body>
    <form id="form1" runat="server">
       <div id="mainContent">
            <div id="topLogo">
                <div class="leftLogo">
                    <%--<span>德胜门街道公共服务大厅</span>--%>
                    <img src="images/azerLogo.png" />
                    
                </div>
                <div class="rightTime">
                    <p class="rightH"></p>
                    <p class="rightD"></p>
                </div>
            </div>
        </div>
         <div id="mainList">
             <ul id="tagName">
                 <li id="checkOut" class="dataList" onclick="checkOut()">
                     <a>
                         <span>签退</span>
                         <span class="enClassName">Check Out</span>
                     </a>
                 </li>
                 <li id="suspend" class="dataList">
                     <a>
                         <span class="chStatus">暂停</span>
                         <span class="enClassName enStatus">Pause</span>
                     </a>
                 </li>
                 <li id="li_name" class="dataList" onclick="callNum(1, this)">
                     <a>
                         <span>重呼</span>
                         <span class="enClassName">Recall</span>
                     </a>
                 </li>
                 <li id="li_name2" class="dataList" onclick="callNum(0,this)">
                     <a>
                         <span>顺呼</span>
                         <span class="enClassName">Call</span>
                     </a>
                 </li>
                 <li id="evaluate" class="dataList" onclick="pleaseEvaluate()">
                     <a>
                         <span>请评价</span>
                         <span class="enClassName">Evaluate</span>
                     </a>
                 </li>
              </ul>
        </div>
    </form>
    <script>
        var winUrl = window.location.href;
        var sourceUrl = "";
        var numTimer = "";
        var cp = "wisepeak";
        var WinID = "";
        var deviceID = 0;
        var pwd = "admin@123";//密码

        var nodeName = "";
        if (winUrl.indexOf("nodename") >= 0) {
            nodeName = winUrl.split("nodename=")[1]
        } else {
            nodeName = "";
        }
        var evaluateState= 0;//=0未评价，=1点击了请评价，=2已评价
        if (winUrl.indexOf("sourceurl") >= 0) {
            sourceUrl = winUrl.split("sourceurl=")[1].split(":")[0] + ":8080"
        } else {
            sourceUrl = "localhost:8080";
        }
        if (winUrl.indexOf("winid") >= 0) {
            if (winUrl.split("winid=")[1].indexOf("&") >= 0) {
                WinID = winUrl.split("winid=")[1].split("&")[0];
            } else {
                WinID = winUrl.split("winid=")[1];
            }
        } else {
            WinID = 0;
        }
        if (winUrl.indexOf("password") >= 0) {
            if (winUrl.split("password=")[1].indexOf("&") >= 0) {
                pwd = winUrl.split("password=")[1].split("&")[0];
            } else {
                pwd = winUrl.split("password=")[1];
            }
        } else {
            pwd = "admin@123";
        }
        if (winUrl.indexOf("cp") >= 0) {
            if (winUrl.split("cp=")[1].indexOf("&") >= 0) {
                cp = winUrl.split("cp=")[1].split("&")[0];
            } else {
                cp = winUrl.split("cp=")[1];
            }

        } else {
            cp = "wisepeak";
        }
        if (winUrl.indexOf("deviceid") >= 0) {
            if (winUrl.split("deviceid=")[1].indexOf("&") >= 0) {
                deviceID = winUrl.split("deviceid=")[1].split("&")[0];
            } else {
                deviceID = winUrl.split("deviceid=")[1];
            }
        } else {
            deviceID = 0;
        }
        var winH = document.documentElement.clientHeight;
        $(function () {
            $("#mainList").css("height", winH - $("#topLogo").height() - parseFloat($("#mainList").css("marginTop")) - parseFloat($("#mainContent").css("marginTop")));
            $("#mainList .tagList").css("width", $("#mainProgress img").width() + "px");
            $("#mainProgress img").css("paddingTop", ($("#mainProgress").height() - $("#mainProgress img").height()) / 2 + "px");
            $("#tagName").css("height", $("#mainList").height() - $(".mainTitleList").height());
            document.onselectstart = function () { return false; };
            getDate();
            setInterval("getDate()", 1000);
            //暂停
            $("#suspend").click(function () {
                if ($(".chStatus").html() == '恢复') {
                    $(".chStatus").html('暂停');
                    $(".enStatus").html('Pause');
                    pauseStatus("0");
                } else if ($(".chStatus").html() == '暂停') {
                    $(".chStatus").html('恢复');
                    $(".enStatus").html('Restart');
                    pauseStatus("1");
                }
            })
            setInterval("orHaveEvaluated()", 5 * 1000);
        })
        getDate();
        function callNum(type, thisList) {
            //type=1重呼
            //type=0顺呼
            gbEvaluteState(0);
            var nodeName = "";
            nodeName = "";
            var checkcode ="";
           
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "docall",
                    "utf8": "1",
                    "node": nodeName,
                    "repeat": type,
                    "towin": WinID,
                    "checkcode": checkcode
                }, success: function (data) {
                    //gbEvaluteState(0);
                    console.log(data);
                    if (data.indexOf("呼叫成功") < 0) {
                        TopTrip(data.split("[")[1].split("]")[0], 1);
                    } else {
                        TopTrip("呼叫成功", 1);
                    }
                    dataGetCount = setInterval(function () {

                        //getWaitNum(senList);
                    }, 2000)
                    $(thisList).attr("onclick", "");
                    setTimeout(function () {
                        $(thisList).attr("onclick", "callNum(" + type + ",this)");
                    }, 5000)

                }, error: function (a,b,c) {
                    console.log(a);
                }
            })
        }
        //暂停、继续
        //暂停：1，继续：0
        function pauseStatus(type) {
            var checkcode = "";
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "winstate",
                    "towin": WinID,
                    "state": type,
                    "checkcode": checkcode
                }, success: function (data) {
                    console.log(data);
                }, error: function (a) {
                }
            })
        }
        function checkOut() {
            $.ajax({
                type: "post",
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                async: true,
                dadaType: 'text',
                data: {
                    wpqueuedata: "douserlogout",
                    devid: deviceID,
                    cp: cp,
                    password:pwd,
                    utf8: "1"
                }, success: function (data) {
                    var data = JSON.parse(data);
                    if (data.wpqueuelogin[0].result.indexOf("200") >= 0) {
                        window.location.href = "azerLogin.aspx?sourceurl=" + sourceUrl + "&cp=" + cp + "&deviceid=" + deviceID;
                    } else {
                        TopTrip(data.wpqueuelogin[0].result, 2);
                    }
                    
                }, error: function (a, b, c) {
                }
            }) 
        }
        function pleaseEvaluate() {//请评价
            // var checkcode = md5("wpqueuedata=winquery&node=" + nodeName + "&utf8=1&devid=" + deviceID + "&json=&cp=" + cp)
            //下面的接口是和王总对接，暂时出现点问题，先注释掉
            //$.ajax({
            //    url: "http://" + sourceUrl + "/wpqueuedata.asp",
            //    type: "get",
            //    dataType: "text",
            //    data: {
            //        "wpqueuedata": "winquery",
            //        "node": nodeName,
            //        "utf8": "1",
            //        "devid": deviceID,
            //        "retbusiness": "1",
            //        "json": "",
            //        "cp": cp
            //        //, "checkcode": checkcode
            //    }, success: function (data) {
            //        var dataStr = $(data);
            //        var statusPar = parseInt(dataStr.find("lv1").attr("status"));
            //        //判断当前窗口是否是暂停办理业务的状态，若是暂停，判断是否有评价数据，若有评价数据则直接提交
            //        if (parseInt(statusPar / 100) == 1) {
            //            //百位为1表示暂停--由业务员设置
            //            if (dataStr.find("tdi").eq(6).text() == "1") {
                           
            //            }          
            //        } else {//欢迎光临
            //            if (dataStr.find("tdi").eq(6).text() == "0" || dataStr.find("tdi").eq(6).text() == "3") {
                           
            //                if ($("#statusFlg").val() == "1") {
                                
            //                } else {

            //                }
                          
            //            } else if (dataStr.find("tdi").eq(6).text() == "1") {
            //                //启动评价
                            
            //            } else if (dataStr.find("tdi").eq(6).text() == "2") {
            //                //启动评价的状态，同时访问过边缘计算中心
                           
            //            } 
            //        }
            //    }, error: function (a) {
            //    }
            //})
            //存的时间暂时是最多半个小时,半个小时如果还是没有点击评价就自动关掉 修改状态
            //var state = 0;//=0未评价，=1点击了请评价，=2已评价
            //虚拟叫号界面:点击请评价的时候需要调用这个接口；点击其他功能按钮的时候需要把state变成0
            //虚拟评价界面:需要定时轮询这个接口来确定state,当=1的时候启动评价，当已评价的时候state=2,启动评价半小时还没评价的话,就让state=0
            if (evaluateState != 2) {
                evaluateState= 1;
                gbEvaluteState(evaluateState);
            } else {
                alert("抱歉，已评价过了");
            }
            
        }
        //检测评价状态-2022-4-2号新加的
        function orHaveEvaluated() {
            $.ajax({
                url: "API/Bank_CallAPI.ashx?type=evaluate&rand=" + Math.random(999),
                type: "get",
                dataType: "json",
                success: function (data) {
                    evaluateState = data;
                },
                error: function (a) {

                }
            })
        }
        function gbEvaluteState(state) {//改变评价状态
            $.ajax({
                url: "API/Bank_CallAPI.ashx?type=evaluate&rand=" + Math.random(999),
                type: "get",
                dataType: "json",
                data: {
                    "state": state
                }, success: function (data) {


                }, error: function (a) {

                }
            })
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
    </script>
</body>
</html>
