<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataStatic.aspx.cs" Inherits="Web.Module.BankCall.dataStatic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>大数据展示界面</title>
    <link rel="stylesheet" href="css/swiper5.min.css" />
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script src="js/echarts.min.js"></script>
     <script src="js/swiper5.min.js"></script>
    <style>
        * {
            margin:0;
            padding:0;
        }
        html, body {
            width:1925px;
            height:1085px;
            color:#fff;
            overflow:hidden;
        }
        ul, li {
            list-style:none;
        }
        body {
            background:url("images/databg.jpg") no-repeat;
            background-size:100% 100%;
        }
        #top {
            width:100%;
            text-align:center;
            overflow:hidden;
            height:57px;/*57.3*/
        }
        #top span {
            font-size:32px;
            font-weight:700;
            color:#fff;
            display:block;
            width:100%;
            letter-spacing:25px;
            margin-top:16px;
        }
        #main {
            display:block;
            overflow:hidden;
            width:1760px;
            margin:0 auto;
           
        }
        .serviceContent {
            display:block;
            float:left;
        }
        .serviceLeft {
            width:513px;
            float:left;
            margin-right:15px;
            box-sizing:border-box;
        }
        .serviceLeft .serviceLeftTitle {
            font-size:32px;
            color:#aaddff;
            height:63px;
            line-height:63px;
        }
        .serviceLeftContent {
            width:513px;
            height:307px;
            margin-bottom:7px;
            background:url("images/workDayBg.png") no-repeat;
            background-size:100% 100%;
            overflow:hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1px;
            border: 2px solid #0e81d4;
            box-sizing:border-box;
        }
        .staticTitle {
            width:421px;
            height:55px;
            margin-left:27px;
            background:url("images/worktitlebg.png") no-repeat;
		    background-size: 100% 100%;
            position:relative;
            margin-top:12px;
        }
            .staticTitle img {
                position: absolute;
                left: 33px;
                top: 50%;
                transform: translate(-50%, -50%);
            }
        .staticTitle b {
            position: absolute;
            left: 100px;
            line-height: 55px;
            font-size: 17px;
        }
        .dayStasticContent {
            height:240px;
            width:100%;
            color:#aaddff;
        }
        .monthStasticContent {
            height:240px;
            width:100%;
        }
        .monthWinStasticContent {
            height:240px;
            width:100%;
        }
        .allTimeStasticContent {
            height:423px;
            width:100%;
        }
        .serviceMain {
            width: 908px;
            float: left;
            margin-right: 7px;
            box-sizing: border-box;
        }
        .mainTime {
            width: 100%;
            height: 63px;
            text-align: center;
            position: absolute;
            left: 0;
            line-height: 63px;
        }
        .mainTime .serviceTimer {
            display: block;
            width: 100%;
            font-size: 17px;
            color: #8dc7db;
            letter-spacing: 2px;
        }
        .TrueTimeData {
            display: block;
            width: 100%;
            height:131px;
            margin-top: 63px;
            font-size:25px;
            color:#8dc7db;
            display:flex;
            flex-direction:row;
        }
        .TrueTimeData>div {
            flex:1;
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
            margin-left:0;
        }
        .TrueTimeData > div span{
            display: block;
            float: left;
            line-height: 56.5px;
            margin-top: 31px;
            margin-left:10px;
        }

        .TrueTimeData > div .counterBg {
            width: 38px;
            height: 68px;
            background: url("images/numberBg.png") no-repeat;
            background-size:100% 100%;
            text-align: center;
            margin-left: 7px;
            font-size: 41px;
		    color:#F4F944;
            line-height:68px;
        }
        .trueTimeLine {
            width: 908px;
            height: 489px;
            background: url(images/allTimeBg.png) no-repeat;
            background-size: 100% 100%;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1px;
            box-sizing: border-box;
            overflow:hidden;
            border: 2px solid #0e81d4;
            box-sizing:border-box;
        }
        .winRight {
            width: 317px;
            float: right;
        }
        .winRight .winRightTitle {
            font-size: 32px;
            color: #aaddff;
            height: 63px;
            line-height: 63px;
        }
        .winContent {
            width: 315px;
            height: 307px;
            margin-bottom: 7px;
            background: url(images/winDayBg.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1px;
            border: 2px solid #0e81d4;
            box-sizing:border-box;
        }
        .staticWinTitle {
            width: 268px;
            height: 35px;
            margin-left: 27px;
            background: url(images/wintitileBg.png) no-repeat;
            background-size: 100% 100%;
            position: relative;
            margin-top: 12px;
        }
            .staticWinTitle img {
                left: 27px;
            }

            .staticWinTitle b {
                line-height: 35px;
                font-size: 12px;
                left: 53px;
            }
        .winDayTable {
            width:131px;
            height:213px;
            display:block;
            float:left;
            margin-top:13px;
        }
        .winDayLeftTable {
            margin-left:27px;   
        }
        .winDayTable>ul {
            display:block;
            width:100%;
            height:25px;
            font-size:14px;
        }
        .winDayTable > ul li {
            display: block;
            width: 50%;
            float: left;
            height: 25px;
            line-height: 25px;
            text-align: center;
            border: 1px solid #aaddff;
            box-sizing: border-box;
           
        }
        .winDayTable > ul li:first-child {
            border-right:0;
        }
        .winDayTable .commonTableContent {
            display:block;
            width:100%;
            height:189px;
        }
        .winDayTable .commonTableContent ul {
            display:block;
            width:100%;
            height:25px;

        }
        .winDayTable .commonTableContent ul li {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
            line-height: 25px;
            text-align: center;
            border: 1px solid #aaddff;
            box-sizing: border-box;
            /*border-right:0;*/
            border-top: 0;
            font-size:12px;
        }
        .winDayTable .commonTableContent ul li:first-child{
            border-right:none;
        }
        .winDayRightTable > ul li:first-child {
            border-left:0;
        }
        .winDayRightTable .commonTableContent ul li:first-child {
            border-left:0;
        }
        #bottom {
            display: block;
            overflow: hidden;
            width: 1760px;
            margin: 0 auto;
        }
        .bottomWorkYear {
            width: 710px;
            height: 296px;
            margin-bottom: 10px;
            background: url(images/workDayBg.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 1px;
            float: left;
            margin-top: 1px;
             border: 2px solid #0e81d4;
            box-sizing:border-box;
        }
        .bottomAllWork {
            width: 715px;
            height: 296px;
            margin-bottom: 10px;
            background: url(images/allWork.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 10px;
            float: left;
            margin-top: 1px;
            border: 2px solid #0e81d4;
            box-sizing:border-box;
        }

        .allWorkStasticContent {
            width: 658px;
            height: 201px;
            margin-top: 13px;
            margin-left: 13px;
            color: #aaddff;
        }
        .allWorkTable {
            width:50%;
            height:100%;
        }
            .allWorkTable > ul {
                height: 29px;
            }

        .allWorkRightTable > ul li:first-child {
            border-left: none !important;
        }
        .allWorkRightTableContent ul li:first-child {
            border-left:none;
        }
        .allWorkTable > ul li {
            height:29px;
            line-height:29px;
            font-size:12px;
        }
        .bottomWinYear {
            width: 313px;
            height: 296px;
            margin-bottom: 7px;
            background: url(images/winDayBg.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
            /*box-shadow: 0px 0px 4px #fff;*/
            margin-left: 10px;
            float: left;
            margin-top: 1px;
            border: 2px solid #0e81d4;
            box-sizing:border-box;
        }
        .winYearStasticContent,.winYearStasticContent2 {
            height: 240px;
            width: 100%;
        }
        .workYearStasticContent,.workYearStasticContent2  {
            /*width: 987px;
            height: 302px;*/
            width: 667px;
            height: 215px;
            margin-top: 13px;
            margin-left: 13px;
            color: #aaddff;
        }
        .workYearStasticContent2,.winYearStasticContent2 {
            display:none;
        }
        .workYearStasticCommon {
            display: block;
            width: 50%;
            height: 100%;
            float: left;
        }
        .workYearStasticContentLine {
            width:65%;
        }
        .workYearStasticContentBar {
            width:35%;
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
                    <div class="staticTitle  allTimeStasticTitle">
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
                    <div class="staticTitle  dayWinStasticTitle staticWinTitle ">
                        <img src="images/winday.png" />
                        <b>日统计</b>
                    </div>
                    <div class="dayStasticContent">
                        <div class="winDayLeftTable winDayTable">
                            <ul>
                                <li>窗口名</li>
                                <li>已办业务</li>
                            </ul>
                            <div class="winLeftTableContent commonTableContent commonTableContent1">
                                
                            </div>
                        </div>
                        <div class="winDayRightTable winDayTable">
                            <ul>
                                <li>窗口名</li>
                                <li>已办业务</li>
                            </ul>
                            <div class="winRightTableContent commonTableContent commonTableContent1">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="monthWinStastic winContent">
                    <div class="staticTitle monthWinStasticTitle staticWinTitle">
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
                <%-- 轮播的时候显示下面的 --%>
                <div class="swiper-container workYearStasticContent2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="workYearStasticContentLine1 workYearStasticCommon year1">
                            </div>
                            <div class="workYearStasticContentBar1 workYearStasticCommon year2">
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="workYearStasticContentLine2 workYearStasticCommon year1">
                                一整年
                            </div>
                            <div class="workYearStasticContentBar2 workYearStasticCommon year2">
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="workYearStasticContentLine3 workYearStasticCommon year1">
                                去年
                            </div>
                            <div class="workYearStasticContentBar3 workYearStasticCommon year2">
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="workYearStasticContentLine4 workYearStasticCommon year1">
                                前年
                            </div>
                            <div class="workYearStasticContentBar4 workYearStasticCommon year2">
                            </div>
                        </div>
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
                            <li>业务名称</li>
                            <li>平均办理</li>
                        </ul>
                        <div class="allWorkLeftTableContent commonTableContent commonTableContent2">
                                
                        </div>
                    </div>
                    <div class="allWorkRightTable winDayTable allWorkTable">
                        <ul>
                            <li>业务名称</li>
                            <li>平均办理</li>
                        </ul>
                        <div class="allWorkRightTableContent commonTableContent commonTableContent2">
                                
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottomWinYear">
                 <div class="staticTitle  yearWinStasticTitle staticWinTitle ">
                    <img src="images/winday.png" />
                    <b>年统计</b>
                </div>
                <div class="winYearStasticContent"></div>
                <%-- 轮播的时候显示下面的 --%>
                <div class="swiper-container winYearStasticContent2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide winYearSlide1"></div>
                        <div class="swiper-slide winYearSlide2"></div>
                        <div class="swiper-slide winYearSlide3"></div>
                        <div class="swiper-slide winYearSlide4"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        //备注：这个界面是德胜门的-由于显示器屏幕分别率特殊-用的是绝对宽高--
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

        //新需求
        //11.两个年统计加是否指定显示版本
        //11.1 左侧年统计
        //var yearOrSpecificVersion = 1;//是否指定版本，=0不指定，=1指定。=1年统计显示特定的版本，=0不显示特定版本-就4个版本进行轮播切换-也就是地址栏type值
        //var yearWhichVersion = 1;//统计版本，=0当前年的1-12月，比如当前是22年3月，统计的就是22年1月-22年12月的；=1当前月的一整年，比如当前是22年3月，统计的就是21年3月-22年2月的；=2去年的；=3前年；【=1的时候下面的接口需要新加参数startTime并且参数charttype=2，其他情况charttype=1，并且不需要新加参数startTime】也就是地址栏tag值

        //11.2右侧年统计

        //12.两个日统计，若返回的值是0表示当前天不上班，需要调用前一天的数据，前一天也是0需要访问大前天的，以此类推
        var dayStaticOrNull = 0;//用于记录请求的日统计数据，若这个数据=0表示当天无数据也就是不上班，请求前天的数据，
        var count = 0; //count执行次数 用于判断向前推迟的天数，


        time();
        var optioned = {};
        var optioned1 = {};
        var optioned2 = {};
        var lastTime = "";//每次选择时间插件后记录选择的的value

        var nowDate = new Date();
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        var yearOrSpecificVersion = getUrlParam("type");
        var yearWhichVersion = getUrlParam("tag");
        if (getUrlParam("type") == "" || getUrlParam("type") == null) {
            yearOrSpecificVersion = 0;
        }
        if (getUrlParam("tag") == "" || getUrlParam("tag") == null) {
            yearWhichVersion = 0;
        }
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

                        rotate: 60,
                        textStyle: {
                            color: "#fff"
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
                            color: "#fff"
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
                    axisLabel: {
                        interval: 0,


                        textStyle: {
                            color: "#fff",
                            fontSize: 12
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
                        color: '#ccc'
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
                            fontSize: 10
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

            setInterval("dayStaticOrPrev()", 30 * 1000);//30秒请求下数据看是否当前不上班
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

            if (yearOrSpecificVersion == 0) {
                getPieData("win", 2, 0, 0);
                getPieData("win", 2, 0, 1);
                getPieData("win", 2, 0, 2);
                getPieData("win", 2, 0, 3);
                swiperInit();
                swiperInit2();
            } else {
                if (yearWhichVersion == 0) {
                    getPieData("win", 2, 1, 0);
                    $(".workYearStasticTitle b").html("年统计（" + year + "/1-" + year + "/12）");
                } else if (yearWhichVersion == 1) {
                    getPieData("win", 2, 1);
                    $(".workYearStasticTitle b").html("年统计（" + (year - 1) + "/" + month + "-" + year + "/" + (parseInt(month) - 1) + "）");
                } else if (yearWhichVersion == 2) {
                    getPieData("win", 2, 1);
                    $(".workYearStasticTitle b").html("年统计（" + (year - 1) + "/1-" + (year - 1) + "/12）");
                } else if (yearWhichVersion == 3) {
                    getPieData("win", 2, 1);
                    $(".workYearStasticTitle b").html("年统计（" + (year - 2) + "/1-" + (year - 2) + "/12）");
                }
            }

        })

        function dayStaticOrPrev() {
            //console.log(dayStaticOrNull)
            if (dayStaticOrNull == 0) {
                //这时候每执行一次下面的函数，天数向前推一天，执行这个函数后，有数据就把dayStaticOrNull=1
                count++;
                workCount("work", 1, "cross");//
                winWorkCount("win", 2);
            }
        }

        function swiperInit() {//对swiper添加内容并完成初始化
            var swiper = new Swiper('.workYearStasticContent2', {
                direction: 'horizontal',
                autoplay: {
                    delay: 10000 //自动切换的时间间隔
                },
                observer: true, //启动动态检查器
                observeParents: true,//将observe应用于Swiper的父元素
                onSlideChangeEnd: function (swiper) {
                    swiper.update();
                    swiper.startAutoplay();
                    swiper.reLoop();
                },
                pagination: {
                    el: '.swiper-pagination', //使用分页器导航，el:分页器容器的css选择器或HTML标签。分页器等组件可以置于container之外
                },
            });

            // 滑动-轮播或点击箭头时获取对应的索引 ==> 获取对应的数据
            // swiper.on 事件是swiper官网提供的
            swiper.on('slideChangeTransitionEnd', function () {
                let swiperIndex = swiper.activeIndex;//loop : false时 循环一周后 索引为0的时候取不到
                if (swiperIndex == 0) {
                    $(".workYearStasticTitle b").html("年统计（" + year + "/1-" + year + "/12）");
                } else if (swiperIndex == 1) {
                    $(".workYearStasticTitle b").html("年统计（" + (year - 1) + "/" + month + "-" + year + "/" + (parseInt(month) - 1) + "）");
                } else if (swiperIndex == 2) {
                    $(".workYearStasticTitle b").html("年统计（" + (year - 1) + "/1-" + (year - 1) + "/12）");
                } else if (swiperIndex == 3) {
                    $(".workYearStasticTitle b").html("年统计（" + (year - 2) + "/1-" + (year - 2) + "/12）");
                }
                $('.timeSnapUpSwiperDiv .swiper-slide').eq(swiperIndex).addClass('timeSnapUpActBox').siblings().removeClass('timeSnapUpActBox');
            });
            // 点击-轮播时获取对应的索引 ==> 获取对应的数据
            $('.timeSnapUpSwiperDiv .swiper-slide').click(function () {
                let clickSwiperIndex = $(this).index('.timeSnapUpSwiperDiv .swiper-slide');
                swiper.slideTo(clickSwiperIndex, 500, false); //切换到第一个slide，速度为1秒
                $(this).addClass('timeSnapUpActBox').siblings().removeClass('timeSnapUpActBox');
            })
            $(".workYearStasticTitle b").html("年统计（" + year + "/1-" + year + "/12）");
        }

        function swiperInit2() {//对swiper添加内容并完成初始化
            var swiper = new Swiper('.winYearStasticContent2', {
                direction: 'horizontal',
                autoplay: {
                    delay: 10000 //自动切换的时间间隔
                },
                observer: true, //启动动态检查器
                observeParents: true,//将observe应用于Swiper的父元素
                onSlideChangeEnd: function (swiper) {
                    swiper.update();
                    swiper.startAutoplay();
                    swiper.reLoop();
                },
                pagination: {
                    el: '.swiper-pagination', //使用分页器导航，el:分页器容器的css选择器或HTML标签。分页器等组件可以置于container之外
                },
            });

            // 滑动-轮播或点击箭头时获取对应的索引 ==> 获取对应的数据
            // swiper.on 事件是swiper官网提供的
            swiper.on('slideChangeTransitionEnd', function () {
                let swiperIndex = swiper.activeIndex;//loop : false时 循环一周后 索引为0的时候取不到
                if (swiperIndex == 0) {
                    $(".workYearStasticTitle b").html("年统计（" + year + "/1-" + year + "/12）");
                } else if (swiperIndex == 1) {
                    $(".workYearStasticTitle b").html("年统计（" + (year - 1) + "/" + month + "-" + year + "/" + (parseInt(month) - 1) + "）");
                } else if (swiperIndex == 2) {
                    $(".workYearStasticTitle b").html("年统计（" + (year - 1) + "/1-" + (year - 1) + "/12）");
                } else if (swiperIndex == 3) {
                    $(".workYearStasticTitle b").html("年统计（" + (year - 2) + "/1-" + (year - 2) + "/12）");
                }
                $('.timeSnapUpSwiperDiv .swiper-slide').eq(swiperIndex).addClass('timeSnapUpActBox').siblings().removeClass('timeSnapUpActBox');
            });
            // 点击-轮播时获取对应的索引 ==> 获取对应的数据
            $('.timeSnapUpSwiperDiv .swiper-slide').click(function () {
                let clickSwiperIndex = $(this).index('.timeSnapUpSwiperDiv .swiper-slide');
                swiper.slideTo(clickSwiperIndex, 500, false); //切换到第一个slide，速度为1秒
                $(this).addClass('timeSnapUpActBox').siblings().removeClass('timeSnapUpActBox');
            })
            $(".workYearStasticTitle b").html("年统计（" + year + "/1-" + year + "/12）");
        }


        //根据业务统计所有窗口日办理量(柱状图)
        function workCount(stasticType, signType, showType) {//signType=1：业务，signType=2：窗口
            var starTime = "";
            var endTime = "";
            var myChart = "";
            var myChartNew1 = "";
            var myChartNew2 = "";
            var myChartNew3 = "";
            var myChartNew4 = "";
            if (stasticType == "work") {
                //统计当日所办业务（柱状图）
                starTime = getBeforeDate(1, changeDate("day")) + " 00:00:00";
                endTime = getBeforeDate(1, changeDate("day")) + " 23:59:00";
                if (showType == "cross") {
                    myChart = echarts.init(document.getElementsByClassName('dayStasticContent')[0]);
                    myChartNew1 = echarts.init(document.getElementsByClassName('dayStasticContent')[0]);
                    myChartNew2 = echarts.init(document.getElementsByClassName('dayStasticContent')[0]);
                    myChartNew3 = echarts.init(document.getElementsByClassName('dayStasticContent')[0]);
                    myChartNew4 = echarts.init(document.getElementsByClassName('dayStasticContent')[0]);
                } else if (showType == "len") {
                    //starTime = changeDate("day");
                    //endTime =  changeDate("day");
                    starTime = changeDate("winyear") + " 00:00:00";
                    endTime = changeDate("day") + " 00:00:00";
                    myChart = echarts.init(document.getElementsByClassName('workYearStasticContentBar')[0]);
                    myChartNew1 = echarts.init(document.getElementsByClassName('workYearStasticContentBar1')[0]);
                    myChartNew2 = echarts.init(document.getElementsByClassName('workYearStasticContentBar2')[0]);
                    myChartNew3 = echarts.init(document.getElementsByClassName('workYearStasticContentBar3')[0]);
                    myChartNew4 = echarts.init(document.getElementsByClassName('workYearStasticContentBar4')[0]);
                }

            } else if (stasticType == "win") {
                //统计当月窗口所办业务（柱状图）
                starTime = changeDate("month") + "-01 00:00:00";
                endTime = getLastMonthAndDay() + " 23:59:00";
                myChart = echarts.init(document.getElementsByClassName('monthWinStasticContent')[0]);
                myChartNew1 = echarts.init(document.getElementsByClassName('monthWinStasticContent')[0]);
                myChartNew2 = echarts.init(document.getElementsByClassName('monthWinStasticContent')[0]);
                myChartNew3 = echarts.init(document.getElementsByClassName('monthWinStasticContent')[0]);
                myChartNew4 = echarts.init(document.getElementsByClassName('monthWinStasticContent')[0]);
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
                        //判断数据是否为空
                        if (stasticType == "work" && showType == "cross") {
                            if (result.number == 0) {
                                dayStaticOrNull = 0;
                            } else {
                                dayStaticOrNull = 1;
                            }
                        }

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
                            resetBarSize(myChart, xdata, ydata);
                            resetBarSize(myChartNew1, xdata, ydata);
                            resetBarSize(myChartNew2, xdata, ydata);
                            resetBarSize(myChartNew3, xdata, ydata);
                            resetBarSize(myChartNew4, xdata, ydata);
                        } else {
                            resetBarChar(myChart, xdata, ydata, 'bar', 1, showType);
                            resetBarChar(myChartNew1, xdata, ydata, 'bar', 1, showType);
                            resetBarChar(myChartNew2, xdata, ydata, 'bar', 1, showType);
                            resetBarChar(myChartNew3, xdata, ydata, 'bar', 1, showType);
                            resetBarChar(myChartNew4, xdata, ydata, 'bar', 1, showType);
                        }

                    }
                },
                error: function (a, b, c) {
                    alert("服务器异常");
                }
            })
        }
        //根据业务统计所有窗口月办理量
        function getPieData(type, signType, type2, whichEdition) {
            //以下两个数组为专门为饼状图所需要的数据存储所声明
            var legendData = [];
            var seriesData = [];
            var starTime = "";
            var endTime = "";
            var myChart1 = echarts.init(document.getElementsByClassName('monthStasticContent')[0]);
            //var myChart2 = echarts.init(document.getElementsByClassName('winYearSlide2')[0]);
            //var myChart3 = echarts.init(document.getElementsByClassName('winYearSlide3')[0]);
            //var myChart4 = echarts.init(document.getElementsByClassName('winYearSlide4')[0]);
            var myChart2 = "";
            var myChart3 = "";
            var myChart4 = "";
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

                if (type2 == 0) {
                    if (whichEdition == 0) {
                        myChart1 = echarts.init(document.getElementsByClassName('winYearSlide1')[0]);
                    } else if (whichEdition == 1) {
                        starTime = changeDate("winyear");
                        endTime = changeDate("now");//今年的上月
                        myChart2 = echarts.init(document.getElementsByClassName('winYearSlide2')[0]);
                    } else if (whichEdition == 2) {//去年1-12月
                        starTime = changeDate("quYear1") + " 00:00:00";
                        endTime = changeDate("quYear12") + " 00:00:00";
                        myChart3 = echarts.init(document.getElementsByClassName('winYearSlide3')[0]);
                    } else if (whichEdition == 3) {//前年1-12月
                        starTime = changeDate("qianYear1") + " 00:00:00";
                        endTime = changeDate("qianYear12") + " 00:00:00";
                        myChart4 = echarts.init(document.getElementsByClassName('winYearSlide4')[0]);
                    }
                } else if (type2 == 1) {
                    if (yearWhichVersion == 0) {

                    } else if (yearWhichVersion == 1) {
                        starTime = changeDate("now");//今年的上月
                        endTime = changeDate("winyear");

                    } else if (yearWhichVersion == 2) {//去年
                        starTime = changeDate("quYear1") + " 00:00:00";
                        endTime = changeDate("quYear12") + " 00:00:00";

                    } else if (yearWhichVersion == 3) {//前年
                        starTime = changeDate("qianYear1") + " 00:00:00";
                        endTime = changeDate("qianYear12") + " 00:00:00";
                    }
                }
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
                        // resetPieChart(myChart1,legendData, seriesData,2,type)
                        if (type2 == 0) {
                            if (whichEdition == 0) {
                                resetPieChart(myChart1, legendData, seriesData, 2, type);
                            } else if (whichEdition == 1) {
                                resetPieChart(myChart2, legendData, seriesData, 2, type);
                            } else if (whichEdition == 2) {//去年1-12月
                                resetPieChart(myChart3, legendData, seriesData, 2, type);
                            } else if (whichEdition == 3) {//前年1-12月
                                resetPieChart(myChart4, legendData, seriesData, 2, type);
                            }
                        } else {
                            resetPieChart(myChart1, legendData, seriesData, 2, type);
                        }
                    }
                },
                error: function (a, b, c) {
                    alert("服务器异常");
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
                    alert("服务器异常");
                }
            })
        }
        //前一天个窗口所办的业务总量
        function winWorkCount(stasticType, signType) {
            var starTime = "";
            var endTime = "";
            if (stasticType == "work") {
                //日统计业务量
                //starTime = getBeforeDate(1,changeDate("day"))+" 00:00:00";
                //endTime = getBeforeDate(1,changeDate("day"))+" 23:59:00";
                starTime = getBeforeDate(count, changeDate("day")) + " 00:00:00";
                endTime = getBeforeDate(count, changeDate("day")) + " 23:59:00";
            } else if (stasticType == "win") {
                //starTime = getBeforeDate(1,changeDate("day")) + " 00:00:00";
                //endTime = getBeforeDate(1,changeDate("day")) + " 23:59:00";
                starTime = getBeforeDate(count, changeDate("day")) + " 00:00:00";
                endTime = getBeforeDate(count, changeDate("day")) + " 23:59:00";
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
                        //判断数据是否为空
                        if (data[0].number == 0) {
                            dayStaticOrNull = 0;
                        } else {
                            dayStaticOrNull = 1;
                        }

                        $(".commonTableContent1").html("");
                        var dataStr = data[0].data;
                        for (var i = 0; i < dataStr.length; i++) {
                            var tableStr = "";
                            tableStr = "<ul><li>" + Object.keys(dataStr[i])[0] + "</li><li>" + Object.values(dataStr[i])[0] + "</li></ul>"
                            if (i < 8) {
                                $(".winLeftTableContent").append(tableStr);
                            } else {
                                $(".winRightTableContent").append(tableStr);
                            }
                        }
                        if ($(".commonTableContent1 ul").length < 8) {
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
                        tableStr += '<ul><li>' + serviceName + '</li><li>' + formatSeconds(average) + '</li></ul>';
                        if (i < 6) {
                            $(".allWorkLeftTableContent").append(tableStr);
                        } else {
                            $(".allWorkRightTableContent").append(tableStr);
                        }
                    }
                    if ($(".commonTableContent2 ul").length < 6) {
                        $(".allWorkRightTable").hide();
                        $(".allWorkRightTableContent").hide();
                    } else {
                        $(".allWorkRightTable").show();
                        $(".allWorkRightTableContent").show();
                    }
                }
            })
        }
        function getUrlParam(name) { //读取参数值 这个方法可以解决参数有特殊字符获取不全的问题
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg); //匹配目标参数
            if (r != null) return decodeURIComponent(r[2]);
            return null; //返回参数值
        }

        //当年所有业务办理总量
        function allWorkYearData() {
            if (yearOrSpecificVersion == 0) {//需要调四次下面的接口
                $(".workYearStasticContent2,.winYearStasticContent2").show();
                $(".workYearStasticContent,.winYearStasticContent").hide();
                getYearCountData(0, 0, 1);
                getYearCountData(0, 1, 2);
                getYearCountData(0, 2, 1);
                getYearCountData(0, 3, 1);
            } else if (yearOrSpecificVersion == 1) {
                $(".workYearStasticContent2,.winYearStasticContent2").hide();
                $(".workYearStasticContent2,.winYearStasticContent2").show();
                if (yearWhichVersion == 0) {
                    getYearCountData(1, 0, 1);
                } else if (yearWhichVersion == 1) {
                    getYearCountData(1, 1, 2);
                } else if (yearWhichVersion == 2) {//去年
                    getYearCountData(1, 2, 1);
                } else if (yearWhichVersion == 3) {//前年
                    getYearCountData(1, 3, 1);
                }
            }
        }
        //得到-当年所有业务办理总量
        function getYearCountData(type, whichEdition, charttype) {//type=0轮播需要四个版本都显示出来并进行轮播，=1指定版本不轮播;whichEdition版本号，=0是当前年的1-12月，=1是当前年的一整年，=2去年，=3前年;charttype=2当前年的一整年，其他版本=1
            var start = changeDate("day");
            //var end = "";
            //var charType = 0;
            var dataObj = {
                "charttype": charttype
            };
            if (type == 0) {
                if (whichEdition == 0) {

                } else if (whichEdition == 1) {
                    start = changeDate("now");//今年的上月
                    dataObj = {
                        "charttype": charttype,
                        "startTime": changeDate("winyear"),//一年前
                    }
                } else if (whichEdition == 2) {
                    start = changeDate("winyear");
                } else if (whichEdition == 3) {
                    start = changeDate("theYearBeforeLast");
                }
            } else if (type == 1) {
                if (yearWhichVersion == 0) {

                } else if (yearWhichVersion == 1) {
                    start = changeDate("now");//今年的上月
                    dataObj = {
                        "charttype": charttype,
                        "startTime": changeDate("winyear"),//一年前
                    }
                } else if (yearWhichVersion == 2) {//去年
                    start = changeDate("winyear");
                } else if (yearWhichVersion == 3) {//前年
                    start = changeDate("theYearBeforeLast");
                }
            }
            $.ajax({
                //url: "./API/Bank_CallAPI.ashx",
                //dataType: "json",
                //type: "get",
                //data: {
                //    Type: "RunChartAll",
                //    charttype: 1,
                //    selected: start
                //},
                //url: "dataStatic.json?rand="+Math.random(),
                url: "./API/Bank_CallAPI.ashx?Type=RunChartAll&selected=" + start,
                dataType: "json",
                type: "get",
                data: dataObj,
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
                        //一周年的（21/4---22/3）
                        var xdataNew2 = new Array();
                        var ydataNew2 = new Array();
                        //去年的
                        var xdataNew3 = new Array();
                        var ydataNew3 = new Array();
                        //前年的
                        var xdataNew4 = new Array();
                        var ydataNew4 = new Array();
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
                            if (type == 0) {
                                if (whichEdition == 0) {

                                } else if (whichEdition == 1) {
                                    xdataNew2[index] = name;
                                    ydataNew2[index] = year;
                                } else if (whichEdition == 2) {
                                    xdataNew3[index] = name;
                                    ydataNew3[index] = year;
                                } else if (whichEdition == 3) {
                                    xdataNew4[index] = name;
                                    ydataNew4[index] = year;
                                }
                            } else if (type == 1) {
                                if (yearWhichVersion == 0) {

                                } else if (yearWhichVersion == 1) {
                                    xdataNew2[index] = name;
                                    ydataNew2[index] = year;
                                } else if (yearWhichVersion == 2) {//去年
                                    xdataNew3[index] = name;
                                    ydataNew3[index] = year;
                                } else if (yearWhichVersion == 3) {//前年
                                    xdataNew4[index] = name;
                                    ydataNew4[index] = year;
                                }
                            }
                        })
                        //重置echart变量声明，并赋值
                        var myChart2 = echarts.init(document.getElementsByClassName('workYearStasticContentLine')[0]);

                        if (type == 0) {
                            if (whichEdition == 0) {
                                var myChartRotation1 = echarts.init(document.getElementsByClassName('workYearStasticContentLine1')[0]);//轮播中的-
                                resetlinBar(myChartRotation1, xdata, ydata);
                            } else if (whichEdition == 1) {
                                var myChartRotation2 = echarts.init(document.getElementsByClassName('workYearStasticContentLine2')[0]);//轮播中的整年周年21/4---22/3
                                resetlinBar(myChartRotation2, xdataNew2, ydataNew2);
                            } else if (whichEdition == 2) {
                                var myChartRotation3 = echarts.init(document.getElementsByClassName('workYearStasticContentLine3')[0]);//轮播中的-一去年
                                resetlinBar(myChartRotation3, xdataNew3, ydataNew3);
                            } else if (whichEdition == 3) {
                                var myChartRotation4 = echarts.init(document.getElementsByClassName('workYearStasticContentLine4')[0]);//轮播中的-前年的
                                resetlinBar(myChartRotation4, xdataNew4, ydataNew4);
                            }
                        } else if (type == 1) {
                            resetlinBar(myChart2, xdata, ydata);
                            //if (yearWhichVersion == 0) {
                            //    resetlinBar(myChart2, xdata, ydata);
                            //} else if (yearWhichVersion == 1) {
                            //    resetlinBar(myChart2, xdataNew2, ydataNew2);
                            //} else if (yearWhichVersion == 2) {//去年
                            //    resetlinBar(myChart2, xdataNew3, ydataNew3);
                            //} else if (yearWhichVersion == 3) {//前年
                            //    resetlinBar(myChart2, xdataNew4, ydataNew4);
                            //}
                        }
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
                    optioned.series = [{
                        name: '业务',
                        type: 'pie',
                        radius: '60%',
                        center: ['50%', '50%'],
                        minAngle: 20,
                        label: {
                            formatter: '{{b}:{d}%}'
                        },
                        roseType: 'radius',
                        data: data2
                    }]
                } else {
                    optioned.color = ["#F4F944", "#F7CF89", "#abd66d", "#f19451", "#307897", "#694b95", "#8ccccb", "#089843", "#30c1e9", "#00a9ec", "#eb645a", "#7bc623", "#fffa9e", "#ab1038", "#0567b2", "#ae6301"];
                    optioned.series = [{
                        name: '业务',
                        type: 'pie',
                        radius: '35%',
                        center: ['50%', '50%'],
                        minAngle: 20,
                        label: {
                            formatter: '{{b}:{d}%}'
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
            //var date = new Date();
            //var weekArry = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            //var y = date.getFullYear();
            //var M = (date.getMonth() + 1) >= 10 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
            //var d = date.getDate() >= 10 ? date.getDate() : "0" + date.getDate();
            //var h = date.getHours() >= 10 ? date.getHours() : "0" + date.getHours();
            //var m = date.getMinutes() >= 10 ? date.getMinutes() : "0" + date.getMinutes();
            //var s = date.getSeconds() >= 10 ? date.getSeconds() : "0" + date.getSeconds();
            //if (type == "day") {
            //    return y + "-" + M + "-" + d
            //} else if (type == "month") {
            //    return y + "-" + M;
            //} else if (type == "winyear") {
            //    return (y-1) + "-" + M + "-" + d;
            //} else {
            //    return y + "-" + M + "-" + d;
            //}
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
                //if (count == 0) {
                //    return y + "-" + M + "-" + d
                //} else {
                //    return y + "-" + M + "-" + (d-count)
                //}
            } else if (type == "month") {
                return y + "-" + M;
            } else if (type == "winyear") {
                return (y - 1) + "-" + M + "-" + d;
            } else if (type == "theYearBeforeLast") {
                return (y - 2) + "-" + M + "-" + d;
            } else if (type == "now") {//今年的上一个月
                //日期传1号，后端那边也用不到传过来的日
                return y + "-" + (M - 1) + "-" + "01";
            } else if (type == "quYear1") {
                return (y - 1) + "-" + "01" + "-" + "01";
            } else if (type == "quYear12") {
                return (y - 1) + "-" + "12" + "-" + "31";
            } else if (type == "qianYear1") {
                return (y - 2) + "-" + "01" + "-" + "01";
            } else if (type == "qianYear12") {
                return (y - 2) + "-" + "12" + "-" + "31";
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
