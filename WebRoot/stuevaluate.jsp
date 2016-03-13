<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.zxc.domain.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuevaluate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
	<table >
        <tr>
            <th>教学班名称<br /></th>
            <th>课程代码<br /></th>
            <th>课程名称<br /></th>
            <th>课程类别<br /></th>
            <th>授课老师<br /></th>
            <th>状 态<br /></th>
            <th>操 作<br /></th>
        </tr>
        <%
        	Set<Course> courses =(Set<Course>) request.getAttribute("courses");
        	
            for (Course course : courses) {
        %>
        <tr>
            <td><%=course.getClassname()%><br /></td>
            <td><%=course.getClasscode()%><br /></td>
            <td><%=course.getName()%><br /></td>
            <td><%=course.getType()%><br /></td>
            <td><%=course.getTeacher()%><br /></td>
            <td><%=course.getState()%><br /></td>
            <td><input type="button" value="评价" onclick="window.location.href='evaluate.jsp'" /><br /></td>
        </tr>
        <%
            }
        %>
    </table>



  </body>
</html>
