<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="azerLogin.aspx.cs" Inherits="Web.Module.BankCall.azerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../images/favicon.ico" rel="shortcut icon" />
    <title>登录</title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <link href="/css/style.css" rel="stylesheet" />
    <style>
        html, body, #form1, #log_box {
            height: 100%;
            width: 100%;
            /*overflow: hidden;*/

            border: 1px solid;
        }

        * {
            list-style: none;
            /*margin: 0px auto;*/
            padding: 0;
            margin: 0;
            /*color: #ffffff;*/
            font-family: '微软雅黑';
            text-decoration: none;
        }

        #log_box {
            /*border: 1px solid #808080;*/
            /*width: 630px;
            height: 950px;*/
            background-image: url('images/azerBg.jpg');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            position: relative;
        }

        p {
            font-weight: 700;
            font-size: 3.2vw;
            margin-top: 7%;
            color: #ffffff;
            height: 10%;
            width: 100%;
            text-align: center;
            box-sizing: border-box;
        }

        #box {
            margin-top: 60px;
            /*width: 560px;
            height: 450px;*/
            background-color: #ffffff;
            opacity: 0.75;
            border-radius: 20px;
            height: 54%;
            width: 50%;
            position: relative;
            left: 25%;
        }

        span {
            font-size: 35px;
            color: #333;
            display: block;
            text-align: right;
            opacity: 1;
            width: 160px;
            height: 45px;
            line-height: 45px;
            float: left;
        }

        #inp_a li {
            width: 80%;
            height: 10%;
            margin: auto;
            margin-top: 4%;
        }

        #btn_b {
            /*margin-top: 30px;*/
            position: relative;
            height: 25%;
            width: 100%;
        }

            #btn_b li {
                height: 80%;
                width: 99%;
            }

            #btn_b input {
                width: 90px;
                height: 45px;
                position: relative;
                left: 32%;
                margin-right: 10%;
                background: #004785;
                border: none;
                color: #fff;
                border-radius: 10px;
            }

        #inp_a {
            height: 76%;
            width: 100%;
            overflow: hidden;
        }

        #sel_Window {
            padding-left: 10px;
            box-sizing: border-box;
        }

        #inp_a input {
            padding-left: 10px;
            box-sizing: border-box;
        }
    </style>

    <script>
        var winUrl = window.location.href;
        winUrl = winUrl.toLocaleLowerCase();
        var cp = "wisepeak";
        var sourceUrl = "localhost:8080";
        var deviceid = 0;
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
        if (winUrl.indexOf("deviceid") >= 0) {
            if (winUrl.split("deviceid=")[1].indexOf("&") >= 0) {
                deviceid = winUrl.split("deviceid=")[1].split("&")[0];
            } else {
                deviceid = winUrl.split("deviceid=")[1];
            }

        } else {
            deviceid = "0";
        }
        $(function () {
            $(document).keydown(function (e) {//全局监听按钮
                var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
                if (keyCode == "13") {
                    if ($("#name").val() == "" || $("#pwd").val() == "") {
                        TopTrip("用户名密码不能为空！", 3);
                        return;
                    } else {
                        loginInfo();
                    }
                }
            });
            //登录按钮
            $("#btn_login").click(function () {
                if ($("#name").val() == "" || $("#pwd").val() == "") {
                    TopTrip("用户名密码不能为空！", 3);
                    return;
                } else {
                    loginInfo();
                }
            })
        })
        function loginInfo() {
            var deviceID = $("#sel_Window").find("option:selected").attr("deviceid");
            $.ajax({
                type: "get",
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                async: true,
                dadaType: 'json',

                data: {
                    wpqueuedata: "douserlogin",
                    devid: deviceID,
                    cp: cp,
                    wnduser: $("#name").val(),
                    wndpwd: $("#pwd").val(),
                    utf8: "1"
                }, success: function (data) {
                    var data = JSON.parse(data);
                    if (data.wpqueuelogin[0].result.indexOf("200") >= 0) {
                        //window.location.href = "azerCallNum.aspx?sourceurl=" + sourceUrl + "&cp=" + cp + "&winid=" + $("#sel_Window").val() + "&deviceid=" + deviceID;
                        window.location.href = "azerCallNum.aspx?sourceurl=" + sourceUrl + "&cp=" + cp + "&winid=" + data.wpqueuelogin[1].wndkey + "&deviceid=" + data.wpqueuelogin[1].devid;
                    } else {
                        TopTrip(data.wpqueuelogin[0].result, 2);
                    }
                }, error: function () {

                }
            })

        }
        //查询窗口名称
        window.onload = function () {
            $.ajax({
                url: "http://" + sourceUrl + "/wpqueuedata.asp",
                //url: "http://192.168.1.179:8080/wpqueuedata.asp",
                type: "get",
                async: true,
                dataType: "text",
                data: {
                    wpqueuedata: "winquery",
                    utf8: 1,
                    node: "*",
                    devid: "",
                    retbusiness: "1",
                    json: "1",
                    cp: cp
                }, success: function (data) {
                   // debugger;
                    var data = eval("(" + data + ")");
                    var dataArr = data.tbis;
                    for (var i = 0; i < dataArr.length; i++) {
                        $("#sel_Window").append('<option deviceid="' + dataArr[i].devid + '" value="' + dataArr[i].lv1data[0].tridata[0].m_d6 + '">' + dataArr[i].dispname + '</option>');
                    }
                    
                    if (deviceid == 0) {

                    } else {
                        $("#sel_Window").find("option[deviceid=" + deviceid + "]").prop("selected", true);
                        $("#sel_Window").find("option").attr("disabled", true);
                    }
                }

            })
            //$.ajax({
            //    type: 'post',
            //    url: 'API/Bank_CallAPI.ashx',
            //    async: true,
            //    dataType: 'text',
            //    data: {
            //        "Type": "BankCallModelWin",
            //        "cp":cp
            //    },
            //    success: function (data) {
            //        var Count = JSON.parse(data);//转对象
            //        data = Count.Table;//返回所有的数据
            //        for (var i = 0; i < data.length; i++) {
            //            $("#sel_Window").append('<option deviceid="' + data[i].CallerID+'" value="' + data[i].ID + '">' + data[i].NameCh + '</option>');
            //        }
            //    }
            //});
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="log_box">
            <p>排 队 叫 号 系 统</p>
            <div id="box">
                <ul id="inp_a">
                    <li style="color: #333; font-size: 35px; margin-top: 50px; text-align: center;">选择办理的窗口</li>
                    <%--  <li><span>单位号：</span>
                        <select id="sel_company" class="form-control" style="height: 46px; font-size: 19px; width: 65.8%; float: left;"></select></li>--%>
                    <li style="margin-top: 50px;">
                        <span>窗口号：</span>
                        <select id="sel_Window" class="form-control" style="height: 46px; font-size: 19px; width: 65.8%; float: left;"></select></li>
                    <li><span>用户名：</span>
                        <input class="form-control" style="height: 46px; font-size: 19px; width: 65%; float: left;" id="name" /></li>
                    <li><span>密&nbsp;&nbsp;&nbsp;码：</span>
                        <input class="form-control" type="password" style="height: 46px; font-size: 19px; width: 65%; float: left;" id="pwd" /></li>
                </ul>
                <ul id="btn_b">
                    <li>
                        <input type="button" id="btn_login" value="登录" />
                        <input type="button" id="btn_quxiao" value="取消" />
                    </li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
