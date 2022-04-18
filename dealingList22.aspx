<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dealingList.aspx.cs" Inherits="Web.Module.BankCall.dealingList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <script>
        var winUrl = window.location.href;
        winUrl = winUrl.toLocaleLowerCase();
        var sourceUrl = ""; 
        var cp = "wisepeak";//单位号
        var newTime = "00:00:00";//声明一个变量用来存储上一次叫号的最晚时间
        if (winUrl.indexOf("sourceurl") >= 0) {

            sourceUrl = winUrl.split("sourceurl=")[1].split(":")[0] + ":8080"
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
            getData();
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
                    "retbusiness":"0"
                }, success: function (data) {
                    var data = eval("(" + data + ")")["tbis"];
                    var timeArr = [];
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].gettime != "") {
                                if (changTime(data[i].gettime.split(" ")[1])- changTime(newTime)>0) {
                                    var str = "请" + data[0].lv1data[0].tridata[0].m_d1 + "到" + data[i].lv1id + "窗口办理业务";
                                    showData(str);
                                    timeArr.push(changTime(data[i].gettime.split(" ")[1]));
                                }
                            }
                            
                        }
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
                        newTime = Match.max(timeArr);
                        newTime = getFormatDuringTime(newTime);
                    }
                    
                }, error: function (err) {
                    debugger;
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
                    "wptexttospeech": "",
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
            return  (h>10?h:"0"+h) + ':' + (i>10?i:"0"+i) + ':' + (s>10?s:"0"+s) ;
        }
    </script>
</body>
</html>
