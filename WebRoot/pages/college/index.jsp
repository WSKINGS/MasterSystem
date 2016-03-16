<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zxc.domain.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>院级管理员</title>
<link type="text/css" href="pages/css/base.css"  rel="stylesheet">
<link type="text/css" href="pages/css/header.css" rel="stylesheet">
<script type="text/javascript" src="pages/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="pages/js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 
</script> 

</head>

<body>
	<%
		Manager manager = (Manager) session.getAttribute("college");
	%>

   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="pages/images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="pages/images/logotext.png" width="218" height="30" alt="研究生评教系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role"><%=manager.getName()%></span><span>欢迎登陆!</span><em> | </em><span><a href="###">注销</a></span></p>
           
         </div>
    </div>
   
   <!-- content -->
        <div  class="content">
            <div class="content_i">
                <div class="menu">
                   <ul>
                      <li class="current" style="border:none;"><a href="javascript:;"><i><img src="pages/images/home.png" width="30" height="27"></i><span>首页</span></a></li>
                      <li><a href="javascript:;" class="active"><i><img src="pages/images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>
 							<ul style="display:none;">
                                 <li><a href="pages/college/inforMaintenance1.jsp">个人信息维护</a></li>
                                           
                           </ul>
                                    

                      </li>
                       <li><a href="javascript:;" class="active"><i><img src="pages/images/Thumb.png" width="29" height="29"></i><span>课程评价系统</span></a>
                               
                             <ul style="display:none;">
                                            <li><a href="pages/college/rate.jsp">评价完成比</a></li>
                                            <li><a href="pages/college/evaluation_statistics.jsp">课程情况</a></li>
                                           
                           </ul>


                       </li>
                   </ul>
               </div>
               <div class="content_r">
                   
                      <div class="line">
                         <span class="line-text">系统管理</span>
                     </div>
                     <dl>
                         
                        <dd>
                              <a href="pages/college/inforMaintenance1.jsp"><img src="pages/images/personinfo.png" width="129" height="130" alt="个人信息维护"></a>
                              <span>个人信息维护</span>    
                        </dd>
                       
                     </dl>
                     <div class="line m20">
                         <span class="line-text">课程评价及成绩</span>
                     </div>
                     <dl>
                         <dd>
                              <a href="pages/college/rate.jsp"> <img src="pages/images/evaluateRate.png" width="129" height="130" alt="评价完成比"></a>
                              <span>评价完成比</span>    
                        </dd>
                        <dd>
                             <a href="pages/college/evaluation_statistics.jsp"><img src="pages/images/courseinfo.png" width="129" height="130" alt="课程情况"></a>
                              <span>课程情况</span>    
                        </dd>
                       
                     </dl>

                     
               </div>

            </div>
       </div>   
          
<!--footer-->
    <iframe MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no src="pages/footer/footer.html" height=91 width=100%></iframe>
       
      
       

         
</body>
</html>
