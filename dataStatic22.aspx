<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataStatic22.aspx.cs" Inherits="Web.Module.BankCall.dataStatic22" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>大数据展示界面</title>
     <%--德胜门社区那4K显示器-完善版--%>
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script src="js/echarts.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
            color: #fff;
            overflow: hidden;
        }
        body{
            font-size:1vw;
        }
        #form1 {
            width: 100%;
            height: 100%;
        }

        ul, li {
            list-style: none;
        }

        body {
            background: url("images/databg.jpg") no-repeat;
            background-size: 100% 100%;
        }

        #top {
            width: 100%;
           /* text-align: center;*/
            overflow: hidden;
            height: 6%;
            position:relative;
        }

            #top span {
                position:absolute;
                top:54%;
                left:50%;
                /*font-size: 30px;*/
                 font-size:2em;
                font-weight: 700;
                color: #fff;
                display: block;
               /* width: 100%;*/
                letter-spacing: 20px;
               /* margin-top: 16px;*/
                transform:translate(-50%,-50%);
            }

        #main {
            display: block;
            overflow: hidden;
            width: 94%;
            margin: 0 auto;
            height: 64%;
        }

        .serviceContent {
            display: block;
            float: left;
        }

        .serviceLeft {
            width: 26%;
            float: left;
            height: 100%;
            margin-left: 1%;
            box-sizing: border-box;
        }

            .serviceLeft .serviceLeftTitle {
                font-size: 32px;
                color: #aaddff;
               /* height: 63px;
                line-height: 63px;*/
                height: 10%; 
            }

        .serviceLeftContent {
            width: 100%;
            height: 44%;
            margin-bottom: 7px;
            background: url("images/workDayBg.png") no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1px;
            border: 2px solid #0e81d4;
            box-sizing: border-box;
        }

        .staticTitle {
            /* width:421px;
            height:55px;*/
            width: 70%;
            height: 15%;
            left: 3%;
            background: url("images/worktitlebg.png") no-repeat;
            background-size: 100% 100%;
            position: relative;
            margin-top: 2%;
            /*margin-top: 12px;*/
        }

        .staticTitle2 {
            width: 60%;
            height: 12%;
            left: 2%;
            margin-top: 1%;
        }
       
        .staticTitle img {
            position: absolute;
            /* left: 33px;*/
            left: 4%;
            top: 50%;
            height: 90%;
            transform: translate(0, -50%);
        }

        .staticTitle2 img {
            left: 3%;
        }
        
        .staticTitle b {
            position: absolute;
            /*left: 76px;*/
            left: 146px;
            top: 50%;
            transform: translate(0, -50%);
           /* font-size: 17px;*/
        }
        .staticTitle2 b{
             left: 176px;
        }
        .dayStasticContent {
            height: 81%;
            width: 100%;
            color: #aaddff;  
        }

        .monthStasticContent {
            /* height:240px;*/
            height: 88%;
            width: 100%;
        }

        .monthWinStasticContent {
            height: 82%;
            width: 96%;
            margin-left:2%;
        }

        .allTimeStasticContent {
            height: 88%;
            width: 100%;
        }

        .serviceMain {
            width: 52%;
            float: left;
            margin-left: 1%;
            box-sizing: border-box;
            height: 100%;
        }

        .mainTime {
            width: 100%;
            height: 4%;
            text-align: center;
            position: absolute;
            left: 0;
        }

            .mainTime .serviceTimer {
                display: block;
                width: 100%;
                /*font-size: 15px;*/
                font-size: 1em;
                color: #8dc7db;
                position: absolute;
                left: 0;
                top: 50%;
                transform: translate(0,-50%);
                text-align: center;
            }

        .TrueTimeData {
            display: block;
            width: 100%;
            margin-top: 4%;
            height: 20%;
           /* font-size: 16px;*/
            color: #8dc7db;
            display: flex;
            flex-direction: row;
        }

            .TrueTimeData > div {
                flex: 1;
                position: relative;
            }

                .TrueTimeData > div p {
                    margin: auto;
                    width: 90%;
                    position: absolute;
                    /* top: 50%; */
                    left: 50%;
                    transform: translate(-50%, 0);
                }

                .TrueTimeData > div span:first-child {
                    margin-left: 0;
                }

                .TrueTimeData > div span {
                    display: block;
                    float: left;
                    /*line-height: 56.5px;*/
                    line-height: 2.5;
                    margin-top: 31px;
                    margin-left: 10px;
                }

                .TrueTimeData > div .counterBg {
                   /* width: 38px;
                    height: 68px;*/
                    width: 1.1em;
                    height: 1em;
                    line-height:1;
                    background: url("images/numberBg.png") no-repeat;
                    background-size: 100% 100%;
                    text-align: center;
                    margin-left: 7px;
                   /* font-size: 41px;*/
                    font-size: 2.4em;
                    color: #F4F944;
                   /* line-height: 68px;*/
                   
                }

        .trueTimeLine {
            width: 100%;
            height: 73%;
            background: url(images/allTimeBg.png) no-repeat;
            background-size: 100% 100%;
            /*box-shadow: 0px 0px 4px #fff; width: 908px;
            height: 489px;*/
            box-sizing: border-box;
            overflow: hidden;
            border: 2px solid #0e81d4;
            box-sizing: border-box;
        }

        .winRight {
            width: 18%;
            float: right;
            height: 100%;
            margin-right: 1%;
        }

            .winRight .winRightTitle {
               /* font-size: 32px;*/
               font-size: 2em;
                color: #aaddff;
               /* height: 63px;*/
                height: 10%;
                /*line-height: 63px;*/
            }

        .winContent {
            width: 99%;
            height: 44%;
            margin-bottom: 7px;
            background: url(images/winDayBg.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            /*margin-left: 1px;*/
            border: 2px solid #0e81d4;
            box-sizing: border-box;
        }

        .staticWinTitle {
            width: 90%;
            height: 10%;
           /* margin-left: 20px;*/
            margin-left: 2%;
            background: url(images/wintitileBg.png) no-repeat;
            background-size: 100% 100%;
            position: relative;
            margin-top: 12px;
        }

            .staticWinTitle img {
               /* left: 27px;*/
                left: 4%;
            }

            .staticWinTitle b {
                position: absolute;
                /*left: 53px;*/
                left: 103px;
                top: 50%;
                transform: translate(0, -50%);
                /*font-size: 17px;*/
            }

        .winDayTable {
            width:46%;
            height:100%;
            display: block;
            float: left;
            margin-top: 13px;
        }

        .winDayLeftTable {
            margin-left: 27px;
        }

        .winDayTable > ul {
            display: block;
            width: 100%;
           height:15%;
        }

            .winDayTable > ul li {
                display: block;
                height:100%;
                width: 50%;
                float: left;
                text-align: center;
                border: 1px solid #aaddff;
                box-sizing: border-box;
                position:relative;
            }
             .winDayTable > ul li span{
                 font-size:0.5em;
            position:absolute;
            top:50%;
            left:50%;
          transform:translate(-50%,-50%);
          white-space:nowrap;
            }
                .winDayTable > ul li:first-child {
                    border-right: 0;
                }

        .winDayTable .commonTableContent {
            display: block;
            width: 100%;
            height: 85%;
        }
         .winDayTable .commonTableContent ul {
                display: block;
                width: 100%;
            }
            .winDayTable .commonTableContent1 ul {
               height:20%;
            }
             .winDayTable .commonTableContent2 ul {
               height:14.2%;
            }
                .winDayTable .commonTableContent ul li {
                    display: block;
                    width: 50%;
                    height: 100%;
                    float: left;
                    text-align: center;
                    border: 1px solid #aaddff;
                    box-sizing: border-box;
                    border-top: 0;
                    position:relative;
                }
                .winDayTable .commonTableContent ul li span{
                   font-size:1em;
                   position:absolute;
                   top:50%;
                   left:50%;
                   transform:translate(-50%,-50%);
                   white-space:nowrap;
                }
                  .winDayTable .commonTableContent2 ul li span{
                        font-size:0.7em;
                }
                    .winDayTable .commonTableContent ul li:first-child {
                        border-right: none;
                    }

        .winDayRightTable > ul li:first-child {
            border-left: 0;
        }

        .winDayRightTable .commonTableContent ul li:first-child {
            border-left: 0;
        }

        #bottom {
            display: block;
            overflow: hidden;
            width: 96%;
            height: 29%;
            margin-left: 3%;
        }

        .bottomWorkYear {
            width: 39%;
            height: 90%;
            margin-bottom: 10px;
            background: url(images/workDayBg.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            float: left;
            margin-left: 1%;
            margin-top: 1px;
            border: 2px solid #0e81d4;
            box-sizing: border-box;
        }

        .bottomAllWork {
            width:37.3%;
            height: 90%;
            margin-bottom: 10px;
            background: url(images/allWork.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1%;
            float: left;
            margin-top: 1px;
            border: 2px solid #0e81d4;
            box-sizing: border-box;
        }

        .allWorkStasticContent {
            width: 98%;
            height: 75%;
            margin-top: 1%;
            margin-left: 1%;
            color: #aaddff;
        }

        .allWorkTable {
            width: 50%;
            height: 100%;
        }

            .allWorkTable > ul { 
                height:15%;
            }

        .allWorkRightTable > ul li:first-child {
            border-left: none !important;
        }

        .allWorkRightTableContent ul li:first-child {
            border-left: none;
        }

        .allWorkTable > ul li {
            height:100%;
            position:relative;
        }
        .allWorkTable > ul li span {
            font-size:0.9em;
            position:absolute;
            top:50%;
            left:50%;
          transform:translate(-50%,-50%);
          white-space:nowrap;
        }
        .bottomWinYear {
            width: 17.4%;
            height: 90%;
            margin-bottom: 7px;
            background: url(images/winDayBg.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1%;
            float: left;
            margin-top: 1px;
            border: 2px solid #0e81d4;
            box-sizing: border-box;
        }

        .winYearStasticContent {
            height: 82%;
            width: 94%;
            margin-left: 3%;
        }

        .workYearStasticContent {
            /*width: 987px;
            height: 302px;width: 667px;
            height: 215px;*/
            width: 98%;
            height: 72%;
            margin-top: 2%; 
            margin-left: 1%;
            color: #aaddff;
        }

        .workYearStasticCommon {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
        }

        .workYearStasticContentLine {
            width: 66%;
            height: 100%;
        }

        .workYearStasticContentBar {
            width: 34%;
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="top">
            <span>数据统计平台</span>
        </div>
        <div id="main">
            <div class="serviceLeft serviceContent">
                <div class="serviceLeftTitle">
                    <span>业务办理</span>
                </div>
                <div class="dayStastic serviceLeftContent">
                    <div class="dayStasticTitle staticTitle">
                        <img src="images/workday.png" />
                        <b>日统计</b>
                    </div>
                    <div class="dayStasticContent">
                    </div>
                </div>
                <div class="monthStastic serviceLeftContent">
                    <div class="monthStasticTitle staticTitle">
                        <img src="images/workmonth.png" />
                        <b>月统计</b>
                    </div>
                    <div class="monthStasticContent">
                    </div>
                </div>
            </div>
            <div class="serviceMain">
                <div class="mainTime">
                    <span class="serviceTimer"></span>
                </div>
                <div class="TrueTimeData">
                    <div class="nowHandle">
                        <p>
                            <span>正在办理</span>
                            <span class="counterBg workingNum">0</span>
                            <span class="counterBg workingNum">0</span>
                            <span class="counterBg workingNum">0</span>
                            <span>个</span>
                        </p>

                    </div>
                    <div class="waitCounter">
                        <p>
                            <span>等待人数</span>
                            <span class="counterBg waitingNum">0</span>
                            <span class="counterBg waitingNum">0</span>
                            <span class="counterBg waitingNum">0</span>
                            <span>个</span>
                        </p>


                    </div>
                    <div class="handleDownCounter">
                        <p>
                            <span>已办理</span>
                            <span class="counterBg worked">0</span>
                            <span class="counterBg worked">0</span>
                            <span class="counterBg worked">0</span>
                            <span>个</span>
                        </p>

                    </div>
                </div>
                <div class="trueTimeLine">
                    <div class="staticTitle allTimeStasticTitle staticTitle2">
                        <img src="images/allWorkIcon.png" />
                        <b>月各时段办理量</b>
                    </div>
                    <div class="allTimeStasticContent">
                    </div>
                </div>
            </div>
            <div class="winRight">
                <div class="winRightTitle">
                    <span>窗口办理</span>
                </div>
                <div class="dayWinStastic winContent">
                    <div class="staticTitle dayWinStasticTitle staticWinTitle">
                        <img src="images/winday.png" />
                        <b>日统计</b>
                    </div>
                    <div class="dayStasticContent">
                        <div class="winDayLeftTable winDayTable">
                            <ul>
                                <li><span>窗口名</span></li>
                                <li><span>已办业务</span></li>
                            </ul>
                            <div class="winLeftTableContent commonTableContent commonTableContent2"></div>
                        </div>
                        <div class="winDayRightTable winDayTable">
                            <ul>
                                 <li><span>窗口名</span></li>
                                <li><span>已办业务</span></li>
                            </ul>
                            <div class="winRightTableContent commonTableContent commonTableContent2"></div>
                        </div>
                    </div>
                </div>
                <div class="monthWinStastic winContent">
                    <div class="staticTitle monthWinStasticTitle staticWinTitle staticTitle3">
                        <img src="images/winmonth.png" />
                        <b>月统计</b>
                    </div>
                    <div class="monthWinStasticContent">
                    </div>
                </div>
            </div>
        </div>
        <div id="bottom">
            <div class="bottomWorkYear">
                <div class="staticTitle  workYearStasticTitle">
                    <img src="images/workyear.png" />
                    <b>年统计</b>
                </div>
                <div class="workYearStasticContent">
                    <div class="workYearStasticContentLine workYearStasticCommon">
                    </div>
                    <div class="workYearStasticContentBar workYearStasticCommon">
                    </div>
                </div>
            </div>
            <div class="bottomAllWork">
                <div class="staticTitle  allWorkStasticTitle">
                    <img src="images/allWorkIcon.png" />
                    <b>所有业务办理时长</b>
                </div>
                <div class="allWorkStasticContent">
                    <div class="allWorkLeftTable winDayTable allWorkTable">
                        <ul>
                            <li><span>业务名称</span></li>
                            <li><span>平均办理</span></li>
                        </ul>
                        <div class="allWorkLeftTableContent commonTableContent commonTableContent1"></div>
                    </div>
                    <div class="allWorkRightTable winDayTable allWorkTable">
                        <ul>
                            <li><span>业务名称</span></li>
                            <li><span>平均办理</span></li>
                        </ul>
                        <div class="allWorkRightTableContent commonTableContent commonTableContent1"></div>
                    </div>
                </div>
            </div>
            <div class="bottomWinYear">
                <div class="staticTitle  yearWinStasticTitle staticWinTitle ">
                    <img src="images/winday.png" />
                    <b>年统计</b>
                </div>
                <div class="winYearStasticContent">
                </div>
            </div>
        </div>
    </form>
    <script>
        //备注：这个界面是德胜门社区的-自适应界面--
        //1. 昨日各个窗口的业务量，数字显示。
        //2. 当月各个窗口业务，柱状图。
        //3. 当年各个窗口业务总量，饼状图，统计周期，当前日期回溯一年365天的总量。
        //4. 昨日各个业务总量，柱状图。
        //5. 当月各个业务总量，饼状图。
        //6. 当年，每个月每个业务总量，折线图（每个业务一条折线）。
        //7. 历史每个业务的平均办理时长统计，表格数字。
        //8. 实时数据显示：显示正在办理的人数、等待人数、已办理人数
        //9. 当前日期的前一天各时段业务的办理量（统计周期为一个月，一月按照22天计算）
        //10.当前各个业务的办理总量，用翻转柱状图形式表示
        time();
        var optioned = {};
        var optioned1 = {};
        var optioned2 = {};
        var lastTime = "";//每次选择时间插件后记录选择的的value
        $(function () {
            //声明其他统计图
            optioned = {
                notMerge: false,
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                xAxis: {
                    data: [],
                    axisLabel: {
                        interval: 0,
                        rotate: 40,
                        textStyle: {
                            color: "#fff",
                            fontSize: 18
                        }
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#fff',
                        }
                    },
                    show: true,//显示横纵坐标轴
                    splitLine: {
                        show: false
                    }
                },
                yAxis: {
                    axisLabel: {
                        interval: 0,
                        textStyle: {
                            color: "#fff",
                            fontSize: 18
                        }
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#fff',
                        }
                    },
                    show: true,
                    splitLine: {
                        show: false
                    }
                },
                grid: {
                    left: 50
                },
                series: [{
                    name: '业务',
                    type: 'bar',
                    data: [],
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                var colorList = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"]
                                return colorList[params.dataIndex];
                            }
                        }
                    }

                }]
            };
            optioned2 = {
                notMerge: false,
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c}'
                },
                xAxis: {
                    data: [],
                    axisLabel: {
                        interval: 0,
                        rotate: 60,
                        textStyle: {
                            color: "#fff",
                            fontSize: 18
                        }
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#FFF',
                            fontSize: 20
                        }
                    },
                    show: true,//显示横纵坐标轴
                    splitLine: {
                        show: false
                    }
                },
                yAxis: {
                    axisLabel: {
                        interval: 0,
                        textStyle: {
                            color: "#fff",
                            //fontSize: 12
                            fontSize: 18
                        }
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#fff',
                        }
                    },
                    show: true,
                    splitLine: {
                        show: false
                    }
                },
                grid: {
                    left: 100,
                    top: 0,
                    width: 'auto'
                },
                series: [{
                    name: '业务',
                    type: 'bar',
                    data: [],

                }]
            };
            //声明年统计图
            optioned1 = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    itemWidth: 3,
                    itemHeight: 5,
                    orient: "horizontal",
                    width: 400,
                    data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎'],
                    textStyle: {//图例文字的样式
                        color: '#ccc',
                        fontSize: 20
                    }
                },
                color: ["#d54e16", "#e6da17", "#4c8d14", "#25a89e", "#295dde", "#7223d3", "#ae0787", "#aa1643", "#6674aa", "#0fb856", "#e6d90d"],
                xAxis: {
                    data: [],
                    width: 3,
                    axisLabel: {
                        rotate: 45,
                        interval: 0,
                        margin: 5,
                        textStyle: {
                            color: "#fff",
                            /*fontSize: 10*/
                            fontSize: 20
                        }
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#FFF',
                        }
                    },
                    show: true,//显示横纵坐标轴
                    splitLine: {
                        show: false
                    }
                },
                yAxis: {
                    width: 5,
                    axisLabel: {
                        interval: 0,
                        textStyle: {
                            color: "#fff",
                            fontSize: 18
                        }
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#fff',
                        }
                    },
                    show: true,
                    splitLine: {
                        show: false
                    }
                },
                series: [
                    //有几个业务（即显示几条线，在series就添加几条数据）
                    {
                        data: [],//每个业务在各个月份的值
                        type: 'line',
                        smooth: true,
                    }
                ]
            };
            workCount("work", 1, "cross");
            workCount("win", 2, "aaa");
            winWorkCount("win", 2);
            getPieData("work", 1);
            getLineData();
            allWorkTimer();
            getPieData("win", 2);
            actualData();
            allWorkYearData();
            setInterval("time()", 1000);
            setInterval("actualData()", 1000 * 5);
            setTimeout(function () {
                workCount("work", 1, "len");
            }, 1000)
        })
        //根据业务统计所有窗口日办理量(柱状图)
        function workCount(stasticType, signType, showType) {//signType=1：业务，signType=2：窗口
            var starTime = "";
            var endTime = "";
            var myChart = "";
            if (stasticType == "work") {
                //统计当日所办业务（柱状图）
                starTime = getBeforeDate(1, changeDate("day")) + " 00:00:00";
                endTime = getBeforeDate(1, changeDate("day")) + " 23:59:00";
                if (showType == "cross") {
                    myChart = echarts.init(document.getElementsByClassName('dayStasticContent')[0]);
                } else if (showType == "len") {
                    //starTime = changeDate("day");
                    //endTime =  changeDate("day");
                    starTime = changeDate("winyear") + " 00:00:00";
                    endTime = changeDate("day") + " 00:00:00";
                    myChart = echarts.init(document.getElementsByClassName('workYearStasticContentBar')[0]);
                }
            } else if (stasticType == "win") {
                //统计当月窗口所办业务（柱状图）
                starTime = changeDate("month") + "-01 00:00:00";
                endTime = getLastMonthAndDay() + " 23:59:00";
                myChart = echarts.init(document.getElementsByClassName('monthWinStasticContent')[0]);
            }
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                dataType: "json",
                type: "get",
                data: {
                    Type: "BankTimeStatistics",
                    startTime: starTime,
                    endTime: endTime,
                    sign: signType
                },
                success: function (data) {
                    //每次读取数据时需要清空上一次的数据，防止出现数据叠加的问题
                    if (showType == "len") {
                        optioned2.xAxis.data = [];
                        optioned2.series[0].data = [];
                    } else {
                        optioned.xAxis.data = [];
                        optioned.series[0].data = [];
                    }
                    var xdata = new Array();
                    var ydata = new Array();
                    var result = data[0];
                    var dataStr = result.data;
                    if (result.sign == "OK") {
                        var xdata = new Array();
                        var ydata = new Array();
                        $.each(dataStr, function (index, obj) {
                            var name = Object.keys(dataStr[index])[0];
                            var value = Object.values(dataStr[index])[0];
                            if (name.length > 4) {
                                name = name.slice(0, 4) + "...";
                            } else {
                                name = name;
                            }
                            xdata[index] = name;
                            ydata[index] = value
                        });
                        if (showType == "len") {
                            resetBarSize(myChart, xdata, ydata)
                        } else {
                            resetBarChar(myChart, xdata, ydata, 'bar', 1, showType);
                        }
                    }
                },
                error: function (a, b, c) {
                    //alert("服务器异常");
                }
            })
        }
        //根据业务统计所有窗口月办理量
        function getPieData(type, signType) {
            //以下两个数组为专门为饼状图所需要的数据存储所声明
            var legendData = [];
            var seriesData = [];
            var starTime = "";
            var endTime = "";
            var myChart1 = echarts.init(document.getElementsByClassName('monthStasticContent')[0]);
            if (type == "work") {
                //当月所办业务（饼状图）
                starTime = changeDate("month") + "-01 00:00:00";
                endTime = getLastMonthAndDay() + " 23:59:00";
                myChart1 = echarts.init(document.getElementsByClassName('monthStasticContent')[0]);
            } else if (type == "win") {
                //各窗口当年所办业务（饼状图，统计周期，当前日期回溯一年365天的总量。）
                starTime = changeDate("winyear") + " 00:00:00";
                endTime = changeDate("day") + " 00:00:00";
                myChart1 = echarts.init(document.getElementsByClassName('winYearStasticContent')[0]);
            }
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                //url: "data.json?rand=" + Math.random(999),
                dataType: "json",
                type: "get",
                data: {
                    Type: "BankTimeStatistics",
                    startTime: starTime,
                    endTime: endTime,
                    sign: signType
                },
                success: function (data) {
                    //每次读取数据时需要清空上一次的数据，防止出现数据叠加的问题  
                    var result = data[0];
                    var dataStr = result.data;
                    if (result.sign == "OK") {
                        var xdata = new Array();
                        var ydata = new Array();
                        $.each(dataStr, function (index, obj) {
                            var name = Object.keys(dataStr[index])[0];
                            var value = Object.values(dataStr[index])[0];
                            if (name.length > 6) {
                                name = name.slice(0, 5) + "...";
                            } else {
                                name = name;
                            }
                            legendData.push(name);
                            seriesData.push({
                                name: name,
                                value: value
                            });
                        });

                        //重置饼状图并赋值
                        resetPieChart(myChart1, legendData, seriesData, 2, type)
                    }
                },
                error: function (a, b, c) {
                    //alert("服务器异常");
                }
            })
        }
        //显示折线图(上一个月各时段业务办理平均值)
        function getLineData() {
            var start = getBeforeMonthDate(1);
            var end = "";
            var charType = 0;
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                dataType: "json",
                type: "get",
                data: {
                    Type: "RunChart",
                    charttype: 2,
                    monthtype: 3,
                    selected: start
                },
                success: function (data) {
                    //每次读取数据时需要清空上一次的数据，防止出现数据叠加的问题
                    optioned.xAxis.data = [];
                    optioned.series[0].data = [];
                    var result = data[0];
                    var dataStr = result.data;
                    //optioned.title.subtext = "业务总量:" + result.number;
                    if (result.sign == "OK") {
                        var xdata = new Array();
                        var ydata = new Array();
                        $.each(dataStr, function (index, obj) {
                            var name = Object.keys(dataStr[index])[0];
                            var value = Object.values(dataStr[index])[0];
                            if (name.length > 6) {
                                name = name.slice(0, 5) + "...";
                            } else {
                                name = name;
                            }
                            xdata[index] = name;
                            ydata[index] = value;

                        })
                        //重置echart变量声明，并赋值
                        var myChart2 = echarts.init(document.getElementsByClassName('allTimeStasticContent')[0]);
                        resetBarChar(myChart2, xdata, ydata, 'line', 3);
                    }
                },
                error: function (a, b, c) {
                    //alert("服务器异常");
                }
            })
        }
        //前一天个窗口所办的业务总量
        function winWorkCount(stasticType, signType) {
            var starTime = "";
            var endTime = "";
            if (stasticType == "work") {
                //日统计业务量
                starTime = getBeforeDate(1, changeDate("day")) + " 00:00:00";
                endTime = getBeforeDate(1, changeDate("day")) + " 23:59:00";
            } else if (stasticType == "win") {
                starTime = getBeforeDate(1, changeDate("day")) + " 00:00:00";
                endTime = getBeforeDate(1, changeDate("day")) + " 23:59:00";
            }
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                dataType: "json",
                type: "get",
                data: {
                    Type: "BankTimeStatistics",
                    startTime: starTime,
                    endTime: endTime,
                    sign: signType
                },
                success: function (data) {
                    if (data[0].sign == "OK") {
                        $(".commonTableContent2").html("");
                        var dataStr = data[0].data;
                        for (var i = 0; i < dataStr.length; i++) {
                            var tableStr = "";
                            tableStr = "<ul><li><span>" + Object.keys(dataStr[i])[0] + "</span></li><li><span>" + Object.values(dataStr[i])[0] + "</span></li></ul>"
                            if (i < 8) {
                                $(".winLeftTableContent").append(tableStr);
                            } else {
                                $(".winRightTableContent").append(tableStr);
                            }
                        }
                        if ($(".commonTableContent2 ul").length < 8) {
                            $(".winDayRightTable").hide();
                            $(".winRightTableContent").hide();
                        } else {
                            $(".winDayRightTable").show();
                            $(".winRightTableContent").show();
                        }
                    }

                }
            })
        }
        //所有业务办理时长
        function allWorkTimer() {
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                dataType: "json",
                type: "get",
                data: {
                    Type: "SelectBC",
                }, success: function (data) {
                    var data = data.Table;
                    $(".selectLeftTable").html("");
                    for (var i = 0; i < data.length; i++) {
                        var serviceName = data[i].NameCh;
                        var average = parseInt(data[i].average == "" ? 0 : data[i].average) * 1000;
                        var tableStr = "";
                        tableStr += '<ul><li><span>' + serviceName + '</span></li><li><span>' + formatSeconds(average) + '</span></li></ul>';
                        if (i < 6) {
                            $(".allWorkLeftTableContent").append(tableStr);
                        } else {
                            $(".allWorkRightTableContent").append(tableStr);
                        }
                    }
                    if ($(".commonTableContent1 ul").length < 6) {
                        $(".allWorkRightTable").hide();
                        $(".allWorkRightTableContent").hide();
                    } else {
                        $(".allWorkRightTable").show();
                        $(".allWorkRightTableContent").show();
                    }
                }
            })
        }
        //当年所有业务办理总量
        function allWorkYearData() {
            var start = changeDate("day");
            var end = "";
            var charType = 0;
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                dataType: "json",
                type: "get",
                data: {
                    Type: "RunChartAll",
                    charttype: 1,
                    selected: start
                },
                success: function (data) {

                    //每次读取数据时需要清空上一次的数据，防止出现数据叠加的问题
                    optioned.xAxis.data = [];
                    optioned.series[0].data = [];
                    var result = data[0];
                    var dataStr = result.data;
                    //optioned.title.subtext = "业务总量:" + result.number;
                    if (result.sign == "OK") {
                        var xdata = new Array();
                        var ydata = new Array();
                        $.each(dataStr, function (index, obj) {
                            var name = dataStr[index].Name;
                            var year = dataStr[index].yaer;
                            if (name.length > 6) {
                                name = name.slice(0, 5) + "...";
                            } else {
                                name = name;
                            }

                            xdata[index] = name;
                            ydata[index] = year;

                        })
                        //重置echart变量声明，并赋值
                        var myChart2 = echarts.init(document.getElementsByClassName('workYearStasticContentLine')[0]);
                        resetlinBar(myChart2, xdata, ydata);
                    }
                },
                error: function (a, b, c) {
                    //alert("服务器异常");
                }
            })
        }
        //重置饼状图
        function resetPieChart(charName, data1, data2, num, workType) {
            if (num == 2) {
                optioned.tooltip.formatter = '{a} <br/>{b} : {c} ({d}%)';
                optioned.xAxis.show = false;
                optioned.yAxis.show = false;
                var serRadius =
                    optioned.color = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"];
                if (workType == "work") {
                    //console.log("abin")
                    optioned.series = [{
                        name: '业务',
                        type: 'pie',
                        radius: '80%',
                        center: ['50%', '50%'],
                        minAngle: 20,
                        label: {
                            formatter: '{{b}:{d}%}',
                            //normal: {
                            //    formatter(v) {
                            //        let text = v.name;
                            //        //return text.length < 2 ? text : `${text.slice(0, 2)}\n${text.slice(2)}`

                            //        return text.split("-").join("\n");
                            //        //return text.split("-").join("");
                            //    }

                            //},
                            formatter: ' {b}: \n{c}({d}%)',//换行显示
                            fontSize: 26
                        },
                        roseType: 'radius',
                        data: data2
                    }]
                } else {
                    optioned.color = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"];
                    optioned.series = [{
                        name: '业务',
                        type: 'pie',
                        radius: '40%',
                        center: ['50%', '50%'],
                        minAngle: 20,
                        label: {
                            //formatter: '{{b}:{d}%}',
                            formatter: '{{b}:{d}%}',
                            //normal: {
                            //    formatter(v) {
                            //        let text = v.name;
                            //        //return text.length < 2 ? text : `${text.slice(0,2)}\n${text.slice(2)}`
                            //        return text.split("-").join("\n");

                            //       // return text.split("-").join("");
                            //    }, 
                            //},
                            formatter: ' {b}: \n{c}({d}%)',//换行显示
                            fontSize: 26
                        },
                        roseType: 'radius',
                        data: data2
                    }]

                }
                charName.setOption(optioned);
            }
        }
        //重置柱状图、折线图
        function resetBarChar(chartName, data1, data2, type, num, showtype) {
            if (num == 1) {//柱状图
                optioned.tooltip.formatter = '{a} <br/>{b} : {c}';
                optioned.xAxis.show = true;
                optioned.yAxis.show = true;
                // optioned.color = "#086d99";
                optioned.xAxis.data = data1;
                optioned.series = [{
                    name: '业务',
                    type: type,
                    data: data2,
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                var colorList = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"]
                                return colorList[params.dataIndex];
                            }
                        }
                    }
                }]
                if (showtype == "len") {

                }
            } else if (num == 3) {//折线图
                optioned.tooltip.formatter = '{c}<br/>{b}';
                optioned.xAxis.show = true;
                optioned.xAxis.data = data1;
                optioned.yAxis.show = true;
                optioned.color = "red";
                optioned.series = [{
                    name: '业务',
                    type: type,
                    data: data2,
                    symbolSize: 10,
                    lineStyle: {
                        normal: {
                            width: 3
                        }
                    }
                    // smooth: true
                }]
                chartName.setOption(optioned);
            } else {
                optioned.tooltip.formatter = '{a} <br/>{b} : {c}';
                optioned.xAxis.show = true;
                optioned.xAxis.data = data1;
                optioned.yAxis.show = true;
                optioned.series = [{
                    name: '业务',
                    type: type,
                    data: data2,
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                var colorList = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"]
                                return colorList[params.dataIndex];
                            }
                        }
                    }
                }]
            }
            chartName.setOption(optioned);
        }
        function resetBarSize(chartName, data1, data2) {
            optioned2.yAxis.data = data1;
            optioned2.xAxis.type = "value";
            optioned2.series = [{
                name: '业务',
                type: "bar",
                data: data2,
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"]
                            return colorList[params.dataIndex];
                        }
                    }
                }
            }]
            chartName.setOption(optioned2);
        }
        //重置年折线图
        function resetlinBar(chartName, data1, data2) {
            var series = "";
            optioned1.series = [];
            optioned1.tooltip.formatter = '{a} <br/>{b} : {c}';
            optioned1.legend.data = ['业务办理总量'];
            optioned1.legend.data = data1;
            optioned1.xAxis.show = true;
            optioned1.xAxis.data = Object.keys(data2[0]);
            optioned1.yAxis.show = true;
            optioned1.color = "#1d93c6";
            for (var i = 0; i < data2.length; i++) {
                var series = { 'name': data1[i], "type": "line", "data": "", "smooth": true };
                series.data = Object.values(data2[i]);
                optioned1.series.push(series);
            }
            optioned1.color = ["#d54e16", "#e6da17", "#4c8d14", "#25a89e", "#295dde", "#7223d3", "#ae0787", "#aa1643", "#6674aa", "#0fb856", "#e6d90d"];
            chartName.setOption(optioned1);

        }
        //实时数据统计
        function actualData() {
            $.ajax({
                url: "./API/Bank_CallAPI.ashx",
                dataType: "json",
                type: "get",
                data: {
                    Type: "SeleteHandlestatus",
                }, success: function (data) {
                    var data = data.Table;
                    var workingCounter = changeLength(data.isState);
                    var waitingCounter = changeLength(data.zeroState);
                    var workedCounter = changeLength(data.hasState);
                    $(".workingNum").eq(0).html(workingCounter[0]);
                    $(".workingNum").eq(1).html(workingCounter[1]);
                    $(".workingNum").eq(2).html(workingCounter[2]);
                    $(".waitingNum").eq(0).html(waitingCounter[0]);
                    $(".waitingNum").eq(1).html(waitingCounter[1]);
                    $(".waitingNum").eq(2).html(waitingCounter[2]);
                    $(".worked").eq(0).html(workedCounter[0]);
                    $(".worked").eq(1).html(workedCounter[1]);
                    $(".worked").eq(2).html(workedCounter[2]);
                }
            })
        }
        function time() {
            var date = new Date();
            var weekArry = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var y = date.getFullYear();
            var M = (date.getMonth() + 1) >= 10 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
            var d = date.getDate() >= 10 ? date.getDate() : "0" + date.getDate();
            var h = date.getHours() >= 10 ? date.getHours() : "0" + date.getHours();
            var m = date.getMinutes() >= 10 ? date.getMinutes() : "0" + date.getMinutes();
            var s = date.getSeconds() >= 10 ? date.getSeconds() : "0" + date.getSeconds();
            var weekDay = date.getDay();
            var timeStr = y + '年' + M + '月' + d + '日      ' + h + ':' + m + ':' + s;
            document.getElementsByClassName("serviceTimer")[0].innerHTML = timeStr;
        }
        //根据返回的时间转换成时分秒格式
        function formatSeconds(value) {
            var theTime = parseInt(value) / 1000;// 秒
            var middle = 0;// 分
            var hour = 0;// 小时
            if (theTime > 60) {
                middle = parseInt(theTime / 60);
                theTime = parseInt(theTime % 60);
                if (middle > 60) {
                    hour = parseInt(middle / 60);
                    middle = parseInt(middle % 60);
                }
            }
            var result = "" + parseInt(theTime) + "秒";
            if (middle > 0) {
                result = "" + parseInt(middle) + "分" + result;
            }
            if (hour > 0) {
                result = "" + parseInt(hour) + "小时" + result;
            }
            return result;
        }
        //读取当前时间的前几天
        function getBeforeDate(n, str) {
            var n = n;
            var d = new Date(str);
            var year = d.getFullYear();
            var mon = d.getMonth() + 1;
            var day = d.getDate();
            if (day <= n) {
                if (mon > 1) {
                    mon = mon - 1;
                } else {
                    year = year - 1;
                    mon = 12
                }
            }
            d.setDate(d.getDate() - n);
            year = d.getFullYear();
            mon = d.getMonth() + 1;
            day = d.getDate();
            s = year + "-" + (mon < 10 ? ('0' + mon) : mon) + "-" + (day < 10 ? ('0' + day) : day);
            return s;
        }
        //读取当前时间的前几月
        function getBeforeMonthDate(n) {
            var n = n;
            var d = new Date();
            var year = d.getFullYear();
            var mon = d.getMonth() + 1;
            var day = d.getDate();
            if (mon <= n) {
                year = year - 1;
                mon = 12 - (n - mon);
            } else {
                mon = mon - n;
            }
            d.setMonth(d.getMonth() - n);
            year = d.getFullYear();
            mon = d.getMonth() + 1;
            day = d.getDate();
            s = year + "-" + (mon < 10 ? ('0' + mon) : mon) + "-" + (day < 10 ? ('0' + day) : day);
            return s;
        }
        //读取当前时间的前几年
        function getBeforeYearDate(n) {
            var n = n;
            var d = new Date();
            var year = d.getFullYear();
            var mon = d.getMonth() + 1;
            var day = d.getDate();
            year = year - n;
            d.setFullYear(d.getFullYear() - n);
            year = d.getFullYear();
            mon = d.getMonth() + 1;
            day = d.getDate();
            s = year + "-" + (mon < 10 ? ('0' + mon) : mon) + "-" + (day < 10 ? ('0' + day) : day);
            return s;
        }
        function changeDate(type) {
            var date = new Date();
            var weekArry = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var y = date.getFullYear();
            var M = (date.getMonth() + 1) >= 10 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
            var d = date.getDate() >= 10 ? date.getDate() : "0" + date.getDate();
            var h = date.getHours() >= 10 ? date.getHours() : "0" + date.getHours();
            var m = date.getMinutes() >= 10 ? date.getMinutes() : "0" + date.getMinutes();
            var s = date.getSeconds() >= 10 ? date.getSeconds() : "0" + date.getSeconds();
            if (type == "day") {
                return y + "-" + M + "-" + d
            } else if (type == "month") {
                return y + "-" + M;
            } else if (type == "winyear") {
                return (y - 1) + "-" + M + "-" + d;
            } else {
                return y + "-" + M + "-" + d;
            }

        }
        //根据设计需要将没有0的补0
        function changeLength(num) {
            var newNum = "";
            var len = num.length;
            var newLen = 3 - len;
            if (len < 3) {
                for (var i = 0; i < newLen; i++) {
                    newNum += "0";
                }
                return newNum + num;
            } else {
                return num;
            }
        }
        function getCurrentMonthLastDay() {
            var current = new Date();
            var currentMonth = current.getMonth();
            var nextMonth = ++currentMonth;

            var nextMonthDayOne = new Date(current.getFullYear(), nextMonth, 1);

            var minusDate = 1000 * 60 * 60 * 24;

            return new Date(nextMonthDayOne.getTime() - minusDate);
        }
        function getLastMonthAndDay() {
            var nowDate = new Date();
            var year = nowDate.getFullYear();
            var month = nowDate.getMonth() + 1;
            if (month == 0) {
                month = 12;
                year = year - 1;
            }
            var lastDay = getCurrentMonthLastDay();
            var yyyyMMdd = year + "-" + month + "-" + lastDay.getDate();
            return yyyyMMdd;
        }
    </script>
</body>
</html>


