<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TagClassification.aspx.cs" Inherits="Web.Module.BankCall.TagClassification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
 <script src="js/jquery-1.9.1.js"></script>
    <style>
        * {
            list-style: none;
            margin: 0px auto;
            padding: 0px;
            color: #ffffff;
            font-family: '微软雅黑';
            text-decoration: none;
        }

        #BoxTag {
            border: 1px solid #808080;
            height: 100%;
            width: 100%;
            background-image: url('../images/背景.jpg');
            background-repeat: no-repeat;
            text-align: center;
        }

        #tagName {
            height: 68%;
            width: 60%;
            position: relative;
        }

        #tagName #li_name {
            display: block;
            float: left;
            height: 100px;
            width: 40%;
            background-image: url('../images/按钮.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            margin-left: 4%;
            margin-top: 2%;
            font-size: 28px;
            font-size: 1.7vw;
            position: relative;
        }

        #tagName #li_name a {
            display: block;
            height: 50%;
            width: 100%;
            top: 25%;
            line-height: 100px;
        }

        .Class_tag {
            font-size: 35px;
            font-weight: 600;
        }

        #img_li {
            display: block;
            cursor: pointer;
            float: right;
            position: relative;
            width: 40%;
            background-image: url(../images/返回.png);
            background-size: 100% 100%;
            height: 70px;
            width: 100px;
        }

        img_li img {
            display: block;
            cursor: pointer;
            float: right;
            position: relative;
            background-image: url(../images/返回.png);
            background-size: 100% 100%;
            height: 70px;
            width: 100px;
        }
        #topTripShadow {
            background: #98c9fb;
            margin-left: 25%;
            top: 0;
            bottom: 0;
            width: 800px;
            height: 500px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -250px 0 0 -400px;
            border-radius: 10px;
            display: none;
        }

        #topTripShadow p {
            text-align: center;
            height: 100px;
            margin-top: 200px;
            line-height: 100px;
            font-size: 50px;
        }

        #goBack {
            display: block;
            width: 100px;
            height: 70px;
            position: absolute;
            bottom: 50px;
            right: 50px;
        }

        #goBack img {
            display: block;
            width: 30px;
            height: 30px;
            margin-top: 17px;
        }
    </style>
    <script>
        var names = "";
        var switchs1 =<%=ConfigurationManager.AppSettings["switch"]%>;
        var timer = 30;//设置倒计时时间
        var carTimer = "";
        var tagname = "";
        var getwaitTime = "";
        var winUrl = window.location.href;
        var sourceUrl = "";
        if (winUrl.indexOf("sourceUrl") >= 0) {
            sourceUrl = winUrl.split("sourceUrl=")[1]
        } else {
            sourceUrl = "localhost:8081";
        }
        //var loc = 0;
        ////http://192.168.1.145:8090/Module/HFhuixinbi/Bankcall/Parent.aspx?sourceUrl=192.168.10.128:8080

        $(function () {
            $(".Class_tag").html('> ' + TagName)

            GetSelectTagAll()
            getwaitTime = setInterval("GetSelectTagAll()", 2000);
            document.onselectstart = function () { return false; };
        })

        //200 OK[等待人数查询成功！]-% s -% d -% s，后面分别为：业务名 - 队列还剩多少人; 业务名 - 队列还剩多少人; 业务名 - 队列还剩多少人
        function GetSelectTagAll() {
            //  debugger;
            $.ajax({
                type: "post",
                url: "../API/QueueNumberAPI.ashx",
                dataType: "text",
                data: {
                    "Type": "TagSelectAll",
                    "tag": TagName
                }, success: function (data) {
                    //debugger;
                    var count = 1;
                    var str = "";
                    var Count = JSON.parse(data);
                    data = Count.Table;
                    names = "";
                    for (var i = 0; i < data.length; i++) {
                        names += "" + data[i].NameCh + "" + ";";
                        if (data[i].state == 0) {
                            str += "<li data-name='" + data[i].NameCh + "' id='li_name' onclick='GetPrintingState()'><a href='#' style='color: #808080;'>" + data[i].NameCh + "(" + data[i].count + "人等待)" + "</a></li>";//GetPrintingState(this)
                        } else {
                            str += "<li data-name='" + data[i].NameCh + "' id='li_name' onclick='getCard(this)'><a href='#'>" + data[i].NameCh + "(" + data[i].count + "人等待)" + "</a></li>";
                        }
                    }

                    $("#tagName").html(str);
                    // GetSelectTagAllCore();

                }
            })
        }
        function img_li() {
            $("#conLoad").html("");
            $("#conLoad").load('callNumber.aspx');
            clearInterval(getwaitTime);

        }
        function getCard(thisID) {
            //debugger;
            tagname = thisID

            $("#topTripShadow").show();
            $("#topTripShadow p").html("请放置身份证")
            timer = 30;
            carTimer = setInterval("getNumber()", 1000);
        }
        //获取当前数据
        function getNumber() {

            $.ajax({
                type: "post",
                url: "http://" + sourceUrl + "/wpreadcard.asp",
                dataType: "html",
                data: {
                    "wpreadcard": "10",
                    "type": "6",
                    "port": "USB1",  //设备端口名称
                    "utf8": "0",  //utf8=0表示返回utf8编码，=1表示gb2312
                    "json": "0" //json=1表示返回json格式数据，=0表示返回XML格式的数据
                },
                success: function (data) {
                    //判断卡号是否相同
                    //debugger;
                    var thisCard = "";
                    timer--;
                    if ($(data).find("tdi").eq(5).text().indexOf("FAIL") >= 0) {
                        if (timer <= 0) {
                            clearInterval(carTimer);
                            timer = 30;
                            $("#topTripShadow p").html("读取信息失败");
                            $("#topTripShadow").hide();
                            $("#topTripShadow p").html("");
                        }
                    } else {

                        $("#topTripShadow p").html("正在读取");
                        $("#topTripShadow p").html("正在打印，请取走证件");
                        timer = 30;
                        clearInterval(carTimer);
                        thisCard = $(data).find("tdi").eq(10).text();
                        //debugger;
                        getWaitNum(thisCard);
                    }


                }, error: function (data) {

                }

            })
        }
        //获取当前的等候数据
        function getWaitNum(cardID) {
            var name = $(tagname).attr('data-name');
            $.ajax({
                type: "post",
                url: "../API/QueueNumberAPI.ashx",
                dataType: "text",
                data: {
                    "Type": "TagSelectName",
                    "tag": name

                }, success: function (data) {
                    debugger
                    var Count = JSON.parse(data);
                    data = Count.Table;
                    for (var i = 0; i < data.length; i++) {
                        var name = data[0].name;
                        var CallNumber = data[0].callnumber;
                        var number = data[0].number;
                    }

                    printNumber(name, CallNumber, number);
                }
            })
        }
        //获取当前的等候数据

        //打印
        function printNumber(tagName, callNum, waitNum) {
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
                    "value5": "北京朝阳区德胜门",
                    "value6": "德胜门大厅",
                    "value7": "",
                    "value8": "",
                    "value9": "",
                    "value10": ""

                }, success: function (data) {
                    clearInterval(carTimer);
                    timer = 30;
                    if (parseInt(data) >= 330 && parseInt(data) <= 339) {
                        $("#topTripShadow p").html("数据处理失败，请联系工作人员！");
                        setTimeout(function () {
                            $("#topTripShadow").hide();
                            $("#topTripShadow p").html("");
                        }, 2000);
                    } else {
                        $("#topTripShadow").hide();
                        $("#topTripShadow p").html("");
                    }

                }, error: function (data) {

                }
            })
        }
        function GetPrintingState() {
            $("#topTripShadow").show();
            $("#topTripShadow p").html("此业务暂不可办理");
            setTimeout(function () {
                $("#topTripShadow").hide();
                $("#topTripShadow p").html("");
            }, 3000)
        }

    </script>
</head>
<body>
    <form id="form2" runat="server">
        <ul>
            <li><span class="Class_tag"></span></li>
        </ul>
        <ul id="tagName">
        </ul>
        <div id="goBack">
            <p id='img_li' onclick='img_li()' style='width: 100%; border-radius: 20%;'>
                <img src='../images/微信图片_20191203091556.png' />
            </p>
        </div>
    </form>
    <div id="topTripShadow">
        <p></p>
    </div>
</body>
</html>

