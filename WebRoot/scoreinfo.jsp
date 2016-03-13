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
    
    <title>My JSP 'scoreinfo.jsp' starting page</title>
    
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
            <th>课程名称<br /></th>
            <th>课程类别<br /></th>
            <th>分 数<br /></th>
        </tr>
        <%
        	Set<Course> courses =(Set<Course>) request.getAttribute("courses");
        	List<Double> scores = (List<Double>) request.getAttribute("scores");
        	Iterator<Course> it = courses.iterator();
        	Iterator<Double> it2 = scores.iterator();
        	while(it.hasNext() && it2.hasNext()){
        		Course course = it.next();
        		double score = it2.next();
        %>
        <tr>
            <td><%=course.getName()%><br /></td>
            <td><%=course.getType()%><br /></td>
            <td><%=score%><br /></td>
        </tr>
        <%
            }
        %>
    </table>
  </body>
</html>
