<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SmallTicket.aspx.cs" Inherits="Web.Module.BankCall.SmallTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link href="../images/favicon.ico" rel="shortcut icon" />
    <title>窗口LED看板</title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="/js/jquery-ui-1.9.2.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <link href="../../css/jquery-ui.css" />
    <style>
        * { 
            padding: 0;
            margin: 0;
            list-style: none;
        }

        html, body, #form1 {
            /*height: 100%;*/
            width: 100%;
            height:32px;
            line-height:32px;
        }

        body {
            background-color: #000000;
        }

        .ul_numu {
            width: 100%;
            height: 100%;
            margin: 0px auto;
        }

        .numu {
            font-size: 10vw;
            font-weight: 800;
            color: #ff0000;
        }

        ul li {
            color: red;
            font-size: 28px;
            text-align: center;
            line-height: 32px;
            margin-top:3px;
        }
        .stateone span {
            /*display:block;
            float:left;*/
        }
        #headName {
            /*width:16%;
            text-align:left;
            padding-left:5%;
            box-sizing:border-box;
            font-size:32px;*/
            /*line-height: 100%;*/
            /*line-height: 100vh;*/
        }
        #CallNumber {
            /*width:84%;
            text-align:left;*/
            letter-spacing:7px;
        }
    </style>
    <script>
        //window.requestAnimationFrame(GetWindowState);
        //http://localhost:11692/Module/Bankcall/SmallTicket.aspx?WinID=窗口一&sourceUrl=192.168.1.10:8080
        var WiseSendInfourl = window.location.href;//获取页面附带的参数值
        WiseSendInfourl = WiseSendInfourl.toLowerCase();
        var sourceUrl = "localhost";
        var Infourl = "";
        var WinID = 0;
        var WinNametitle = "";
        var headName = "";
        var switchtype = 1;//呼叫切换类型
        var cp = "";
        var url = WiseSendInfourl.split("//module")[0];
        function getUrlParam(name) { //读取参数值 这个方法可以解决参数有特殊字符获取不全的问题
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg); //匹配目标参数
            if (r != null) return decodeURIComponent(r[2]);
            return null; //返回参数值
        }

        if (WiseSendInfourl.indexOf("deviceid") >= 0) {
            //if (WiseSendInfourl.split("deviceid=")[1].indexOf("&") >= 0) {
            //    winID = WiseSendInfourl.split("deviceid=")[1].split("&")[0];
            //} else {
            //    winID = WiseSendInfourl.split("deviceid=")[1];
            //}
            WinID = getUrlParam("deviceid");
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
        $(function () {
            getNowData();
            setInterval("getNowData()", 3000);
        })
       
        function getNowData() {
            var rnd = Math.random(999);
            //var checkCode = md5("wpqueuedata=winquery&utf8=1&node=&devid=" + winID +"&rnd="+rnd)
            $.ajax({
                url: "http://"+sourceUrl + "/wpqueuedata.asp",
                type: "get",
                dataType: "html",
                data: {
                    "wpqueuedata": "winquery",
                    "utf8": "1",
                    "node": "",
                    "devid": WinID,
                    "rnd": rnd,
                    "cp":cp
                }, success: function (data) {
                    var data = $(data);
                    var statusPar = parseInt(data.find("lv1").attr("status"));
                    var newDataStr = "";
                    //识别到<div id="find_no_record" align="left" />时，则说明此时无数据，转入信息发布
                    if (data.find("#find_no_record").attr("align") == "left") {
                        $("#find_no_record").attr("align", "left");

                        if (parseInt(statusPar / 100) == 1) {
                            //百位为1表示暂停--由业务员设置
                            $("#CallNumber").html("暂停办理业务");

                        } else {
                            $("#CallNumber").html(data.find("lv1").attr("dispname"));
                        }
                        
                    } else {

                        if (parseInt(statusPar / 100) == 1) {
                            //百位为1表示暂停--由业务员设置
                            $("#CallNumber").html("暂停办理业务");

                        } else if (parseInt(statusPar / 100) == 2) {
                            //百位2业务忙(百位2)（忙，请到其它窗口办理）--由大堂经理操作设置
                            $("#CallNumber").html(data.find("lv1").attr("dispname"));

                        } else if (parseInt(statusPar / 100) == 3) {
                            //百位3转入信发--由大堂经理操作设置，可显示标题，如：中国农业银行或者欢迎光临
                            $("#CallNumber").html("欢迎光临");
                        } else {
                            //去掉百位标记用恢复操作，百位置0表示恢复继续。
                            if (statusPar % 100 == 0) {
                                //窗口状态：0-未登录/登出（可显示窗口号和提示信息--信发系统定
                               // $("#CallNumber").html("欢迎光临");
                                $("#CallNumber").html(data.find("lv1").attr("dispname"))
                            } else if (statusPar % 100 == 1) {
                                //1-登录正常/继续（正在业务办理中或者业务等待中--信发系统定）
                                $("#CallNumber").html(data.find("lv1").attr("dispname"))
                            } else if (statusPar % 100 == 2) {
                                //2-登录正常空闲中（呼叫不到号或者显示超时）
                                $("#CallNumber").html(data.find("lv1").attr("dispname"));
                            } else if (statusPar % 100 == 5) {
                                //5表示办理完毕（按请评价时可认为办理完毕，在呼叫下一个人前可交由信发系统定播放内容）
                                $("#CallNumber").html(data.find("lv1").attr("dispname"));
                            } else if (statusPar % 100 == 7) {
                                //7表示弃号
                                $("#CallNumber").html("过号");
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
                                if (nowDate - oldDate <= 60 * 3*1000) {
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
                                                if (nowName.split(",")[1] != "") {
                                                    switchType("CallNumber", newDataStr + "," + statusPar, 200, switchtype);

                                                }
                                            }
                                        } else {
                                            nameStr = nowName;
                                            newDataStr = "请" + nameStr + "办理业务";
                                            switchType("CallNumber", newDataStr + "," + statusPar, 200, switchtype);

                                        }

                                    }
                                } else {
                                    $("#CallNumber").html(data.find("lv1").attr("dispname"));
                                }
                            }
                        }
                        oldData = newDataStr +","+ statusPar; 
                    }
                   
                }, error: function (data) {
                }
            })
        }
        window.onload = function () {
            $("#headName").html(decodeURI(headName));
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
        function switchType(obj, dataStr, time, type) {  
            if (oldData != dataStr) {
                var htmlStr = dataStr.split(",")[0];
                changeAmi(type, obj, htmlStr, time);
            } 
            
        }
        function callback(obj) {
            setTimeout(function () {
                $("#" + obj).removeAttr("style").fadeOut();
            }, 1000);
        }
        //动态切换效果
        function changeAmi(type, obj, dataStr, time) {
            var selectedEffect = "";
            var options = {};
            if (type == 1) {
                $("#" + obj).fadeOut(time, function () {
                    $("#" + obj).html(dataStr);
                    $("#" + obj).fadeIn(time, function () {
                        $("#" + obj).fadeOut(time, function () {
                            $("#" + obj).fadeIn(time);
                        })
                    });
                })
            } else if (type == 2) {
                $("#" + obj).slideUp(time * 2, function () {
                    $("#" + obj).html(dataStr);
                    $("#" + obj).slideDown(time * 2)
                });
            } else if (type > 2) {
                $("#" + obj).hide();
                $("#" + obj).html(dataStr);
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
</head>
<body>
    <form id="form1" runat="server">
        <ul class="ul_numu">
            <li class="stateone" style="width:100%;height:100%;">
                <p style="width:100%;height:100%;">
                    <span id="headName"></span>&nbsp;&nbsp;
                    <span id="CallNumber"></span>
                </p>
            </li>
        </ul>
        <div id="find_no_record" style="display:none;" alin="right"></div>
    </form>
</body>
</html>
