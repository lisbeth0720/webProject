<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="azerWindow.aspx.cs" Inherits="Web.Module.BankCall.azerWindow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>窗口信息</title>
    <script src="js/jquery-1.9.1.js"></script>
     <style>
        * { 
            padding: 0;
            margin: 0;
            list-style: none;
        }

        html, body, #form1 {
            width: 100%;
            height:100%;    
        }
        body {
            background-color: #0089ce;
            font-weight:bold;
        }
        .ul_numu {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .numu {
            font-size: 10vw;
            font-weight: 800;
            color: #ff0000;
        }
         ul li {
             color: #fff;
             font-size: 28px;
             text-align: center;
             /*line-height: 32px;*/
         }
         #headName {
             display: block;
             letter-spacing: 7px;
         }
        #headName span {
            display:block; 
        }
        #CallNumber {
            display: block;
            letter-spacing: 7px;
            margin-top: 40px;
            color: #011240;
        }
        #CallNumber span {
            display:block;
        }
        .chName {
            font-size:10vw;
        }
        .enName {
            font-size:5vw;
        }
        .chStatus {
            font-size: 8vw;
        }
        .enStatus {
            font-size: 5vw;
        }
     </style>
</head>
<body>
    <form id="form1" runat="server">
        <ul class="ul_numu">
            <li class="stateone" style="width:100%;height:100%;">
                <p style="width:100%;height:100%;">
                    <span id="headName">
                        
                    </span>
                    <span id="CallNumber"></span>
                </p>
            </li>
        </ul>
    </form>
    <script>
        var WiseSendInfourl = window.location.href;//获取页面附带的参数值
        WiseSendInfourl = WiseSendInfourl.toLowerCase();
        var sourceUrl = "localhost";
        var Infourl = "";
        var WinID = 0;
        var WinNametitle = "";
        var headName = "";
        var switchtype = 1;//呼叫切换类型
        var cp = "";
        var winID = "";
        var url = WiseSendInfourl.split("//module")[0];
        if (WiseSendInfourl.indexOf("deviceid") >= 0) {
            if (WiseSendInfourl.split("deviceid=")[1].indexOf("&") >= 0) {
                winID = WiseSendInfourl.split("deviceid=")[1].split("&")[0];
            } else {
                winID = WiseSendInfourl.split("deviceid=")[1];
            }

        }
        if (WiseSendInfourl.indexOf("sourceurl") >= 0) {
            if (WiseSendInfourl.split("sourceurl=")[1].indexOf("&") >= 0) {
                sourceUrl = WiseSendInfourl.split("sourceurl=")[1].split("&")[0];
            } else {
                sourceUrl = WiseSendInfourl.split("sourceurl=")[1];
            }

        }
        if (WiseSendInfourl.indexOf("headname") >= 0) {
            if (WiseSendInfourl.split("headname=")[1].indexOf("&") >= 0) {
                headName = WiseSendInfourl.split("headname=")[1].split("&")[0];
            } else {
                headName = WiseSendInfourl.split("headname=")[1];
            }

        }
        if (WiseSendInfourl.indexOf("switchtype") >= 0) {
            if (WiseSendInfourl.split("switchtype=")[1].indexOf("&") >= 0) {
                switchtype = parseInt(WiseSendInfourl.split("switchtype=")[1].split("&")[0]);
            } else {
                switchtype = parseInt(WiseSendInfourl.split("switchtype=")[1]);
            }

        }
        if (WiseSendInfourl.indexOf("cp") >= 0) {
            if (WiseSendInfourl.split("cp=")[1].indexOf("&") >= 0) {
                cp = WiseSendInfourl.split("cp=")[1].split("&")[0];
            } else {
                cp = WiseSendInfourl.split("cp=")[1];
            }

        }
        getNowData();
        $(function () {
            setInterval("getNowData()", 3000);
        })
        function getNowData() {
            var rnd = Math.random(999);
            //var checkCode = md5("wpqueuedata=winquery&utf8=1&node=&devid=" + winID +"&rnd="+rnd)
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "winquery",
                    "utf8": "1",
                    "node": "",
                    "devid": winID,
                    "rnd": rnd,
                    "cp": cp
                }, success: function (data) {
                    var data = $(data);
                    var statusPar = parseInt(data.find("lv1").attr("status"));
                    var newDataStr = "";
                    var newEnDataStr = "";
                    var chWindowName = data.find("lv1").attr("dispname");
                    var enWindowName = data.find("lv1").attr("dispnameen");
                    $("#headName").html("<span class='chName'>" + chWindowName + "</span><span class='enName'>" + enWindowName + "</span>");
                    //识别到<div id="find_no_record" align="left" />时，则说明此时无数据，转入信息发布
                    if (data.find("#find_no_record").attr("align") == "left") {
                        $("#find_no_record").attr("align", "left");
                        if (parseInt(statusPar / 100) == 1) {
                            //百位为1表示暂停--由业务员设置
                            $("#CallNumber").html("<span class='chStatus'>暂停办理业务</span><span class='enStatus'>Out Of Service</span>");

                        } else {
                            $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                        }

                    } else {

                        if (parseInt(statusPar / 100) == 1) {
                            //百位为1表示暂停--由业务员设置
                            $("#CallNumber").html("<span class='chStatus'>暂停办理业务</span><span class='enStatus'>Out Of Service</span>");

                        } else if (parseInt(statusPar / 100) == 2) {
                            //百位2业务忙(百位2)（忙，请到其它窗口办理）--由大堂经理操作设置
                            $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");

                        } else if (parseInt(statusPar / 100) == 3) {
                            //百位3转入信发--由大堂经理操作设置，可显示标题，如：中国农业银行或者欢迎光临
                            $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                        } else {
                            //去掉百位标记用恢复操作，百位置0表示恢复继续。
                            if (statusPar % 100 == 0) {
                                //窗口状态：0-未登录/登出（可显示窗口号和提示信息--信发系统定
                                // $("#CallNumber").html("欢迎光临");
                                $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                            } else if (statusPar % 100 == 1) {
                                //1-登录正常/继续（正在业务办理中或者业务等待中--信发系统定）
                                $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                            } else if (statusPar % 100 == 2) {
                                //2-登录正常空闲中（呼叫不到号或者显示超时）
                                $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                            } else if (statusPar % 100 == 5) {
                                //5表示办理完毕（按请评价时可认为办理完毕，在呼叫下一个人前可交由信发系统定播放内容）
                                $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                            } else if (statusPar % 100 == 7) {
                                //7表示弃号
                                $("#CallNumber").html("<span class='chStatus'>过号</span><span class='enStatus'>Pass Number</span>");
                               
                            } else if (statusPar % 100 == 3 || statusPar % 100 == 4 || statusPar % 100 == 6) {
                                //3表示登录正常呼叫下一条中（请xxx到窗口nnn办理业务。显示15秒后转正在办理内容。5秒钟后可重复按键，3次内（15秒内）只能叫同一个号；3次后，或者15秒后，可叫下一个号。如果想多次呼叫，可用重呼键），
                                //4登录正常表示办理中（xxx正在办理业务）
                                //6表示重呼中（同3呼叫--但号不变）
                                //在此程序中以上三种状态使用同一种处理方式
                                //if (oldData != data) {

                                var nowDate = Date.parse(new Date());
                                var oldDate1 = ($(data.find("tdi")[7]).text()).replace('-', '/').replace('-', '/');
                                var oldDate = Date.parse(oldDate1);
                                //增加倒计时显示窗口名称功能，3分钟后隐藏呼叫信息，显示窗口名称
                                if (nowDate - oldDate <= 60 * 3 * 1000) {
                                    var nowName = $(data.find("tdi")[0]).text();
                                    var nowTag = $(data.find("tdi")[1]).text();
                                    var nowWinName = $(data.find("tdi")[2]).text();
                                    var nameStr = "";

                                    if (nowName != "") {

                                        if (nowName.indexOf(",") >= 0) {
                                            if (nowName.split(",")[1] == "") {
                                                $("#CallNumber").html(data.find("lv1").attr("id"));
                                            } else {
                                                nameStr = nowName.split(",")[1];
                                                newDataStr = "请" + nameStr + "办理业务";
                                                newEnDataStr = "NO." + nameStr + "is processing";
                                                if (nowName.split(",")[1] != "") {
                                                    switchType("CallNumber", newDataStr + "," + statusPar, newEnDataStr,200, switchtype);

                                                }
                                            }
                                        } else {
                                            nameStr = nowName;
                                            newDataStr = "请" + nameStr + "办理业务";
                                            newEnDataStr = "NO." + nameStr + "is processing";
                                            switchType("CallNumber", newDataStr + "," + statusPar, newEnDataStr, 200, switchtype);

                                        }

                                    }
                                } else {
                                    //$("#CallNumber").html(data.find("lv1").attr("dispname"));
                                    $("#CallNumber").html("<span class='chStatus'>欢迎光临</span><span class='enStatus'>Welcome</span>");
                                }
                            }
                        }
                        oldData = newDataStr + "," + statusPar;
                    }

                }, error: function (data) {
                }
            })
        }
        window.onload = function () {
           // $("#headName").html(decodeURI(headName));
        }
        //在数字前补0
        function padding2(num, length) {
            if ((num + "").length >= length) {
                return num;
            }
            return padding2("0" + num, length)
        }
        var oldData = "";//记录上一次数据
        var oldStatus = "";//记录状态值是否改变
        function switchType(obj, dataStr, edataStr,time, type) {
            if (oldData != dataStr) {
                var htmlStr = dataStr.split(",")[0];
                changeAmi(type, obj, htmlStr, edataStr, time);
            }

        }
        function callback(obj) {
            setTimeout(function () {
                $("#" + obj).removeAttr("style").fadeOut();
            }, 1000);
        }
        //动态切换效果
        function changeAmi(type, obj, dataStr, edataStr, time) {
            var selectedEffect = "";
            var options = {};
            if (type == 1) {
                $("#" + obj).fadeOut(time, function () {
                    $("#" + obj).html("<span class='chStatus'>" + dataStr + "</span><span class='enStatus'>" + edataStr+"</span>");
                    $("#" + obj).fadeIn(time, function () {
                        $("#" + obj).fadeOut(time, function () {
                            $("#" + obj).fadeIn(time);
                        })
                    });
                })
            } else if (type == 2) {
                $("#" + obj).slideUp(time * 2, function () {
                    $("#" + obj).html("<span class='chStatus'>" + dataStr + "</span><span class='enStatus'>" + edataStr + "</span>");
                    $("#" + obj).slideDown(time * 2)
                });
            } else if (type > 2) {
                $("#" + obj).hide();
                $("#" + obj).html("<span class='chStatus'>" + dataStr + "</span><span class='enStatus'>" + edataStr + "</span>");
                if (type == 3) {
                    //缩放特效
                    selectedEffect = "scale";
                    options = { percent: 100 };

                } else if (type == 4) {
                    //尺寸特效
                    selectedEffect = "size";
                    options = { to: { width: 280, height: 185 } };
                } else if (type == 4) {
                    //百叶窗特效
                    selectedEffect = "blind";
                } else if (type == 5) {
                    //反弹特效
                    selectedEffect = "bounce";
                } else if (type == 6) {
                    //剪辑特效
                    selectedEffect = "clip";
                } else if (type == 7) {
                    //降落特效
                    selectedEffect = "drop";
                } else if (type == 7) {
                    //爆炸特效
                    selectedEffect = "explode";
                } else if (type == 8) {
                    //折叠特效
                    selectedEffect = "fold";
                } else if (type == 9) {
                    //突出特效
                    selectedEffect = "highlight";
                } else if (type == 10) {
                    //膨胀特效
                    selectedEffect = "puff";
                } else if (type == 11) {
                    //跳动特效
                    selectedEffect = "pulsate";
                } else if (type == 12) {
                    //震动特效
                    selectedEffect = "shake";
                } else if (type == 13) {
                    //滑动特效
                    selectedEffect = "slide";
                }
                $("#" + obj).show(selectedEffect, options, time * 4);
            }
        }
    </script>
</body>
</html>
