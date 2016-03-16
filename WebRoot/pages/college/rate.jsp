<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程评价方法统计</title>
<link type="text/css" href="pages/css/base.css"  rel="stylesheet">
<link type="text/css" href="pages/css/header.css" rel="stylesheet">
<link type="text/css" href="pages/css/index.css" rel="stylesheet">
 <link href="pages/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="pages/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="pages/js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 
</script> 
<style>
@media (min-width:1200px){
	.container{width:960px;}
	  .panel-body{  background:#f2f2f2; color:#000;}
	}
</style>
</head>

<body>

   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="pages/images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="pages/images/logotext1.png" width="218" height="30" alt="研究生成果提交系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role">院级管理员</span><span>欢迎登陆!</span><em> | </em><span><a href="###">注销</a></span></p>
           
         </div>
    </div>
   
   <!-- content -->
         <div class="content">
            <div class="content_i">
              <div class="menu" style="height:1250px;">
                  <ul>
                      <li style="border-top:none"><a href="pages/college/index.jsp"><i><img src="pages/images/house1.png" width="30" height="27"></i><span>首页</span></a></li>
  
                      <li><a href="javascript:;" class="active"><i><img src="pages/images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>
                               <ul style="display:none;">
                                      <li><a href="pages/college/inforMaintenance1.jsp"  >个人信息维护</a></li>
                                           
                              </ul>
                      
                      
                      </li>
                      <li><a href="javascript:;" class="active"><i><img src="pages/images/Thumb.png" width="29" height="29"></i><span>评价及成绩</span></a>
                                <ul>
                                     <li><a href="pages/college/rate.jsp" class="cur">评价完成比</a></li>
                                     <li><a href="pages/college/evaluation_statistics.jsp" >课程评价统计</a></li>     
                               </ul>
                      
                      
                      </li>
                   </ul>
               </div>
               <div class="content_r">
                     <div class="line">
                         <span class="line-text">评价完成比</span>
                     </div>
                 <div class="container"  style=" margin-top:20px;">
  
  
    <div class="row">
    <div class="panel panel-default">
      <div class="panel-body">
      本学期共开设92门课程，有1203人参与选课，截至目前已经有745人完成评价，尚有458未完成评价。其中已评价课程为35门，未评价课程为57门。
      </div>
    </div>
    <label>已评价课程占比</label>
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
      60%
      </div>
    </div>
    <label>已评价学生占比</label>
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 54%;">
      54%
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-body">
        在这些评价中，被评为好、较好、一般、较差、差的课程占比为分别为20%,25%,30%,20%,5%.
      </div>
    </div>
    <div class="row">
      <img src="pages/images/class.png"/>
      <h3 style="margin-left:70px;">不同层级课程占比</h3>
    </div>
    <div class="panel panel-default">
      <div class="panel-body">
        各个学院优良课程的占比对比如下：
      </div>
    </div>
    <div class="row">
      <img src="pages/images/student.png"/>
      <h3 style="margin-left:70px;">各学院课程优良率对比图</h3>
    </div>
    <a class="btn btn-default" href="./ping.xlsx">导出</a>
    <br/><br/><br/><br/>
  </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
                     
               </div>

            </div>
       </div>   
          

         <div class="footer">
                <div class="footer_i">
                    <p>版权所有：北京理工大学 </p>
                       

               </div>  

         </div>
      
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   
	
	<script type="text/javascript">
		$(".institute").click(function(){
			$(".active").parent().children("ul").css("display","none");
			$(".active").removeClass("active");
			$(this).addClass("active");
			//$(".aa").css("display","block");
			$(this).parent().children("ul").css("display","block");
		});
	</script>

         
</body>
</html>
