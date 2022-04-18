<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TagClassification1.aspx.cs" Inherits="Web.Module.BankCall.TagClassification1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <style>
        * {
            list-style: none;
            margin: 0px;
            padding: 0px;
            color: #ffffff;
            font-family: '微软雅黑';
            text-decoration: none;
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            -khtml-user-select: none;
            user-select: none;
        }
        #mainContent {
            width: 80%;
            height: 100%;
            margin-left: 10%;
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
        }
        #topLogo .leftLogo img {
            height: 100%;
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
        #mainProgress {
            width: 100%;
            box-sizing: border-box;
        }

        #mainProgress .progressTitle {
            width: 100%;
            height: 60px;
            padding: 0 1%;
            box-sizing: border-box;
        }
        #mainProgress img {
            display: block;
            /*height: 160px;*/
            margin: 0 auto;
            max-height: 160px;
            width: 100%;
        }
        #mainProgress .progressName {
            display: block;
            width: 39%;
            float: left;
        }
        #mainProgress .progressName:first-child {
            margin-right: 22%;
        }
        #mainProgress .progressName p {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
            text-align: center;
            max-width: 120px;
        }
        #mainProgress .progressName span {
            display: block;
            width: 100%;
            font-size: 24px;
            line-height: 30px;
        }
        #mainList {
            width: 100%;
        }
        #tagName {
            height: 100%;
            margin: 0 auto;
        }
        #tagName li {
            display: block;
            width: 30%;
            height: 66px;
            float: left;
            margin-left: 5%;
            text-align: center;
            border-radius: 10px;
            font-size: 34px;
            margin-top: 30px;
            line-height: 66px;
            overflow: hidden;
            background-image: linear-gradient(#4288d0, #60a3d3);
            box-shadow: 3px 3px 3px #493e3e;
        }
        #tagName li:first-child {
            margin-left: 0;
        }
        #tagName li a {
            display: block;
            width: 100%;
            height: 100%;
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
        .gobackBtn {
            font-size: 36px;
            height: 66px;
            width: 240px;
            line-height: 66px;
            margin-top: 8px;
            float: right;
            text-align: center;
            /*background-image: linear-gradient(#4288d0, #60a3d3);*/
            box-shadow: 3px 3px 3px #493e3e;
            border-radius: 10px;
            background: #0f7bea;
        }
        #topTripShadow {
            background: #fff;
            margin-left: 25%;
            top: 0;
            bottom: 0;
            width: 800px;
            height: 500px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -250px 0 0 -400px;
            border-radius: 20px;
            display: none;
            background-size: 100% 100%;
            min-width: 420px;
            max-width: 800px;
        }
        .shadowHead {
            height: 80px;
            width: 100%;
            background: #0077c0;
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
            margin-left: 20px;
        }
        .shadowHead .leftImg {
            height: 100%;
            width: 300px;
            box-sizing: border-box;
            margin-left: 20px;
            float: left;
        }
        .shadowHead .leftImg img {
            float: left;
            height: 50px;
            margin-top: 15px;
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
            height: 420px;
            display: block;
        }
        .bottomContent {
            display: block;
            width: 90%;
            height: 100%;
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
    </style>
    <script>
        //http://192.168.1.145:8090/Module/HFhuixinbi/Bankcall/Parent.aspx?targetUrl=192.168.1.10:8081&sourceUrl=192.168.1.10:8080#
        var names = "";
        var switchs1 =<%=ConfigurationManager.AppSettings["switch"]%>;
        var names = "";
        var timer = 30;//设置倒计时时间
        var carTimer = "";
        var tagname = "";
        var getwaitTime = "";
        var winUrl = window.location.href;
        winUrl = winUrl.toLocaleLowerCase();
        var sourceUrl = "";
        var targetUrl = "";
        var timeClickTimer = 45 * 1000;//设置倒计时，超过时间返回首页
        var timeFun = "";
        var closeStr = "";
        var cp = "wisepeak";//单位号

        // debugger;s
        if (winUrl.indexOf("sourceurl") >= 0) {

            sourceUrl = winUrl.split("sourceurl=")[1].split(":")[0] + ":8080"
        } else {
            sourceUrl = "localhost:8080";
        }
        if (winUrl.indexOf("targeturl") >= 0) {

            targetUrl = winUrl.split("targeturl=")[1].split(":")[0] + ":8081"
        } else {
            targetUrl = "localhost:8081";
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
        timeFun = setTimeout(function () {
            $("#conLoad").html("");
            $("#conLoad").load('callNumber.aspx');
            clearInterval(getwaitTime);
            clearTimeout(timeFun);
        }, timeClickTimer)
        ////http://192.168.1.145:8090/Module/HFhuixinbi/Bankcall/Parent.aspx?sourceUrl=192.168.10.128:8080

        $(function () {
            $("#mainList").css("height", winH - $("#topLogo").height() - $("#mainProgress").height());
            $("#mainList .tagList").css("width", $("#mainProgress img").width() + "px");
            $("#mainProgress img").css("paddingTop", ($("#mainProgress").height() - $("#mainProgress img").height()) / 2 + "px");
            $("#tagName").css("height", $("#mainList").height() - $(".mainTitleList").height());
            $(".mainTitle").html('> ' + TagName)
            GetSelectTagAll();
            getwaitTime = setInterval(function () {
                tagWaitNum($("#conLoad").attr("tagStr"));
            }, 2000)
            //禁止在页面中选择
            document.onselectstart = function () { return false; };
            getDate();
            setInterval("getDate()", 1000);

        })

        //200 OK[等待人数查询成功！]-% s -% d -% s，后面分别为：业务名 - 队列还剩多少人; 业务名 - 队列还剩多少人; 业务名 - 队列还剩多少人
        //http://192.168.10.128:8080/wpqueuedata.asp?wpqueuedata=businessquery&utf8=0&node=200&retqueue=1&json=1&cp=wisepeak
        function GetSelectTagAll() {

            $.ajax({
                type: "get",
                url: "API/Bank_CallAPI.ashx",
                dataType: "text",
                data: {
                    "wpqueuedata": "TagSelectAll",
                    "node": TagName,
                    "cp": cp,
                    "json": 1,//1为获取json，0为获取xml
                    "retqueue": 1//1为获取全部数据，0为获取部分数据
                }, success: function (data) {
                    //"m_d1": "状态",
                    //"m_d2": "优先级",
                    //"m_d3": "等待人数"
                    var count = 1;
                    var str = "";
                    var tagStr = "";
                    var Count = JSON.parse(data);
                    data = Count.tbis[0];
                    names = "";
                    for (var i = 0; i < data.lv1data.length; i++) {
                        names += "" + data.lv1data[i].triid + "" + ";";
                        if (Count.tbis[0].lv1data[0].tridata[0].m_d1 == "0") {
                            str += "<li data-name='" + data.lv1data[i].triid + "' id='li_name' onclick='GetPrintingState()'><a href='#' style='color: #808080;'>" + data.lv1data[i].triid + "(0人等待)" + "</a></li>";
                        } else {// onclick='getCard(this)'
                            str += "<li data-name='" + data.lv1data[i].triid + "' id='li_name' ontouchstart='GetColor(this)' ontouchend='getCard(this)' onmousedown='GetColor(this)' onmouseup='getCard(this)'><a href='#'>" + data.lv1data[i].triid + "(0人等待)" + "</a></li>";
                        }
                        tagStr += data.lv1data[i].triid + ";"
                    }
                    $("#conLoad").attr("tagStr", tagStr);
                    $("#tagName").html(str);
                    tagWaitNum($("#conLoad").attr("tagStr"));

                }
            })
        }
        function GetColor(obj) {
            $(obj).css("background", "#d9a062");
        }
        function tagWaitNum(str) {
            var checkcode = md5("wpqueuedata=waitnum&utf8=1&node=" + str);
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "waitnum",
                    "utf8": "1",
                    "node": str,
                    "checkcode": checkcode
                }, success: function (data) {
                    var dataStr = $(data);
                    if (dataStr.find("wpretstr").text().indexOf("200") >= 0) {
                        var waitStr = dataStr.find("wpretstr").text().split("]")[1];
                        var waitArr = "";  //获取等待人数的数据               
                        if (waitStr.trim() != "") {
                            waitArr = waitStr.split(";");
                            for (var i = 0; i < $("#tagName li").length; i++) {
                                for (var j = 0; j < waitArr.length; j++) {
                                    if (waitArr[j] != "") {
                                        if ($("#tagName li").eq(i).attr("data-name") == waitArr[j].split("-")[1]) {
                                            $("#tagName li").eq(i).find("a").text($("#tagName li").eq(i).attr("data-name") + "(" + waitArr[j].split("-")[2] + "人等待)");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }, error: function (data) {
                }
            })
        }

        function getCard(thisID) {
            if ($("#topTripShadow").css("display") == "none") {
                //恢复成原来的背景颜色
                $(thisID).css("background", "linear-gradient(#4288d0, #60a3d3)")
                timer = 30;
                tagname = thisID
                clearInterval(getwaitTime);
                $("#mainProgress img").attr("src", "images/progress3.png");
                commonShadow("#topTripShadow", "温馨提示", "card", timer, "");
                closeStr = setInterval("timeCount()", 1000);
                carTimer = setInterval("getNumber()", 1000);
            }

        }
        //获取当前数据
        function getNumber() {
            clearInterval(getwaitTime);
            var rnd = Math.random(999);
            var checkcode = md5("wpreadcard=10&type=6&port=USB1&utf8=1&json=0&rnd=" + rnd);
            $.ajax({
                type: "get",
                url: "http://" + targetUrl + "/wpreadcard.asp",
                dataType: "html",
                data: {
                    "wpreadcard": "10",
                    "type": "6",
                    "port": "USB1",  //设备端口名称
                    "utf8": "1",  //utf8=0表示返回utf8编码，=1表示gb2312
                    "json": "0", //json=1表示返回json格式数据，=0表示返回XML格式的数据
                    "rnd": rnd,
                    "checkcode": checkcode
                },
                success: function (data) {
                    //判断卡号是否相同
                    // debugger;
                    var thisCard = "";
                    //timer--;
                    if (data.indexOf("xml") >= 0 || data.indexOf("XML") >= 0) {
                        if ($(data).find("tdi").eq(0).text().indexOf("FAIL") >= 0 | $(data).find("tdi").eq(0).text().indexOf("Failure") >= 0 || $(data).find("tdi").eq(5).text().indexOf("FAIL") >= 0 | $(data).find("tdi").eq(5).text().indexOf("Failure") >= 0) {
                            if (timer <= 0) {
                                clearInterval(carTimer);
                                $(".commonShadowContent").remove();
                                timer = 30;
                                commonShadow("#topTripShadow", "温馨提示", "tip", timer, "读取信息失败");
                                setTimeout(function () {
                                    closeShadow()
                                }, 2000);
                                getwaitTime = setInterval(function () {
                                    tagWaitNum($("#conLoad").attr("tagStr"));
                                }, 2000)
                            }
                        } else {
                            clearInterval(closeStr);
                            $("#mainProgress img").attr("src", "images/progress4.png");
                            timer = 30;
                            clearInterval(carTimer);

                            thisCard = $(data).find("tdi").eq(10).text();
                            $(".commonShadowContent").remove();
                            getWaitNum(thisCard);
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
                            closeStr = setInterval("timeCount()", 1000);
                            thisCard = data[0].cardinfo.cardno;
                            getWaitNum(thisCard);
                        }
                    }
                }, error: function (data) {
                    timer = 30;
                    clearInterval(carTimer);

                    if ($("#topTripShadow").css("display") == "block") {
                        $(".commonShadowContent").remove();

                        commonShadow("#topTripShadow", "温馨提示", "tip", timer, "读取信息失败");
                        // debugger;
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);

                    } else {
                        $(".commonShadowContent").remove();
                        commonShadow("#topTripShadow", "温馨提示", "tip", timer, "读取信息失败");
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);
                    }

                }

            })
        }

        //获取当前的等候数据
        function getWaitNum(cardID) {
            var name = $(tagname).attr('data-name');
            var rnd = Math.random(999);
            var checkcode = md5("wpqueuedata=queue&cp=wisepeak&utf8=1&t0=&t1=1&t2=&t3=&t4=&t50=" + name + "&t51=&t52=" + cardID + "&t53=&dprint=1&rnd=" + rnd)
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
                    "dprint": "1",
                    "rnd": rnd,
                    "checkcode": checkcode
                }, success: function (data) {
                    // alert("打印小票");

                    clearInterval(carTimer);
                   // alert($(data).find("wpretstr").text().split("[")[0]);
                    tagWaitNum();
                    // timer = 30;
                    closeStr = setInterval("timeCount()", 1000);
                    if (parseInt($(data).find("wpretstr").text().split("[")[0]) >= 330 && parseInt($(data).find("wpretstr").text().split("[")[0]) <= 339) {
                        if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 331) {
                            commonShadow("#topTripShadow", "温馨提示", "tip", timer, "打印机卡纸，请联系工作人员！");
                        } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 332) {
                            commonShadow("#topTripShadow", "温馨提示", "tip", timer, "打印机缺纸，请联系工作人员！");
                        } else {
                            commonShadow("#topTripShadow", "温馨提示", "tip", timer, "数据处理失败，请联系工作人员！");
                        }
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);

                    } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 307) {
                        commonShadow("#topTripShadow", "温馨提示", "tip", timer, "今日号已发完！");
                        //   $("#topTripShadow p").html("系统访问频繁，请稍后刷卡！");
                        console.log(5)
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);
                    } else if (parseInt($(data).find("wpretstr").text().split("[")[0]) == 309) {
                        commonShadow("#topTripShadow", "温馨提示", "tip", timer, "系统访问频繁，请稍后刷卡！");
                        //   $("#topTripShadow p").html("系统访问频繁，请稍后刷卡！");
                        console.log(5)
                        setTimeout(function () {
                            closeShadow()
                        }, 2000);
                    } else {
                        timer = 15;
                        //clearInterval(closeStr);
                        commonShadow("#topTripShadow", "温馨提示", "print", 15, "");
                        setTimeout(function () {
                            closeShadow()
                        }, 3000);
                        console.log(4);
                    }
                    getwaitTime = setInterval(function () {
                        tagWaitNum($("#conLoad").attr("tagStr"));
                    }, 2000)
                }, error: function (a) {
                   // alert("a_" + a);
                    timer = 30;
                    setTimeout(function () {
                        closeShadow();
                    }, 2000);
                }
            })
        }
        function img_li() {
            clearTimeout(timeFun);
            $("#conLoad").html("");
            $("#conLoad").load('callNumber.aspx');
            clearInterval(getwaitTime);
            clearInterval(carTimer);
            console.log(timeClickTimer);
            clearInterval(closeStr);

        }
        function GetPrintingState() {
            $("#topTripShadow").show();
            commonShadow("#topTripShadow", "温馨提示", "tip", timer, "此业务暂不可办理！");
            setTimeout(function () {
                closeShadow();
            }, 3000)
        }
        //关闭弹窗
        function closeShadow() {
            $("#mainProgress img").attr("src", "images/progress2.png");
            console.log(11);
            clearInterval(carTimer);
            clearInterval(closeStr);
            $(".commonShadowContent").remove();
            timer = 30;
            $("#topTripShadow").hide();

            clearInterval(getwaitTime);

            getwaitTime = setInterval(function () {
                tagWaitNum($("#conLoad").attr("tagStr"));
            }, 2000)
        }
        function timeClick() {
            //冒泡方式实现点击最里层，同时触发外层
            clearTimeout(timeFun);
            timeFun = setTimeout(function () {
                $("#conLoad").html("");
                $("#conLoad").load('callNumber.aspx');
                clearInterval(getwaitTime);

            }, timeClickTimer)

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
        function timeCount() {
            debugger;
            // alert(countTime)
            //打印时传的值为15，不传值时默认为是之前设置的timer

            timer--;
            console.log(timer);
            if (timer < 0) {
                $("#mainProgress img").attr("src", "images/progress2.png");
                $(".commonShadowContent").remove();
                timer = 30;
            } else {
                $(".timerClass").html(timer + "s");
            }

        }
    </script>
</head>
<body>
    <form id="form2" runat="server" onclick="timeClick()" style="width: 100%; height: 100%;">

        <div id="mainContent">
            <div id="topLogo">
                <div class="leftLogo">
                    <img src="images/getNumLogo.png" />
                </div>
                <div class="rightTime">
                    <p class="rightH"></p>
                    <p class="rightD"></p>
                </div>
            </div>
            <div id="mainProgress">
                <img src="images/progress2.png" />

            </div>
            <div id="mainList">
                <div class="mainTitleList">
                    <span class="mainTitle"></span>
                    <span class="gobackBtn" onclick='img_li()'>返回上一层</span>
                </div>
                <ul id="tagName">
                </ul>
            </div>
        </div>
    </form>
    <div id="topTripShadow" onclick="timeClick()">
        <div class="shadowHead">
            <div class="leftImg">
                <img src="images/getNumTip.png" />
                <span>温馨提示</span>
            </div>
            <div class="closeShadow" align="right">
                <img src="images/closeShadow.png" onclick="closeShadow()" />
            </div>

        </div>
    </div>
</body>
</html>
