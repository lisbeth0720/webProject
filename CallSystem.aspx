<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallSystem.aspx.cs" Inherits="Web.Module.BankCall.CallSystem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="../images/favicon.ico" rel="shortcut icon" />
    <title>工作人员叫号系统</title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <style>
        * {
            list-style: none;
            margin: 0px auto;
            padding: 0px;
            color: #ffffff;
            font-family: '微软雅黑';
            text-decoration: none;
        }
        html, body, #form1 {
            height: 100%;
            width: 100%;
        }
        body {
            background: url("images/背景.jpg") no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
        }
        .describe {
            height: 30%;
            width: 100%;
        }
        .title {
            height: 30%;
            font-size: 3.0vw;
            width: 99%;
            margin-top: 2%;
            text-align: center;
        }
        #business {
            height: 30%;
            width: 100%;
            position: relative;
        }
        #business select {
            height: 60%;
            width: 29%;
            position: absolute;
            top: 4%;
            left: 36%;
            display: inline-block;
            font-size: 1.2vw;
            border-radius: 0.5vw;
            color: #686262;
        }
        #business select {
            display: inline-block;
        }
        #selectLi option {
            display: block;
            font-weight: 800;
            letter-spacing: 0.4em;
            color: #686262;
            font-family: "微软雅黑";
        }
        #lastLi {
            height: 28%;
            font-size: 2.5vw;
            width: 99%;
            margin-left: 50%;
            margin-top: 2%;
        }
        #box {
            width: 100%;
            height: 69%;
            border-radius: 20px;
            position: relative;
        }
        #tag {
            background-image: url('images/11.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            position: relative;
            height: 74%;
            width: 50%;
            top: 10%;
            border-radius: 6%;
        }
        #tag li {
            width: 60%;
            height: 18%;
            background-image: url('images/按钮.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            margin-bottom: 3%;
            position: relative;
            top: 6%;
        }

        #tag li a {
            display: inline-block;
            width: 100%;
            height: 64%;
            font-size: 2.2vw;
            text-align: center;
            position: relative;
            top: 18%;
        }
        #BoxTag {
            height: 100%;
            width: 100%;
        }
        .nve {
            width: 10%;
            line-height: 5%;
            height: 5%;
            margin-top: 1%;
            border: 1px solid #d5d5d5;
            border-radius: 3px;
            position: absolute;
            right: 10%;
        }
        .nve li {
            float: left;
            height: 92%;
            line-height: 5%;
            font-size: 1.1vw;
            margin-top: 4%;
            margin-left: 5%;
            width: 6%;
        }
        .nve #username {
            cursor: pointer;
            width: 84%;
            height: 99%;
            position: relative;
            box-sizing: border-box;
            padding-top: 9%;
        }
        #username img {
            position: absolute;
            display: block;
            height: 30%;
            width: 20%;
            right: 0;
            top: 26%;
        }
        #deng {
            width: 8%;
            display: none;
            height: 5%;
            text-align: center;
            color: #686262;
            line-height: 45px;
            margin-top: -8.45%;
            font-size: 1vw;
            background-color: #edf0f0;
            cursor: pointer;
            position: absolute;
            right: 12%;
        }
    </style>
<script>
    var AllName = "";
    var Callname = "";
    var allCount = "";
    var WinID = "<%=WinID%>";
    var nums = "<%=nums %>";
    var userid = "<%=userid%>";
    var WinName = "<%=WinName%>";
    var NameCh = "";
    var winUrl = window.location.href;
    winUrl = winUrl.toLocaleLowerCase();
    var cp = "wisepeak";
    var sourceUrl = "localhost:8080";
    var getCount = 0;
    var dataGetCount = "";
    var senList = "";
    debugger;
    md5("aaaa");
    if (winUrl.indexOf("sourceurl") >= 0) {
        if (winUrl.split("sourceurl=")[1].indexOf("&") >= 0) {
            sourceUrl = ((winUrl.split("sourceurl=")[1]).split("&")[0]).split(":")[0] + ":8080"
        } else {
            sourceUrl = winUrl.split("sourceurl=")[1].split(":")[0] + ":8080"
        }
    } else {
        sourceUrl = "localhost:8080";
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
    $(function () {
        document.onselectstart = function () { return false; };
        getTotalNum();
        $(document).ready(function (e) {
            $(".nve").click(function (e) {
                $("#deng").toggle();
                e.stopPropagation(); //阻止事件冒泡，否则事件会冒泡到下面的文档点击事件 
            });
        });
        //点击文档时，隐藏语言列表 
        $(document).click(function () {
            $("#deng").hide();
        });

        $("#deng").click(function () {
            window.location.href = "Login.aspx";
        })      
        //暂停
        $("#suspend").click(function () {
            if ($("#suspend a").html() == '办 理') {
                $("#suspend a").html('暂 停');
                pauseStatus("0");
            } else if ($("#suspend a").html() == '暂 停') {
                $("#suspend a").html('办 理');
                pauseStatus("1");
            }       
        })
    })

    //获取当前窗口下所有业务
    function getTotalNum() {
        clearInterval(dataGetCount);
        var checkcode = md5("wpqueuedata=winquery&utf8=1&node=" + WinName + "&devid=&retbusiness=1&json=&cp=wisepeak");
        $.ajax({
            url: "http://" + sourceUrl + "/wpqueuedata.asp",
            type: "get",
            dataType: "text",
            data: {
                "wpqueuedata": "winquery",
                "utf8": "1",
                "node": WinName,
                "devid": "",
                "retbusiness": "1",
                "json": "",
                "cp": "wisepeak",
                "checkcode": checkcode
            }, success: function (data) {
                debugger;
                var newData = $(data);
                var dataStr = newData.find("lv1").attr("businesslist");
                var escStr = String.fromCharCode(27);//识别esc
                var strArr = [];
                var optionStr = "<option>综合业务</option>";
                var nodeList = "";
                if (dataStr.indexOf(";") >= 0) {
                    var comStrArr = dataStr.split(";");
                    if (comStrArr.length > 1) {
                        for (var i = 0; i < comStrArr.length; i++) {
                            if (comStrArr[i].split(escStr)[0] != "") {
                                strArr.push(comStrArr[i].split(escStr)[0]);
                            }   
                        }
                    } else {
                        strArr.push(comStrArr.split(escStr)[0]);
                    }
                }                
                for (var j = 0; j < strArr.length; j++) {
                    optionStr += "<option value=" + strArr[j] + ">" + strArr[j] + "</option>";
                    nodeList += strArr[j] + ";";
                }
                $("#selectLi").attr("nodeList", nodeList);
                $("#selectLi").html(optionStr);
                getWaitNum(nodeList);
                dataGetCount = setInterval(function () {
                    getWaitNum(nodeList);
                }, 2000);
                getCount++;
                console.log(strArr);
            }, error: function (a,b,c) {
                console.log(a + "_" +b+"_"+c)
            }
        })
    }
    function selectTag(thisTag) {

        clearInterval(dataGetCount);
       
        if ($(thisTag).find("option:selected").text() == "综合业务") {
            senList = $(thisTag).attr("nodelist");
        } else {
            senList = $(thisTag).find("option:selected").text();
        }
        getWaitNum(senList);
        dataGetCount = setInterval(function () {
            
            getWaitNum(senList);
        }, 2000)
    }
    function getWaitNum(strList) {
        var checkcode = md5("wpqueuedata=waitnum&utf8=1&node=" + strList.trim());
        $.ajax({
            url: "http://" + sourceUrl + "/wpqueuedata.asp",
            type: "get",
            dataType: "html",
            data: {
                "wpqueuedata": "waitnum",
                "utf8": "1",
                "node": strList.trim(),
                "checkcode": checkcode
            }, success: function (data) {
                var dataStr = $(data);
                if (dataStr.find("wpretstr").text().indexOf("200") >= 0) {
                    var waitStr = dataStr.find("wpretstr").text().split("]")[1];
                    if (waitStr.trim() != "") {
                        if (waitStr.indexOf(";") >= 0) {
                            var waitArr = waitStr.split(";");
                            padNum(waitArr);
                        } else {
                            padNum(waitStr);
                        }  
                    }
                }
            }, error: function (data) {
            }
        })
    }
    function padNum(waitArr) {
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
        $("#number").html(totalNum);
    }
    function callNum(type,thisList) {
        //type=1重呼
        //type=0顺呼
        var nodeName = "";
        if ($("#selectLi").val() == "综合业务") {
            nodeName = ""
        } else {
            nodeName = $("#selectLi").val();
        }
        var checkcode = md5("wpqueuedata=docall&utf8=1&node=" + nodeName + "&repeat=" + type + "&towin=" + WinID);
        clearInterval(dataGetCount);
        $.ajax({
            url: "http://" + sourceUrl + "/wpqueuedata.asp",
            type: "get",
            dataType: "text",
            data: {
                "wpqueuedata": "docall",
                "utf8": "1",
                "node": nodeName,
                "repeat": type,
                "towin": WinID,
                "checkcode": checkcode
            }, success: function (data) {
                console.log(data);
                dataGetCount = setInterval(function () {

                    getWaitNum(senList);
                }, 2000)
                $(thisList).attr("onclick", "");
                setTimeout(function () {
                    $(thisList).attr("onclick", "callNum(" + type + ",this)");
                },5000)
              
            }, error: function (a) {
                console.log(a);
            }
        })
    }
    //暂停、继续
    //暂停：1，继续：0
    function pauseStatus(type) {
        var checkcode = md5("wpqueuedata=winstate&towin=" + WinID + "&state=" + type);
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

            }, error: function (a) {
            }
        })
    }
    //启动评价
    function appraise() {
        var checkcode = md5("wpqueuedata=startevalue&towin=" + WinID);
        $.ajax({
            url: "http://" + sourceUrl + "/wpqueuedata.asp",
            type: "get",
            dataType: "text",
            data: {
                "wpqueuedata": "startevalue",
                "towin": WinID
            }, success: function (data) {
                console.log(data);
            }, error: function (a) {
                console.log(a);
            }
        })
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="BoxTag">
            <ul class="describe">
                <li class="title">排 队 叫 号 系 统
                </li>
                <li id="business">
                  
                    <select id="selectLi" onclick="selectTag(this)">
                       
                    </select>
                </li>
               
                <li style="margin-top: 0.1%;">
                    <hr style="height: 2%; background-color: #ffffff;" />
                </li>
                <li id="lastLi">当前等待总人数：<span id="number"><%=nums %></span>人</li>
            </ul>
            <ul class="nve" style="float: right; margin-top: -11%;">
                <li>
                    <img src="images/lv0.png" /></li>
                <% if (username.ToString().Trim() == "")
                    { %>
                <li class="user"><a href="../webFrom/Login.aspx">登录</a></li>
                <% }%>
                <%else
                    {%>
                <li style="color: #ffffff;" id="username"><span id="name"><%=username %></span>
                    <img src="images/icon_u.png" /></li>
                <%} %>
            </ul>
            <div id="deng">重新登录</div>

            <div id="box">
                <ul id="tag">
                    <li id="nextOne" onclick="callNum(0,this)"><a href="#">呼 叫 下 一 位</a></li>
                    <li id="again" onclick="callNum(1,this)"><a href="#">重 新 呼 叫</a></li>
                    <li id="suspend"><a href="#">暂 停</a></li>
                    <li id="evaluate" onclick="appraise()"><a href="#">评 价</a></li>

                </ul>
            </div>
        </div>
    </form>
</body>
</html>
