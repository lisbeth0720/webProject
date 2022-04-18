<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="evaluate.aspx.cs" Inherits="Web.Module.BankCall.evaluate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>评价页面</title>
     <script src="js/jquery-1.9.1.js"></script>
    <style>
        *{
            padding:0;
            margin:0;
            list-style:none;
        }
         html,body,#form1{
            height:100%;
            width:100%;
        }
         body{
            background:url("../images/evaluate/background.jpg") no-repeat;
            background-size:100% 100%;
            overflow:hidden;
          
         }
        
         header{
             height:11%;
             width:100%;
             /*border:1px solid red;*/
         }
         #welcome{
              float:left;
             height:99%;
             width:49%;
             color:#fff;
             font-size:3.4vw;
             letter-spacing:0.3em; 
             position:relative;     
         }
         #welcome>span{
             display:inline-block;
             font-weight:600;
             position:relative;
             top:50%;
             left:50%;
             transform:translate(-50%,-50%);
         }
         #time{
             float:right;
             height:100%;
             width:45%;
             color:#fff;
             font-size:2.4vw;
             position:relative;
         }
        .timeBox{
            height:60%;
            width:70%;
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);  
        }
        
         #year,#clock{
             display:inline-block;
             height:99%;
             width:60%;
             
         }
         #clock{
              width:30%;
         }
         #evaluateBox{
             height:88%;
             width:100%;
             position:relative;
         }
         .evaluateTitle{
             height:12%;
             width:60%;
             margin-top:5%;
             position:relative;
             left:20%;
             background:url("../images/evaluate/evaluateTitle.png") no-repeat;
             background-size:100% 100%;
             color:#fff;
             font-size:2.4vw;
             letter-spacing:0.6em;
             text-align:center;
             padding:1%;
             box-sizing:border-box;
         }
         .evaluateMain{
             height:21%;
             width:70%;
             margin-top:2%;
             position:relative;
             left:15%;
             /*border:1px solid red;*/
         }
         .descripe{
             float:left;
             position:relative;
             height:60%;
             width:30%;
             top:20%;
             /*border:1px solid red;*/
             font-size:3.2vw;
             letter-spacing:0.2em;
             font-weight:500;
         }
         .img{
             float:left;
             width:69%;
             height:100%;
         }
         .img li{
             float:left;
             width:16%;
             height:100%;
             margin-right:2%;
         }
         .img li i{
             display:block;
             height:66%;
             width:100%;
             
         }
          .img li span{
             display:block;
             height:27%;
             width:100%;
             text-align:center;
             margin-top :6%;
             box-sizing:border-box;
             font-size:1.2vw;
             letter-spacing:0.1em;
             padding-left:10%;
          }
      
         .veryPoor>i{
             background:url("../images/evaluate/1.png") no-repeat;
             background-size:100% 100%; 
             cursor: pointer;   
         }
        .veryPoor>i:hover{
             background:url("../images/evaluate/evaluate_01.png") no-repeat;
             background-size:100% 100%;    
         }

         .poor>i{
            background:url("../images/evaluate/2.png") no-repeat;
            background-size:100% 100%;
            cursor: pointer;     
         }
        .poor>i:hover{
            background:url("../images/evaluate/evaluate_02.png") no-repeat;
            background-size:100% 100%;    
         }
         .commonly>i{
            background:url("../images/evaluate/3.png") no-repeat;
            background-size:100% 100%;  
            cursor: pointer;   
         }
         .commonly>i:hover{
            background:url("../images/evaluate/evaluate_03.png") no-repeat;
            background-size:100% 100%;    
         }
         .satisfied>i{
            background:url("../images/evaluate/4.png") no-repeat;
            background-size:100% 100%;   
            cursor: pointer;  
         }
         .satisfied>i:hover{
            background:url("../images/evaluate/evaluate_04.png") no-repeat;
            background-size:100% 100%;   
         }
         .verySatisfied>i{
            background:url("../images/evaluate/5.png") no-repeat;
            background-size:100% 100%; 
            cursor: pointer;    
         }
        .verySatisfied>i:hover{
            background:url("../images/evaluate/evaluate_05.png") no-repeat;
            background-size:100% 100%;    
         }
         .evaluateType{
             height:57%;
             width:60%;
             margin-top:2%;
             position:relative;
             left:20%;
         }
         .evaluateType div{
             height:20%;
             width:100%;
             margin-bottom:1%;
             position:relative;
         }
         
        .evaluateType div span{
            display:inline-block;
        }  
        .serviceDes{
            height:99%;
            width:24%;
            font-size:2.6vw;
            letter-spacing:0.3em;
            position:absolute;
            padding-top:2%;
            box-sizing:border-box;
            
         }
        .evaluateType div .star{
             height:99%;
             width:69%;
             margin-right:2%;
             position:relative;
             left:27%;
             cursor: pointer; 
         }
       .evaluateType div .star img{
           height:76%;
           width:10%;
           margin-right:6%;
           box-sizing:border-box;
           position:relative;
           top:12%;
         }
      .evaluateType div .star .desc{
             display:inline-block;
             height:99%;
             width:15%;
             text-align:center;
             font-size:1.4vw;
             position:absolute;
             top:0;
             right:0;
             padding-top:5%;
             box-sizing:border-box;
          }
         
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
     <header>
          <div id="welcome"><span>欢迎您的光临!</span></div>
          <div id="time">  
             <div class="timeBox">
                <!--年月日-->
               <span id="year"></span>
               <span id="clock"></span>
            </div>
               
         </div>
     </header>   
     <div id="evaluateBox">
         <div class="evaluateTitle">
             <b>请您对本次服务进行评价</b>
         </div>
         <div class="evaluateMain">
             <div class="descripe">当前满意度</div>
             <ul class="img">
                 <li class="veryPoor">
                     <i></i>
                     <span>非常差</span>
                 </li>
                 <li class="poor">
                     <i></i>
                     <span>差</span>
                 </li>
                 <li class="commonly">
                     <i></i>
                     <span>一般</span>
                 </li>
                 <li class="satisfied">
                     <i></i>
                     <span>满意</span>
                 </li>
                 <li class="verySatisfied">
                     <i></i>
                     <span>非常满意</span>
                 </li>
             </ul>
         </div>
         <div class="evaluateType">
             <div class="serviceAttitude">
                 <span class="serviceDes">服务态度</span>
                 <span class="star attitude">
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <span class="desc"></span>
                 </span>
            </div>

             <div class="efficiencyService">
                 <span class="serviceDes">效率服务</span>
                 <span class="star efficiency">
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <span class="desc"></span>
                 </span>
             </div>
             <div class="businessServices">
                 <span class="serviceDes">业务服务</span>
                 <span class="star business">
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <img src="../images/evaluate/star.png"/>
                     <span class="desc desc3 "></span>
                 </span>
            </div>
     </div>
     </div>
        
    </form>
    <script>

        $(function () {
            displayTime();
            getYear();
            setInterval("displayTime();", 1000);
            setInterval("getYear()", 3600000);
        })
        function displayTime() {
            var clo = $("#clock");
            var now = new Date();
            //            clo.innerHTML = now.toLocaleTimeString();
            var Hours = addZero(now.getHours(), 2, 0);
            var Minutes = addZero(now.getMinutes(), 2, 0);
            var Second = addZero(now.getSeconds(), 2, 0);
            clo.html(Hours + ":" + Minutes + ":" + Second);

        }
        function getYear() {
            var nowDate = new Date();
            var year = nowDate.getFullYear();
            var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1)
                : nowDate.getMonth() + 1;
            var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate
                .getDate();
            dateStr = year + "年" + month + "月" + day + "日"; 
            $("#year").html(dateStr);
        }
        function addZero(str, len, ch) {
            str = String(str);//需要补全的变量、补全之后的长度、用什么来补全
            var i = -1;
            if (!ch && ch !== 0) ch = ' ';
            len = len - str.length;
            while (++i < len) {
                str = ch + str;
            }
            //                return str;
            return str > 0 ? str : "00";
        }
       
        $('.attitude img').each(function (index) {
              var star = '../images/evaluate/star.png';	//普通灰色星星图片的存储路径
              var starYellow = '../images/evaluate/star_yellow.png';		//黄色色星星图片存储路径
              var prompt = ['非常差', '差', '一般', '满意', '非常满意'];	//评价提示语
              this.id = index;		//遍历img元素，设置单独的id
              $(this).on("click", function () {	//设置鼠标滑动和点击都会触发事件
                  $('.attitude img').attr('src', star);//当“回滚”、“改变主意”时，先复位所有图片为没有打星的图片颜色
                  $(this).attr('src', starYellow);		//设置鼠标当前所在图片为打星颜色图
                  $(this).prevAll().attr('src', starYellow);	//设置鼠标当前的前面星星图片为打星颜色图
                  $(this).siblings('.desc').text(prompt[this.id]);		//根据id的索引值作为数组的索引值
              });
        });


        $('.efficiency img').each(function (index) {
            var star = '../images/evaluate/star.png';	//普通灰色星星图片的存储路径
            var starYellow = '../images/evaluate/star_yellow.png';		//黄色色星星图片存储路径
            var prompt = ['非常差', '差', '一般', '满意', '非常满意'];	//评价提示语
            this.id = index;		//遍历img元素，设置单独的id
            $(this).on("click", function () {	//设置鼠标滑动和点击都会触发事件
                $('.efficiency img').attr('src', star);//当“回滚”、“改变主意”时，先复位所有图片为没有打星的图片颜色
                $(this).attr('src', starYellow);		//设置鼠标当前所在图片为打星颜色图
                $(this).prevAll().attr('src', starYellow);	//设置鼠标当前的前面星星图片为打星颜色图
                $(this).siblings('.desc').text(prompt[this.id]);		//根据id的索引值作为数组的索引值
            });
        });

        $('.business img').each(function (index) {
            var star = '../images/evaluate/star.png';	//普通灰色星星图片的存储路径
            var starYellow = '../images/evaluate/star_yellow.png';		//黄色色星星图片存储路径
            var prompt = ['非常差', '差', '一般', '满意', '非常满意'];	//评价提示语
            this.id = index;		//遍历img元素，设置单独的id
            $(this).on("click", function () {	//设置鼠标滑动和点击都会触发事件
                $('.business img').attr('src', star);//当“回滚”、“改变主意”时，先复位所有图片为没有打星的图片颜色
                $(this).attr('src', starYellow);		//设置鼠标当前所在图片为打星颜色图
                $(this).prevAll().attr('src', starYellow);	//设置鼠标当前的前面星星图片为打星颜色图
                $(this).siblings('.desc').text(prompt[this.id]);		//根据id的索引值作为数组的索引值
            });
        });

       

   var fg;
   $(".veryPoor").off("click").on("click",function () {
          $(".veryPoor>i").css({
               "background":"url('../images/evaluate/evaluate_01.png') no-repeat",
               "background-size":"100% 100%"
          });
        if(fg==4){
          $(".satisfied>i").css({
               "background":"url('../images/evaluate/1.png') no-repeat",
               "background-size":"100% 100%"
          });
        }else if(fg==2){ 
           $(".poor>i").css({
               "background":"url('../images/evaluate/2.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else if(fg==3){
                $(".commonly>i").css({
               "background":"url('../images/evaluate/3.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else{
               $(".verySatisfied>i").css({
               "background":"url('../images/evaluate/5.png') no-repeat",
               "background-size":"100% 100%"
          });
         }
         fg=1;
 })

  $(".poor").off("click").on("click",function () {
         $(".poor>i").css({
               "background":"url('../images/evaluate/evaluate_02.png') no-repeat",
               "background-size":"100% 100%"
          });
        if(fg==4){
          $(".satisfied>i").css({
               "background":"url('../images/evaluate/1.png') no-repeat",
               "background-size":"100% 100%"
          });
        }else if(fg==1){
           $(".veryPoor>i").css({
               "background":"url('../images/evaluate/2.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else if(fg==3){
                $(".commonly>i").css({
               "background":"url('../images/evaluate/3.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else{
               $(".verySatisfied>i").css({
               "background":"url('../images/evaluate/5.png') no-repeat",
               "background-size":"100% 100%"
          });
         }
          fg=2;
  })
  $(".commonly").off("click").on("click",function () {
          $(".commonly>i").css({
               "background":"url('../images/evaluate/evaluate_03.png') no-repeat",
               "background-size":"100% 100%"
          });
        if(fg==1){ $(".veryPoor>i").css({
               "background":"url('../images/evaluate/1.png') no-repeat",
               "background-size":"100% 100%"
          });
        }else if(fg==2){
           $(".poor>i").css({
               "background":"url('../images/evaluate/2.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else if(fg==4){
               $(".satisfied>i").css({
               "background":"url('../images/evaluate/4.png') no-repeat",
               "background-size":"100% 100%"
          }); 
         }else{
               $(".verySatisfied>i").css({
               "background":"url('../images/evaluate/5.png') no-repeat",
               "background-size":"100% 100%"
          });
         }
            fg=3;
      })
  $(".satisfied").off("click").on("click",function () {
          $(".satisfied>i").css({
               "background":"url('../images/evaluate/evaluate_04.png') no-repeat",
               "background-size":"100% 100%"
          });
       if(fg==1){
          $(".veryPoor>i").css({
               "background":"url('../images/evaluate/1.png') no-repeat",
               "background-size":"100% 100%"
          });
        }else if(fg==2){    
           $(".poor>i").css({
               "background":"url('../images/evaluate/2.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else if(fg==3){
                $(".commonly>i").css({
               "background":"url('../images/evaluate/3.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else{
               $(".verySatisfied>i").css({
               "background":"url('../images/evaluate/5.png') no-repeat",
               "background-size":"100% 100%"
          });
         }
        fg=4;
      })

  $(".verySatisfied").off("click").on("click",function () {
          $(".verySatisfied>i").css({
               "background":"url('../images/evaluate/evaluate_05.png') no-repeat",
               "background-size":"100% 100%"
          });  
      if(fg==1){
          $(".veryPoor>i").css({
               "background":"url('../images/evaluate/1.png') no-repeat",
               "background-size":"100% 100%"
          });
        }else if(fg==2){    
           $(".poor>i").css({
               "background":"url('../images/evaluate/2.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else if(fg==3){
                $(".commonly>i").css({
               "background":"url('../images/evaluate/3.png') no-repeat",
               "background-size":"100% 100%"
          });
         }else{
               $(".satisfied>i").css({
               "background":"url('../images/evaluate/4.png') no-repeat",
               "background-size":"100% 100%"
          });
         }
         fg=5;
      })

 

        

       
</script>
</body>
</html>
