<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zxc.domain.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程评价</title>
<link type="text/css" href="pages/css/base.css"  rel="stylesheet">
<link type="text/css" href="pages/css/header.css" rel="stylesheet">
<link type="text/css" href="pages/css/index.css" rel="stylesheet">
<link type="text/css" href="pages/css/table.css" rel="stylesheet">
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
		String name = (String)session.getAttribute("studentName");
	%>
	
   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="pages/images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="pages/images/logotext1.png" width="281" height="30" alt="研究生成果提交系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role"><%=name%></span><span>欢迎登陆!</span><em> | </em>
            <span><a href="${pageContext.request.contextPath}/userAction_exit.action">注销</a></span></p>
           
         </div>
    </div>
   
   <!-- content -->
        <div  class="content">
            <div class="content_i">
              <div class="menu">
                   <ul>
                      <li    style="border-top:none;"><a href="pages/student/index.jsp"><i><img src="pages/images/house1.png" width="30" height="27"></i><span>首页</span></a></li>
                      <li><a href="javascript:;" class="active"><i><img src="pages/images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>   
                              <ul style="display:none;">
                                     <li><a href="${pageContext.request.contextPath}/userAction_perinfo.action"  >个人信息维护</a></li>
                                     
                                           
                              </ul>

                      </li>
                       <li><a href="javascript:;" class="active"><i><img src="pages/images/Thumb.png" width="29" height="29"></i><span>评价及成绩</span></a>
                            <ul>
                                <li><a href="###" >查看成绩</a></li>
                                <li><a href="${pageContext.request.contextPath}/userAction_stuevaluate.action" class="cur" >课程评价</a></li><strong></strong>
     
                            </ul>
                       
                       </li>
                   </ul>
               </div>
               <div class="content_r">
                   
                      <div class="line">
                         <span class="line-text">课程评价</span>
                     </div>
                     <p  class="course">
                         为了解教学情况，请根据你对本门课程教师教学的感受，认真、实事求是地回答下列问题。本评价只用于评估学校整体教学质量，对个人评价内容实行匿名保护。谢谢你的合作！
                     </p>
                     <table>
                          <tr class="header1">
                          	<td>教学班名称</td>
                          	<td>课程代码</td>
                          	<td>课程名称</td>
                          	<td>课程类别</td>
                          	<td>授课老师</td>
                          	<td>状态</td>
                          	<td>操作</td>
                          </tr>
                          
                          <%
                          
                          	Student student = (Student) session.getAttribute("student");
                          	Set<Course> courses = student.getCourse();
                          	int i = 0;
                          	for (Course course : courses) {
                          		i++;
                          		if(i%2 == 0){
                          			if(course.getState().equals("未评价")){
                          %>
                          		   <tr class="header1">
		                          	<td><%=course.getClassname()%><br /></td>
						            <td><%=course.getClasscode()%><br /></td>
						            <td><%=course.getName()%><br /></td>
						            <td><%=course.getType()%><br /></td>
						            <td><%=course.getTeacher()%><br /></td>
						            <td><%=course.getState()%><br /></td>
		                          	<td><a href="${pageContext.request.contextPath}/userAction_evaluate.action?courseId=<%=course.getId()%>">进行评价</a></td>
		                          </tr>
                          
                          <%
                          			} else{
                          %>
                          		  <tr class="header1">
		                          	<td><%=course.getClassname()%><br /></td>
						            <td><%=course.getClasscode()%><br /></td>
						            <td><%=course.getName()%><br /></td>
						            <td><%=course.getType()%><br /></td>
						            <td><%=course.getTeacher()%><br /></td>
						            <td><%=course.getState()%><br /></td>
		                          	<td><a href="${pageContext.request.contextPath}/userAction_evaluate.action?courseId=<%=course.getId()%>">修改评价</a></td>
		                          </tr>
                          
                          <%
                          			}
                         
                          		} else{
                          			if(course.getState().equals("未评价")){
                          
                          %>
                          		  <tr class="">
		                          	<td><%=course.getClassname()%><br /></td>
						            <td><%=course.getClasscode()%><br /></td>
						            <td><%=course.getName()%><br /></td>
						            <td><%=course.getType()%><br /></td>
						            <td><%=course.getTeacher()%><br /></td>
						            <td><%=course.getState()%><br /></td>
		                          	<td><a href="${pageContext.request.contextPath}/userAction_evaluate.action?courseId=<%=course.getId()%>">进行评价</a></td>
		                          </tr>
                          <%
                          			} else{
                          %>
                          		  <tr class="">
		                          	<td><%=course.getClassname()%><br /></td>
						            <td><%=course.getClasscode()%><br /></td>
						            <td><%=course.getName()%><br /></td>
						            <td><%=course.getType()%><br /></td>
						            <td><%=course.getTeacher()%><br /></td>
						            <td><%=course.getState()%><br /></td>
		                          	<td><a href="${pageContext.request.contextPath}/userAction_evaluate.action?courseId=<%=course.getId()%>">修改评价</a></td>
		                          </tr>
                          <%
                          			}
                          		}
                          	}
                          %>
       
                     </table>
                     <div class="btn-center"><a href="###" class="tj" >提交</a></div>
                     
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
