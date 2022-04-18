<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="callNumber.aspx.cs" Inherits="Web.Module.BankCall.callNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <script src="js/jquery-1.9.1.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <style>
        * {
            list-style: none;
            margin: 0;
            padding: 0;
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
            /*height:160px;*/
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

            #mainList .tag {
                height: 100%;
                margin: 0 auto;
            }

                #mainList .tag li {
                    display: block;
                    width: 35%;
                    height: 107px;
                    float: left;
                    margin-left: 10%;
                    text-align: center;
                    border-radius: 10px;
                    font-size: 40px;
                    margin-top: 30px;
                    line-height: 107px;
                    overflow: hidden;
                    background-image: linear-gradient(#4288d0, #60a3d3);
                    box-shadow: 3px 3px 3px #493e3e;
                }
    </style>
    <script>
        var countTimer = 2;
        var winUrl = window.location.href;
        var sourceUrl = "";
        var targetUrl = "";
        var numTimer = "";
        var cp = "wisepeak";
        if (winUrl.indexOf("sourceUrl") >= 0) {

            sourceUrl = winUrl.split("sourceUrl=")[1].split(":")[0] + ":8080"
        } else {
            sourceUrl = "localhost:8080";
        }
        if (winUrl.indexOf("targetUrl") >= 0) {

            targetUrl = winUrl.split("targetUrl=")[1].split(":")[0] + ":8081"
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
        var winH = document.documentElement.clientHeight;
        $(function () {

            document.onselectstart = function () { return false; };
            $("#mainList").css("height", winH - $("#topLogo").height() - $("#mainProgress").height());
            $("#mainList .tagList").css("width", $("#mainProgress img").width() + "px");
            console.log($("#mainProgress img").height());
            $("#mainProgress img").css("paddingTop", ($("#mainProgress").height() - $("#mainProgress img").height()) / 2 + "px");
            getGroupName();
            getDate();
            setInterval("getDate()", 1000);


        })
        window.onload = function () {

            $(".tag li").on("touchstart", function (e) {
                e.preventDefault();
                $(this).css("background", "#d9a062");
            })

        }
        function GetColor(obj) {
            $(obj).css("background", "#d9a062");
        }
        function GetTag(obj) {

            TagName = $(obj).find(".groupName").html();
            $("#conLoad").html("");
            $("#conLoad").load('TagClassification1.aspx?cp=' + cp + '&targetUrl=' + targetUrl + "&sourceUrl=" + sourceUrl);
            clearInterval(numTimer);

        }
        function getGroupName() {

            $.ajax({
                url: "API/Bank_CallAPI.ashx",
                type: "get",
                dataType: "text",
                data: {
                    "wpqueuedata": "SelectBankCallType",
                    "cp": cp,
                    "json": 1
                }, success: function (data) {
                    //debugger;
                    var obj = eval("(" + data + ")");
                    var objArrr = obj.tbis;
                    var str = "";

                    for (var i = 0; i < objArrr.length; i++) {
                        var childStr = "";
                        for (var j = 0; j < objArrr[i].lv1data.length; j++) {
                            if (objArrr[i].lv1data.length > 0) {
                                childStr += (objArrr[i].lv1data)[j].name + ";"
                            }

                        }
                        str += '<li id="tag" nameList="' + childStr + '"  ontouchstart="GetColor(this)" ontouchend="GetTag(this)" onmousedown="GetColor(this)" onmouseup="GetTag(this)"><span style="text-align:right" class="groupName">' + objArrr[i].lv1id + '</span><span class="waitTotalNum">(0人等待)</span></li>'
                    }
                    $(".tag").html(str);
                    clearInterval(numTimer);
                    getInterval();
                    numTimer = setInterval("getInterval()", 2000);

                }, error: function (data) {
                    console.log(data);
                }
            })
        }
        function getInterval() {
            var str = "";
            for (let k = 0; k < $(".tag li").length; k++) {
                str += "wpqueuepad;" + $(".tag li").eq(k).attr("namelist");
            }
            getTotalWait(str)
        }
        function getTotalWait(strList) {
            var checkcode = md5("wpqueuedata=waitnum&utf8=1&node=" + strList);
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "waitnum",
                    "utf8": "1",
                    "node": strList,
                    "checkcode": checkcode
                }, success: function (data) {
                    // debugger;
                    var dataStr = $(data);
                    if (dataStr.find("wpretstr").text().indexOf("200") >= 0) {
                        var waitStr = dataStr.find("wpretstr").text().split("]")[1];
                        var count = 0;
                        //var totalNum = 0;
                        if (waitStr.trim() != "") {
                            var waitArr1 = waitStr.split("0-wpqueuepad-0;");
                            for (var k = 1; k < waitArr1.length; k++) {
                                var waitArr = [];  //获取等待人数的数据 
                                if (waitArr1[k].trim() != "") {
                                    waitArr = waitArr1[k].split(";");
                                    padNum(waitArr, count);
                                    count++;
                                } else {

                                    padNum(waitArr, count);
                                    count++;
                                }
                            }
                        }
                    }

                }, error: function (data) {
                }
            })
        }
        function padNum(waitArr, countNum) {
            var typeStrArr = [];
            var totalNum = 0;
            for (var i = 0; i < waitArr.length; i++) {
                if (waitArr.length == 0) {
                    totalNum = 0;
                } else {
                    var typeArr = (waitArr[i].trim()).split("-");
                    if (typeArr[0] != "") {
                        if ($.inArray(typeArr[0], typeStrArr) >= 0) {
                            if (typeArr[0] == "0") {
                                totalNum += parseInt(typeArr[2]);
                            }
                        } else {
                            typeStrArr.push(typeArr[0]);
                            totalNum += parseInt(typeArr[2])

                        }
                    }
                }
            }
            $(".waitTotalNum").eq(countNum).html("(" + totalNum + "人等待)")
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
</head>
<body>
    <form id="form1" runat="server">
        <%--<ul class="tag">
           
        </ul>--%>
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
                <img src="images/progress1.png" />

            </div>
            <div id="mainList">
                <ul class="tag">
                </ul>
            </div>
        </div>
    </form>
</body>
</html>