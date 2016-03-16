<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zxc.domain.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  <style>
 
@media (min-width:1200px){
	.container{width:1200px; background:#fff;}
	}
	 body{background:#f2f2f2;}
   }
   @media (max-width:1200px){
	.container{width:1200px; background:#fff;}
	}
	 body{background:#f2f2f2;}
   }
    .btn-center1{ width:198px; height:22px; margin: 0 333px;}
.btn-center1 a{width:50px; display:block;  margin-right:10px; float:left; height:22px; line-height:22px; text-align:center; color:
#fff; background:#0068b7; font-size:13px; border-radius:3px;  margin-bottom:20px;}

.btn-center1 a.back{background:#d4d1d1; color:#000000;}	
</style>
  </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>课程评价</title>
     <link type="text/css" href="pages/css/base.css"  rel="stylesheet">
	<link type="text/css" href="pages/css/header.css" rel="stylesheet">
	<script type="text/javascript" src="pages/js/jquery-1.9.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="pages/css/bootstrap.min.css" rel="stylesheet">
   <script type="text/javascript">
			function result(){
			//alert("jjjjjj");
				var radio1 = document.formEva.ques1;
				var f1 = 'no';
				var f1Value = document.formEva.ques1.value;
				for(var i1=0;i1<radio1.length;i1++){
					if(radio1[i1].checked){
						f1 = 'ok';
					}
				}
				
				var radio2 = document.formEva.ques2;
				var f2 = 'no';
				var f2Value = document.formEva.ques2.value;
				for(var i2=0;i2<radio2.length;i2++){
					if(radio2[i2].checked){
						f2 = 'ok';
					}
				}
				
				var radio3 = document.formEva.ques3;
				var f3 = 'no';
				var f3Value = document.formEva.ques3.value;
				for(var i3=0;i3<radio3.length;i3++){
					if(radio3[i3].checked){
						f3 = 'ok';
					}
				}
				
				var array = new Array();
				
				
			<%
						List<StuCourse> list = (List<StuCourse>) session.getAttribute("courseList");
						/* List<Double> se = new ArrayList<Double>(); */
						for(StuCourse stuCourse : list){
							/* se.add(stuCourse.getScore()); */
							double score = stuCourse.getScore();
							%>
							 array.push(<%=score%>);
							<%
						}
					%>
				//2、通过c标签循环sinList 并生成添加到array的字符串 
				/* <c:forEach items="${se}" var="a"> 
				   array.push(a); //生成如 array.push(123)的字符串 这样前台拿到后就是js 
				</c:forEach> */
				
				var f = parseInt(f1Value) + parseInt(f2Value) + parseInt(f3Value);
				for(var j=0;j<=array.length;j++){
					array.pop();
					if(f==array.pop()){
						alert('请不要重复打分');
						return false;
					}
				}
				
				
				if(f1 == 'ok'
					&& f2 == 'ok'
					&& f3 == 'ok'
					&& document.formEva.suggestion.value != ""){
					
					return true;
				} else{
					alert('请完整填写！');
					return false;
				}
				 
			}
		</script> 


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head> 
  
  <body style=" background:#f2f2f2;">
        <!--header-->
      <div class="header">
         <div class="header_i">
            <p class="logo"><img src="pages/images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="pages/images/logotext1.png" width="218" height="30" alt="研究生评教系统"></p>
         </div>
     </div>
  
   <!-- content -->
        <div  class="content">
            <div class="content_i"> 
    
         <div class="container" style="padding:0 80px; margin-bottom:20px;">
		<h3 style="margin-left:50%; margin-bottom:30px; margin-top:50px; font-weight:bold;">课程评价</h3>
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
		
		<form name="formEva" id="formEva" onsubmit='return result();' action="${pageContext.request.contextPath}/userAction_evasave.action" method="post">
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
				<input type="text" name= "suggestion" class="form-control" id="suggestion" >
			</div>
		</div>
		<br/><br/><br/>
		
		
		<div class="form-group">
			<input type="submit" class="btn btn-default" value="提交" onclick="return window.confirm('确定提交？')"/>
			<input type="hidden" id="courseid" name="courseid" value="<%=id%>"/>
		</div>
		
	 </form>
	</div>
            </div>
         </div>   
	  <!--footer-->
    <iframe MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no src="pages/footer/footer.html" height=91 width=100%></iframe>   
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="pages/js/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
  </body>
</html>