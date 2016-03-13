<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zxc.domain.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>课程评价</title>

    <!-- Bootstrap -->
    <link href="pages/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  
  
  <body>
    
	<div class="container">
		<h3>课程评价</h3>
		<div class="row">
		&nbsp;&nbsp;&nbsp;&nbsp;为了解教学情况，请根据你对本门课程教师教学的感受，认真、实事求是地回答下列问题。本评价只用于评估学校整体教学质量，对个人评价内容实行匿名保护。谢谢你的合作！
		</div><br/>
		
		<%
		
			Student student = (Student) session.getAttribute("student");
			Set<Course> courses = student.getCourse();
			String idstr = request.getParameter("courseId");
			int id = Integer.parseInt(idstr);
			String courseName = "";
			String courseTeacher = "";
			for (Course course : courses) {
				if(course.getId() == id){
					courseName = course.getName();
					courseTeacher = course.getTeacher();
					break;
				}
			}
			
		%>
		
		<form action="${pageContext.request.contextPath}/userAction_evasave.action" method="post">
		<h4><%=courseName %>--<%=courseTeacher%></h4>
		<div class="form-group">
			<div>1、你对本课程教学的总体评价</div>
			<div class="radio">
				<label  class="radio-inline">
					<input type="radio" name="ques1" value="20">好（20分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques1" value="16">较好（16分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques1" value="12">一般（12分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques1" value="8">较差（8分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques1" value="4">差（4分）
				</label>
			</div>
		</div>
		
		
		<div class="form-group">
			<div>2、授课认真负责，精神饱满</div>
			<div class="radio">
				<label  class="radio-inline">
					<input type="radio" name="ques2" value="20">好（20分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques2" value="16">较好（16分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques2" value="12">一般（12分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques2" value="8">较差（8分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques2" value="4">差（4分）
				</label>
			</div>
		</div>
		
		
		<div class="form-group">
			<div>3、按时上下课，不随意接听电话</div>
			<div class="radio">
				<label  class="radio-inline">
					<input type="radio" name="ques3" value="20">好（20分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques3" value="16">较好（16分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques3" value="12">一般（12分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques3" value="8">较差（8分）
				</label>
				<label  class="radio-inline">
					<input type="radio" name="ques3" value="4">差（4分）
				</label>
			</div>
		</div>
		
		
		
		<div class="form-group">
			<div>4、你对该教师及其教学有何建议？</div>
			<div class="col-md-6">
				<input type="text" name= "suggestion" class="form-control" placeholder="Text input">
			</div>
		</div>
		<br/><br/><br/>
		
		<div class="form-group">
			<input type="submit" class="btn btn-default" value="保存"/>
			<input type="hidden" id="courseid" name="courseid" value="<%=id%>"/>
		</div>
		
	 </form>
   </div>
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="pages/js/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
  </body>
</html>