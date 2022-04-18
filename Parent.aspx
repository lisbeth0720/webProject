<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parent.aspx.cs" Inherits="Web.Module.BankCall.Parent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../images/favicon.ico" rel="shortcut icon" />
    <title>用户排队叫号</title>
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

        html, body, #form1 {
            height: 100%;
            width: 100%;
            overflow: hidden;
        }

        /*//设置背景图像是否固定,不随着页面的其余部分滚动。*/
        /*background-attachment: fixed;*/
        /*//设置背景图片不平铺*/
        /*background-size: cover;*/

        #BoxTag {
            /*border: 1px solid #808080;*/
            /*width: 630px;
            height: 950px;*/
            height: 100%;
            width: 100%;
            background-image: url('images/getNumBg.jpg');
            background-repeat: no-repeat;
            /*text-align: center;*/
            background-size: 100% 100%;
            position: relative;
        }

        .describe {
            height: 30%;
            width: 100%;
            top: 2%;
            position: relative;
        }

        .title {
            font-size: 3.2vw;
        }

        .describe li {
            font-weight: 700;
            text-align: center;
            box-sizing: border-box;
        }

        .lastLi {
            font-size: 3.0vw;
            letter-spacing: 0.2em;
        }

        #conLoad {
            width: 100%;
            /*height: 67.9%;*/
            height: 100%;
        }
    </style>
    <script>
        var TagName = "";

        var loc = 0;
        //http://192.168.1.145:8090/Module/HFhuixinbi/Bankcall/Parent.aspx?sourceUrl=192.168.10.128:8080
        //turl.Format("http://%s&t0=%u_%u_%d_%d&t1=1&t2=%s&t3=%s&t4=%s%s&cn=%s",m_ReportUrl,_ttoi(smpid),rpcnt,smptype,logtype,timestr,usrname,prebuff,urlstr,g_ClientName);

        var WiseSendInfourl = window.location.href;//获取页面附带的参数值
        var sourceUrl = "";
        var Infourl = "";
        loc = WiseSendInfourl.indexOf("?");
        if (loc >= 0) {

            Infourl = WiseSendInfourl.substring(loc + 1, WiseSendInfourl.length);
            if (Infourl.indexOf("sourceUrl") >= 0) {
                sourceUrl = Infourl.split("sourceUrl")[1];
                loc = sourceUrl.indexOf("&");
                if (loc >= 0) {
                    sourceUrl = sourceUrl.substring(0, loc);
                }
                loc = sourceUrl.indexOf("=");
                if (loc >= 0) {
                    sourceUrl = sourceUrl.substring(loc + 1, sourceUrl.length);
                }
            }
        }

        $(function () {




            $("#conLoad").html("");
            //debugger
            $("#conLoad").load('callNumber.aspx');

            //查询业务记录列表接口
            $.ajax({
                type: "get",
                url: "API/Bank_CallAPI.ashx",
                async: true,
                dadaType: 'text',
                data: {
                    "Type": "SelectBankCall",
                    "cp": "meeting"
                }, success: function (data) {

                }
            })
            //查询窗口列表接口
            $.ajax({
                type: "get",
                url: "API/Bank_CallAPI.ashx",
                async: true,
                dadaType: 'text',
                data: {
                    "Type": "SelectBankCallWindow",
                    "cp": "wisepeak"
                }, success: function (data) {

                }
            })
            //虚拟组不允许修改前缀  
            //与王总对接日志接口
            //datastr.Format("&t50=%s_%d&t51=%s_%s&t52=%d&t53=%s_%d_%s_%d&t54=%d",business,businesskey,queuenum,customername,devid,wnd,wndkey,username,userid,evaluate);
            //  turl.Format("%s?t0=%u_%d_%d&t1=1&t2=%s&t3=%s&t4=%s%s&cn=%s",url,rpcnt,type,logtype,timestr,username,prebuff,datastr,g_ClientName);
            $.ajax({
                type: "get",
                url: "API/Bank_CallAPI.ashx?Type=AddLog&t0=0_2_0&t1=1&t2=2020_05_27_14_35_21&t3=&t4=Vpo43OHsdQPd8mkjsNVdRQ&t50=个人贷款_3&t51=1_1.JOO_610654888789785254_&t52=370623197310141013&t53=&t54=0&cn=投影",
                async: true,
                dadaType: 'text',
                data: {
                    //"Type": "AddLog"
                }, success: function (data) {

                }
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="BoxTag">
            <%--<ul class="describe">
                <li class="title">用 户 排 队 叫 号 系 统</li>
                <li>
                    <hr style="height: 1px; background-color: #ffffff; border: 1px solid #ffffff; margin-top: 30px;" />
                </li>
                <li style="margin: 30px; text-align: center; font-weight: 500;" class="lastLi">欢迎光临! 请取号排队<br />
                    Welcome! Please line up
                </li>
               
            </ul>--%>
            <ul id="conLoad">
            </ul>
            <%-- <ul class="tag">
                <%=GetBankTag() %>
            </ul>--%>
        </div>
    </form>

</body>
</html>
