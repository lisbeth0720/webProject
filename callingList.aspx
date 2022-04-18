<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="callingList.aspx.cs" Inherits="Web.Module.BankCall.callingList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
    <style>
        * {
            margin:0;
            padding:0;
        }
        ul, li {
            list-style:none;
        }
        html, body, form {
            width:100%;
            height:100%;
           
            background: #237b42;
            color: #fff;
        }
        #callingList {
            display:block;
            width:100%;
            height:100%;
        }
        #callingList ul {
            display:block;
            width:100%;
            height:100%;
            text-align:center;
        }

        #callingList ul li {
            width: 100%;
            height: 33.33%;
            position: relative;
        }
        #callingList ul li span {   
            position:absolute;
            width:100%;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
            /*font-size:18vh;*/
            font-size:9vw;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="callingList">
            <ul></ul>
        </div>
    </form>
    <script>
        //http://localhost:64213/Module/BankCall/callingList.aspx?sourceurl=192.168.1.10:8080&cp=wisepeak
        var winUrl = window.location.href;
        winUrl = winUrl.toLocaleLowerCase();
        var sourceUrl = "";
        var cp = "wisepeak";//单位号
        var newTime = "00:00:00";//声明一个变量用来存储上一次叫号的最晚时间
        if (winUrl.indexOf("sourceurl") >= 0) {
            if (winUrl.split("sourceurl=")[1].indexOf("&") >= 0) {
                sourceUrl = winUrl.split("sourceurl=")[1].split("&")[0];
            } else {
                sourceUrl = winUrl.split("sourceurl=")[1];
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
            getNowDate();
            //getData();
            setInterval("getData()", 1000);
        })
        function getData() {
            $.ajax({
                type: "get",
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                // url:"testData.json",
                dataType: "text",
                data: {
                    "wpqueuedata": "winquery",
                    "utf8": "1",
                    "node": "",
                    "json": "1",
                    "devid": "",
                    "cp": cp,
                    "retbusiness": "0"
                }, success: function (data) {
                    var data = eval("(" + data + ")")["tbis"];
                    var timeArr = [];
                    var contentStr = "";
                    var allTime = [];
                    if (data.length > 0) {
                        var tArr = [];
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].lv1data[0].tridata[0].m_d8 != "") {
                                if (changTime(data[i].lv1data[0].tridata[0].m_d8.split(" ")[1]) - changTime(newTime) > 0) {  
                                    if (data[i].lv1data[0].tridata[0].m_d5 != "") {
                                        var str = "请" + data[i].lv1data[0].tridata[0].m_d5 + "\r\n到" + data[i].lv1id + "办理业务";
                                        //contentStr += "<li>"+str+"</li>";
                                        showData(str);
                                        timeArr.push(changTime(data[i].lv1data[0].tridata[0].m_d8.split(" ")[1]));
                                    }   
                                }
                                
                                tArr.push(changTime(data[i].lv1data[0].tridata[0].m_d8.split(" ")[1]));
                                          
                            }
                            
                        }
                        tArr.forEach((el, ind) => {
                            var obj = {}
                            obj[ind] = el
                            allTime.push(obj);
                        })
                        var sortedArr = sortData(allTime);
                        console.log(sortedArr);
                        
                        for (var k = 0; k < 3; k++) {
                            var kIndex = parseInt(Object.keys(sortedArr[k])[0]);
                            contentStr += "<li><span>请" + data[kIndex].lv1data[0].tridata[0].m_d5 + "\r\n到" + data[kIndex].lv1id + "办理业务<span></li>"
                        }
                        $("#callingList ul").html(contentStr);
                        var Match = (function () {
                            var arr = null;
                            var len = 0;
                            return {
                                max: function (arr, len) {
                                    arr = arr;
                                    len = arr.length;
                                    var newArr = arr.sort();
                                    return newArr[len - 1];
                                }
                            }
                        })();
                        if (timeArr.length > 0) {
                            newTime = Match.max(timeArr);
                            newTime = getFormatDuringTime(newTime);
                        }
                        console.log(newTime);
                    }
                  

                }, error: function (err) {
                    
                }
            })
        }
        function changTime(str) {
            var hour = str.split(':')[0];
            var min = str.split(':')[1];
            var sec = str.split(':')[2];
            s = Number(hour * 3600) + Number(min * 60) + Number(sec);
            return s;
        }
        function comTime(str1, str2) {
            return changTime(str1) - changTime(str2);
        }
        function showData(showstr) {
            $.ajax({
                url: "http://localhost:8080/wptexttospeech.asp",
                type: "get",
                dataType: "xml",
                data: {
                    "wptexttospeech": " ",
                    "op": "0",
                    "libname": "",
                    "utf8": "1",
                    "speed": "0",
                    "personvolume": "",
                    "devindex": "0",
                    "mainvolume": "",
                    "speechtimes": "",
                    "speechmerit": "",
                    "speechsound": "0",
                    "disp": showstr
                },
                success: function (data) {
                    console.log(soundName);
                }
            })
        }
        function getFormatDuringTime(during) {
            var s = Math.floor(during / 1) % 60;
            during = Math.floor(during / 60);
            var i = during % 60;
            during = Math.floor(during / 60);
            var h = during % 24;
            return (h > 10 ? h : "0" + h) + ':' + (i > 10 ? i : "0" + i) + ':' + (s > 10 ? s : "0" + s);
        }
        //在数字前补0
        function padding2(num, length) {
            if ((num + "").length >= length) {
                return num;
            }
            return padding2("0" + num, length)
        }
        function getNowDate() {
            var date = new Date();
            var H = date.getHours();
            var M = date.getMinutes();
            var S = date.getSeconds();
            var timeStr = padding2(H, 2) + ":" + padding2(M, 2) + ":" + padding2(S, 2);
            newTime = timeStr;
        }
        function sortData(arr) {
            if (!Array.isArray(arr)) return;
            if (arr.length <= 1) return arr;
            var mInd = Math.floor(arr.length / 2)//中间索引
            var mVal = arr.splice(mInd, 1)[0]//中间值
            var left = [], right = [];
            arr.forEach((el, ind) => {
                if (Object.values(el)[0] > Object.values(mVal)[0]) {
                    left.push(el)
                } else {
                    right.push(el)
                }
            })
            return sortData(left).concat(mVal, sortData(right))
        }
    </script>
</body>
</html>
