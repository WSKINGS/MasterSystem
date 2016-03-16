<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程评价方法统计</title>
<link type="text/css" href="../css/base.css"  rel="stylesheet">
<link type="text/css" href="../css/header.css" rel="stylesheet">
<link type="text/css" href="../css/index.css" rel="stylesheet">
 <link href="../css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 
</script> 
<style>
@media (min-width:1200px){
	.container{width:960px;}
	}
.btn-center1{ width:198px; height:22px; }
.btn-center1 a{width:50px; margin-left:-45px;display:block; margin-right:10px; float:left; height:22px; line-height:22px; text-align:center; color:
#fff; background:#0068b7; font-size:13px; border-radius:3px;}
.btn-center1 a.back{background:#d4d1d1; color:#000000;}

</style>
</head>

<body>

   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="../images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="../images/logotext1.png" width="218" height="30" alt="研究生成果提交系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role">院级管理员</span><span>欢迎登陆!</span><em> | </em><span><a href="###">注销</a></span></p>
           
         </div>
    </div>
   
   <!-- content -->
        <div  class="content">
            <div class="content_i">
              <div class="menu">
                   <ul>
                      <li  style="border-top:none;"><a href="index.html"><i><img src="../images/house1.png" width="30" height="27"></i><span>首页</span></a></li>
                      <li><a href="###" class="active"><i><img src="../images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>
              <ul style="display:none;">
                                           <li><a href="inforMaintenance1.html"  >个人信息维护</a></li>
                                           
                           </ul>
                                    

                      </li>
                       <li><a  href="###" class="cur"><i><img src="../images/Thumb.png" width="29" height="29"></i><span>课程评价系统</span></a>
                            
							 <ul style="display:none;">
                                            <li><a href="rate.html">评价完成比</a></li>
                                            <li><a href="evaluation_statistics.html"  class="cur">课程情况</a></li>
                                           
                           </ul>
                       </li>
                   </ul>
               </div>
               <div class="content_r">
                     <div class="line">
                         <span class="line-text">课程评价统计</span>
                     </div>
                     <div class="container" style="margin-top:20px;">
					<div class="col-md-6">
    					<ul class="list-group">
					<div>
	 				 <li class="list-group-item institute">
						<span class="badge">平均分：100</span>
										计算机学院
	  				</li>
                      <ul class="list-group" style="margin-left:20px;display:none">
                          <li class="list-group-item">
                            <span class="badge">平均分：100</span>
                            <a href="../evaluate/pages/studentlist.html">组成原理</a>			
                          </li>
                          <li class="list-group-item">
                            <span class="badge">平均分：100</span>
                            数据挖据			
                          </li>
                          <li class="list-group-item">
                            <span class="badge">平均分：100</span>
                            信息安全			
                          </li>
                        </ul>
                  </div>
                  <div>
                  <li class="list-group-item institute">
                    <span class="badge">平均分：90</span>
                    自动化学院
                  </li>
                  <ul class="list-group" style="margin-left:20px;display:none">
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        自动化1			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        自动化2			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        自动化3			
                      </li>
                    </ul>
                  </div>
                  <div>
                  <li class="list-group-item institute">
                    <span class="badge">平均分：80</span>
                    软件学院
                  </li>
                  <ul class="list-group" style="margin-left:20px;display:none">
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        软件1			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        软件2			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        软件3			
                      </li>
                    </ul>
                  </div>
                  <div>
                  <li class="list-group-item institute">
                    <span class="badge">平均分：70</span>
                    数学学院
                  </li>
                  <ul class="list-group" style="margin-left:20px;display:none">
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        数学1			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        数学2			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        数学3			
                      </li>
                    </ul>
                  </div>
                  <div>
                  <li class="list-group-item institute">
                    <span class="badge">平均分：60</span>
                    物理学院
                  </li>
                  <ul class="list-group" style="margin-left:20px;display:none">
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        物理1			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        物理2			
                      </li>
                      <li class="list-group-item">
                        <span class="badge">平均分：100</span>
                        物理3			
                      </li>
                    </ul>
                  </div>
                </ul>
                
	<br/></br/>
	 <div class="btn-center1">
	    <a href="JavaScript:;">导出</a>
	</div>
	</div>
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
    <script src="../js/bootstrap.min.js"></script>
	
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
