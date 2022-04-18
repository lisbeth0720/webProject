<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="switchUserPage.aspx.cs" Inherits="Web.Module.BankCall.switchUserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户观看界面</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        body {
            background: url(images/azerBg.jpg) no-repeat;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="recovery">
        </div>
        <div id="suspend"></div>
    </form>
    <script>
        //http://192.168.1.145:8090/Module/BankCall/azerCallNum.aspx?sourceurl=192.168.1.179:8080&cp=wisepeak&winid=2491&deviceid=5
        //用户展示界面，当叫号操作员在叫号界面，点击了暂停，需要对这个界面进行切换
        //默认展示的是操作员的信息，操作员点击"暂停"后显示的是另一个信息;点击恢“恢复”有显示操作员信息界面

    </script>
</body>
</html>
