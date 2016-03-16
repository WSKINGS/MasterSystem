<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生首页</title>
<link type="text/css" href="pages/css/base.css"  rel="stylesheet">
<link type="text/css" href="pages/css/header.css" rel="stylesheet">
<link type="text/css" href="pages/css/index.css" rel="stylesheet">
<script type="text/javascript" src="pages/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="pages/js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 
</script> 

<script type="text/javascript">
function ale()
{
   alert("请先对您的所有课程进行评价！");
}
</script>
</head>

<body>

	<%
		String name = (String)session.getAttribute("studentName");
	 %>
   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="pages/images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="pages/images/logotext1.png" width="281" height="30" alt="研究生评价系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role"><%=name%></span><span>欢迎登陆!</span><em> | </em>
            <span><a href="${pageContext.request.contextPath}/userAction_exit.action">注销</a></span></p>
           
         </div>
    </div>
   
   <!-- content -->
        <div  class="content">
            <div class="content_i">
              <div class="menu">
                   <ul>
                      <li  class="current" style="border-top:none;" class="current"><a href="pages/student/index.jsp"><i><img src="pages/images/home.png" width="30" height="27"></i><span>首页</span></a></li>
                      <li><a href="javascript:;" class="active"><i><img src="pages/images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>   
                              <ul style="display:none;">
                                     <li>
                                     	<a href="${pageContext.request.contextPath}/userAction_perinfo.action" >个人信息维护</a>
                                     </li>
                              </ul>

                      </li>
                       <li><a href="javascript:;"><i><img src="pages/images/Thumb.png" width="29" height="29"></i><span>评价及成绩</span></a>
                               <ul style="display:none;">
                               
                               <%
                            		int flag1 = (Integer) session.getAttribute("allEvaluate");
                            		if(flag1 == 1){
                            	%>
                            			<li><a href="${pageContext.request.contextPath}/userAction_scoreinfo.action" >查看成绩</a></li>
                            	<%
                            		} else{
                            	%>
                            			<li><a href="javascript:;" onclick="ale()">查看成绩</a></li>
                            	<%
                            		}
                            	%>
                                   
                                     <li><a href="${pageContext.request.contextPath}/userAction_stuevaluate.action" >课程评价</a></li>
                                           
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
                              <a href="${pageContext.request.contextPath}/userAction_perinfo.action">
                              	<img src="pages/images/personinfo.png" width="129" height="130" alt="个人信息维护">
                              </a>
                              <span>个人信息维护</span>    
                        </dd>
                       
                     </dl>
                     <div class="line m20">
                         <span class="line-text">课程评价及成绩</span>
                     </div>
                     <dl>
                         <dd>
                         		<%
                            		int flag = (Integer) session.getAttribute("allEvaluate");
                            		if(flag == 1){
                            	%>
                            			<a href="${pageContext.request.contextPath}/userAction_scoreinfo.action">
			                              <img src="pages/images/scoreinfo.png" width="129" height="130" alt="查看成绩">
			                            </a>
			                            <span>查看成绩</span>
                            	<%
                            		} else{
                            	%>
                            			<a href="javascript:;" onclick="ale()">
			                              	<img src="pages/images/scoreinfo.png" width="129" height="130" alt="查看成绩">
			                            </a>
			                            <span>查看成绩</span>    
                            	<%
                            		}
                            	%>
                        </dd>
                        <dd>
                              <a href="${pageContext.request.contextPath}/userAction_stuevaluate.action"><img src="pages/images/courseinfo.png" width="129" height="130" alt="课程评价"></a>
                              <span>课程评价</span>    
                        </dd>
                       
                     </dl>

                     
               </div>

            </div>
       </div>   
          

         <div class="footer">
                <div class="footer_i">
                    <p>版权所有：北京理工大学 </p>
                       

               </div>  

         </div>
      
       

         
</body>
</html>
