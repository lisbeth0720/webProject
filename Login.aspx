<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Module.BankCall.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="../images/favicon.ico" rel="shortcut icon" />
    <title></title>
     <script src="js/jquery-1.9.1.js"></script>
    <script src="js/common.js"></script>
    <script src="../../js/wpmd5.js"></script>
    <style>
        html, body, #form1, #log_box {
            height: 100%;
            width: 100%;
            overflow: hidden;
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
            background-image: url('images/123jpg.jpg');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            position: relative;
        }

        p {
            font-weight: 700;
            font-size: 3.2vw;
            margin-top: 2%;
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
            opacity: 0.8;
            border-radius: 20px;
            height: 60%;
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
            width: 100%;
            height: 10%;
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
                width: 73px;
                height: 45px;
                background-image: url('images/123.png');
                position: relative;
                left: 32%;
                margin-right: 10%;
            }

        #inp_a {
            height: 76%;
            width: 100%;
        }
    </style>

    <script>
        var winUrl = window.location.href;
        winUrl = winUrl.toLocaleLowerCase();
        var cp = "wisepeak";
        var sourceUrl = "localhost:8080";
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

            //用户登录是根据编号查询查询对应的员工信息接口
            $.ajax({
                type: "post",
                url: "API/Bank_CallAPI.ashx",
                async: true,
                dadaType: 'text',
                data: {
                    "Type": "SelectUserName",
                    "username": "1005",
                    "cp": "wisepeak"
                }, success: function (data) {

                }
            })

        })
        function loginInfo() {
            $.ajax({
                type: "post",
                url: "API/LoginApiBank.ashx",
                async: true,
                dadaType: 'text',
                data: {
                    username: $("#name").val(),
                    password: $("#pwd").val(),
                    windowID: $("#sel_Window").val()
                }, success: function (data) {
                    //alert(data)
                    if (data.indexOf("OK") >= 0) {
                        window.location.href = "CallSystem.aspx?sourceurl=" + sourceUrl+"&cp="+cp;
                    } else if (data == "账号或密码有误") {
                        TopTrip('用户名或密码错误', 2);
                    } else if (data == "信息不全") {
                        TopTrip('用户名或密码错误', 2);
                    }
                }, error: function () {

                }
            })
        }
        //查询窗口名称
        window.onload = function () {
            $.ajax({
                type: 'post',
                url: 'API/Bank_CallAPI.ashx',
                async: true,
                dataType: 'text',
                data: {
                    "Type": "BankCallModelWin",
                    "cp":cp
                },
                success: function (data) {
                    var Count = JSON.parse(data);//转对象
                    data = Count.Table;//返回所有的数据
                    for (var i = 0; i < data.length; i++) {
                        $("#sel_Window").append('<option value="' + data[i].ID + '">' + data[i].NameCh + '</option>');
                    }
                }
            });
        }

        //查询单位号
        //window.onload = function () {
        //    $.ajax({
        //        type: 'post',
        //        url: '../API/Common.ashx?Type=SelCompanyID',
        //        async: true,
        //        dataType: 'text',
        //        success: function (data) {
        //            data = eval("(" + data + ")");
        //            var coms = data.res;
        //            for (var i = 0; i < coms.length; i++) {
        //                $("#sel_company").append('<option value="' + coms[i].ID + '">' + coms[i].name + '</option>');
        //            }
        //        }
        //    });
        //}


    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="log_box">
            <p>排 队 叫 号 系 统</p>
            <div id="box">
                <ul id="inp_a">
                    <li style="color: #333; font-size: 35px; padding-top: 20px; text-align: center;">选择办理的窗口</li>
                    <%--  <li><span>单位号：</span>
                        <select id="sel_company" class="form-control" style="height: 46px; font-size: 19px; width: 65.8%; float: left;"></select></li>--%>
                    <li><span>窗口号：</span>
                        <select id="sel_Window" class="form-control" style="height: 46px; font-size: 19px; width: 65.8%; float: left;"></select></li>
                    <li><span>用户名：</span>
                        <input class="form-control" style="height: 46px; font-size: 19px; width: 65%; float: left;" id="name" /></li>
                    <li><span>密&nbsp;&nbsp;&nbsp;码：</span>
                        <input class="form-control" type="password" style="height: 46px; font-size: 19px; width: 65%; float: left;" id="pwd" /></li>
                </ul>
                <ul id="btn_b">
                    <li>
                        <input type="button" id="btn_login" value="登录" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <input type="button" id="btn_quxiao" value="取消" /></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>

