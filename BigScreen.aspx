<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BigScreen.aspx.cs" Inherits="Web.Module.BankCall.BigScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../images/favicon.ico" rel="shortcut icon" />
    <title>最大的LED看板</title>
    <script src="js/jquery-1.9.1.js"></script>
    <style>
        * {
            margin: 0px auto;
            padding: 0px;
            list-style: none;
            color: red;
            text-decoration: none;
        }

        html, body, #form1 {
            height: 100%;
            width: 100%;
        }

        #box {
            height: 100%;
            width: 100%;
            background-color: #000000;
        }

        #num li {
            float: left;
            margin-left: 1%;
            margin-top: 1%;
            font-size: 2.6vw;
            font-weight: 700;
        }

        #rig {
            float: right;
            margin-left: -3%;
            margin-top: 1%;
        }

        #wait {
            width: 100%;
            /*border-top:1px solid #ffffff;*/
            padding-top: 2%;
            text-align: center;
            font-size: 1.8vw;
            overflow: hidden;
            height: 70%;
        }

            #wait li {
                margin-top: 1%;
            }
    </style>
    <script>

        window.requestAnimationFrame(getDate);
        $(function () {
            setInterval("getData()", 1000);                 
        })

        function getData() {
            $.ajax({
                type: "post",
                url: "../API/QueueNumberAPI.ashx?rand = " + Math.random(),
                dataType: "text",
                data: {
                    "Type": "SelectAllPrint"
                }, success: function (data) {
                    var str = "";
                    $("#wait").html("");
                    var Count = JSON.parse(data);
                    data = Count.Table;
                    //str += "<hr/>";
                    for (var i = 0; i < data.length; i++) {
                        //str = "";
                        str = "<li><a href='#'>" + "请 " + data[i].CallNumber + " 号 去 " + data[i].NameCh + " 办 理 业 务" + "</a></li>";
                        $("#wait").append(str);
                    }

                }
            })

        }

        function getDate() {
            window.setTimeout(function () {
                window.requestAnimationFrame(getDate)
            }, 1000 / 2)
            var d = new Date();
            var year = d.getFullYear()  //获取年
            var month = d.getMonth() + 1;  //获取月，从 Date 对象返回月份 (0 ~ 11)，故在此处+1
            var day = d.getDay()    //获取日
            var days = d.getDate() //获取日期
            var hour = addZero(d.getHours(), 2, 0)   //获取小时
            var minute = addZero(d.getMinutes(), 2, 0)  //获取分钟
            var second = addZero(d.getSeconds(), 2, 0)   //获取秒

            var week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")

            var da = year + " 年 " + month + " 月 " + days + " 日 " + week[day];

            var shi = " " + hour + " : " + minute + " : " + second
            $("#time").html(da);
            $("#shi").html(shi);
        }

        function addZero(str, len, ch) {
            str = String(str);//需要补全的变量、补全之后的长度、用什么来补全
            var i = -1;
            if (!ch && ch !== 0) ch = ' ';
            len = len - str.length;
            while (++i < len) {
                str = ch + str;
            }
            //                return str;
            return str > 0 ? str : "00";
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="box">

            <ul id="num">
                <li>中 国 银 行 欢 迎 您</li>

            </ul>
            <ul id="rig">
                <li style="text-align: center;"><span id="shi" style="font-size: 2vw;"></span>
                    <br />
                    <span id="time" style="font-size: 1.8vw;"></span></li>
            </ul>
            <div style="height: 2%; width: 100%; clear: both; margin-top: 5%;">
                <hr />
            </div>

            <ul id="wait">
            </ul>
        </div>
    </form>
</body>
</html>
