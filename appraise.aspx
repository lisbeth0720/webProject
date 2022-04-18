<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appraise.aspx.cs" Inherits="Web.Module.BankCall.appraise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="js/jquery-1.9.1.js"></script>
<script src="../../js/wpmd5.js"></script>
    <title>评价页面</title>
    <style>
    *{
        margin:0;
        padding:0;
    }
    ul, li {
        list-style:none;
    }
    html, body,form {
        width:100%;
        height:100%;
        overflow:hidden;
    }
    #appraiseBody {
       width:100%;
       height:100%;
       background:#aaa;
       position: relative;
       background:url("images/appraise.jpg");
       background-size:100% 100%;
    }
    #appraiseBody .prevtop {
        width:100%;
        height:130px;
        line-height:130px;
        font-size:50px;
        color:#fff;
        text-align:center;
        background:url("images/topPrevBg.png");
        letter-spacing:8px;
    }
    #appraiseBody .preTitle {
       /*width: 100%;*/ 
        text-align: center;
        top: 50%;
        left: 50%;
        position: absolute;
        font-size:50px;
        margin-left:-50%;
        margin-top:-50%;
    }
    .prevMain {
        width:100%;
        background:url("images/prevMainBg.png");
       background-size:100% 100%;
    }
    .commonClass {
        display:block;
        width:100%;
        height:100%;
        border: 0.1px solid #605d5d00;
    }
    #appraiseContent {
        display:none;
    }
    #prevContent p {
        text-align: center;
        line-height: 600px;
        color: #fff;
        font-size: 50px;
        letter-spacing: 8px;
    }
    .contentTop {
        height:110px;
        width:850px;
        background:url("images/appraiseBg.png");
        background-size:100% 100%;
        margin:0 auto;
        margin-top: 80px;
    }
    .contentTop p {
        width: 100%;
        height: 100%;
        text-align: center;
        line-height: 110px;
        color: #fff;
        font-size: 50px;
    }
    .contentMain {
        display:block;
        width:100%;
    }
    .contentMain ul {
        width:1200px;
        height:70%;
        margin:0 auto;
        margin-top:60px;
    }
    .contentMain ul li {
        width:25%;
        display:block;
        float:left;
    }
    .contentMain ul li img {
        width:50%;
        margin-left:25%;
    }
    .contentMain ul p {
        width:100%;
        text-align:center;
        margin-top:40px;
        font-size:50px;
        font-weight:700;
    }
    .main {
        width: 100%;
        height: 100%;
        position: absolute;
        display: none;
    }
</style>
</head>

<body>
    <form id="form1" runat="server">
        <div id="appraiseBody">
            <div class="prevtop">
                欢迎您的光临！
            </div>
           <%-- <audio id="nullAudio"></audio>
            <iframe allow="autoplay" style="display:none" src="" id="nullIframe">
               
            </iframe>--%>
             <audio id="music1" controls="controls" style="display:none;">
                    <source src="images/appraise.mp3" type="audio/mpeg" />
            </audio>
            <audio id="music2" controls="controls" style="display:none;">
                    <source src="images/thanks.mp3" type="audio/mpeg" />
            </audio>
            <div class="prevMain">
               <div class="commonClass" id="prevContent">
                   <p>欢迎使用排队叫号评价系统</p>
                </div>
                <div class="commonClass" id="appraiseContent">
                    <div class="contentTop">
                        <p>请您对本次服务进行评价</p>
                    </div>
                    <div class="contentMain">
                        <ul>
                            <li data-Type="1">
                                <img src="images/appraise1.png" />
                                <p>差</p>
                            </li>
                            <li data-Type="2">
                                <img src="images/appraise2.png" />
                                <p>一般</p>
                            </li>
                            <li data-Type="3">
                                <img src="images/appraise3.png" />
                                <p>满意</p>
                            </li>
                            <li data-Type="4">
                                <img src="images/appraise4.png" />
                                 <p>非常满意</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="main">

        </div>
    </form>
    <script>
        var winID = "";
        var appraiseID = "0";
        var time = 60;
        var timeLoop = "";
        var deviceID = "0";
        var nodeName = "";
        var sourceUrl = "";
        var winUrl = (window.location.href).toLowerCase();
        var closeTimer = 60;
        var cp = "wisepeak";
        if (winUrl.indexOf("sourceurl") >= 0) {

            sourceUrl = winUrl.split("sourceurl=")[1].split(":")[0] + ":8080"
        } else {
            sourceUrl = "localhost:8080";
        }
        //if (winUrl.indexOf("deviceid") >= 0) {

        //    deviceID = winUrl.split("deviceid=")[1]
        //} else {
        //    deviceID = "0";
        //}
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
        var appraisetimer = "";
        $(function () {
            document.onselectstart = function () { return false; }; 
            getWinID();
            $(".prevMain").css("height", $("#appraiseBody").height() - $(".prevtop").height());
            $(".contentMain").css("height", $("#appraiseContent").height() - $(".contentTop").height() - parseFloat($(".contentTop").css("marginTop")));
            appraisetimer=setInterval("getWinID()", 2000);
         
            $(".contentMain li").click(function () {
                
                clearInterval(timeLoop);
                time = closeTimer;
                debugger;
                sedAppraise($(this).attr("data-type"));
                
            })
        })
        function getWinID() {
            var checkcode = md5("wpqueuedata=winquery&node=" + nodeName + "&utf8=1&devid=" + deviceID +"&json=&cp="+cp)
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "text",
                data: {
                    "wpqueuedata": "winquery",
                    "node": nodeName,
                    "utf8":"1",
                    "devid": deviceID,
                    "retbusiness": "1",
                    "json": "",
                    "cp": cp,
                    "checkcode": checkcode
                }, success: function (data) {
                    var dataStr = $(data);
                    winID = dataStr.find("tdi").eq(5).text();//获取窗口ID
                    if (dataStr.find("tdi").eq(6).text() == "0") {
                        $("#appraiseContent").hide();
                        $("#prevContent").show();
                    } else if (dataStr.find("tdi").eq(6).text() == "1") {
                        //clearInterval(appraisetimer);
                        timeLoop = setInterval("timeDo()", 1000);
                        clearInterval(appraisetimer);
                        bf('music1');
                        //getSound("请您对本次服务进行评价");
                        //appraiseID = data.Table[0].ID;
                        $("#prevContent").hide();
                        $("#appraiseContent").show();

                    } else if (dataStr.find("tdi").eq(6).text() == "2") {
                         timeLoop = setInterval("timeDo()", 1000);
                        clearInterval(appraisetimer);
                        bf('music1');
                        bf('music2');
                     /*   getSound("请您对本次服务进行评价")*/;
                        //appraiseID = data.Table[0].ID;
                        $("#prevContent").hide();
                        $("#appraiseContent").show();
                    }
                }, error: function (a) {
                }
            })
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
                    if (data.indexOf("OK")>=0) {
                        //getSound("谢谢");
                        bf();
                        $("#appraiseContent").hide();
                        $("#prevContent").show();
                    }
                }, error: function (data) {
                }
            })
            appraisetimer = setInterval("getWinID()", 1000);
        }
        function getSound(str) {
            var checkcode = md5("wptexttospeech=" + str + "&op=0&libname=&utf8=1&speed=0&personvolume=&devindex=0&mainvolume=&speechtimes=&speechmerit=&speechsound=");
            $.ajax({
                url: "http://" + sourceUrl+":8081/wptexttospeech.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wptexttospeech": str,
                    "op": "0",
                    "libname": "",
                    "utf8": "1",
                    "speed": "0",
                    "personvolume": "",
                    "devindex": "0",
                    "mainvolume": "",
                    "speechtimes": "",
                    "speechmerit": "",
                    "speechsound": "",
                    "checkcode": checkcode
                },
                success: function (data) {
                   
                }
            })
        }
        function timeDo() {
            time--;
            if (time == 0) {
                clearInterval(timeLoop);
                time = closeTimer;
                sedAppraise(0);
            }
        }
        //var ifm = document.getElementById("nullIframe");
        //var vdo = document.getElementById("nullAudio");
        //ifm.onload = function () {
        //    vdo.src = 'YOUR_VIDEO_URL';
        //    vdo.oncanplay = function () {
        //        vdo.play();
        //    };
        //};
        //音频播放暂停
        function bf(musicID) {
            var audio = document.getElementById(musicID);
            if (audio !== null) {
                //检测播放是否已暂停.audio.paused 在播放器播放时返回false.
                
                if (audio.paused) {
                   // alert(audio.paused);
                    audio.play();// 这个就是播放
                } else {
                    audio.pause();// 这个就是暂停
                    audio.load();//此处重新加载，保证下一次加载音频时从头开始播放
                }
            }
        }
    </script>
</body>
</html>
