<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zxc.domain.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学员管理-个人信息维护2</title>
<link type="text/css" href="pages/css/base.css"  rel="stylesheet">
<link type="text/css" href="pages/css/header.css" rel="stylesheet">
<link type="text/css" href="pages/css/table.css" rel="stylesheet">
<script type="text/javascript" src="pages/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="pages/js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 

function fun(){
	alert("保存成功！");
}

function back()
{
   document.personinfo.action="${pageContext.request.contextPath}/userAction_back.action";
   document.personinfo.submit();
}
function save()
{
   document.personinfo.action="${pageContext.request.contextPath}/userAction_save.action";
   document.personinfo.submit();
}
</script> 

</head>

<body>

	<%
	
		String name = (String) session.getAttribute("studentName");
	
	%>

   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="pages/images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="pages/images/logotext1.png" width="281" height="30" alt="研究生成果提交系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role"><%=name %></span><span>欢迎登录!</span><em> | </em>
            <span><a href="${pageContext.request.contextPath}/userAction_exit.action">注销</a></span></p>
           
         </div>
</div>
   
   <!-- content -->
        <div  class="content">
            <div class="content_i">
               <div class="menu">
                   <ul>
                      <li  style="border-top:none; bacground:none;"><a href="pages/student/index.jsp"><i><img src="pages/images/house1.png" width="30" height="27"></i><span>首页</span></a></li>
                      <li><a href="javascript:;" class="active"><i><img src="pages/images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>   
                              <ul>
                                     <li><a href="${pageContext.request.contextPath}/userAction_perinfo.action" class="cur" >个人信息维护</a></li>
                              </ul>

                      </li>
                       <li><a href="javascript:;"><i><img src="pages/images/Thumb.png" width="29" height="29"></i><span>评价及成绩</span></a>
                                <ul style="display:none;">
                                <li><a href="###" >查看成绩</a></li>
                                <li><a href="${pageContext.request.contextPath}/userAction_stuevaluate.action" class="cur" >课程评价</a></li><strong></strong>
     
                            </ul>
                       
                       </li>
                   </ul>
               </div>
               <div class="content_r">
                     <div class="line">
                         <span class="line-text">个人信息维护</span>
                     </div>
                    
                    <%
                    	Student student = (Student) session.getAttribute("student");
                    	
                    	SimpleDateFormat sdf = new SimpleDateFormat();
                    	sdf.applyPattern("yyyy-MM-dd");
                    	String date = sdf.format(student.getBirthday());
                    	String gdate = sdf.format(student.getGraduate_time());
                    	int id = student.getId();
                     %>
                    
                    <form name="personinfo" method="post">
                     <table >
                          <tr class="header1">
                          	<td>
                          		<span>姓名</span>
                          		<input name="name" type="text" value='<%=student.getName()%>' readonly="readonly">
                          	</td>
                          	
                          	<td>
                          		<span>性别</span>
                          		<input name="gender" type="text" value='<%=student.getGender()%>' readonly="readonly">
                          	</td>
                          	
                          	<td>
                          		<span>出生年月</span>
                          		<input name="birthday" type="text" value='<%=date%>'>
                          	</td> 
                          </tr>
                          <tr>
                          	<td>
                          		<span>证件类型:</span>
                          		<input name="identity" type="text" value='<%=student.getIdentity()%>'>
                          	</td>
                          	
                          	<td>
                          		<span>证件号:</span>
                          		<input name="number" type="text" value='<%=student.getNumber()%>'>
                          	</td>
                          	
                          	<td>
	                          	<span>民族：</span>
	                          	<input name="nation" type="text" value='<%=student.getNationality()%>'>
                          	</td> 
                          </tr>
                          
                          <tr class="header1">
                          	<td>
                          		<span>所属院系:</span>
                          		<input name="college" type="text" value='<%=student.getCollege()%>'>
                          	</td>
                          	
                          	<td>
                          		<span>职称:</span>
                          		<input name="profession" type="text" value='<%=student.getProfession()%>'> 
                          	</td>
                          	
                          	<td>
                          		<span>行政职务：</span>
                          		<input name="duty" type="text" value='<%=student.getDuty()%>'>
                          	</td>
                          </tr>
                          <tr>
                          	<td>
                          		<span>最高学历:</span>
                          		<input name="education" type="text" value='<%=student.getEducation()%>'>
                          	</td>
                          	
                          	<td>
                          		<span>毕业年份:</span>
                          		<input name="graduateyear" type="text" value='<%=gdate%>'>
                          	</td>
                          	
                          	<td>
                          		<span>毕业院校：</span>
                          		<input name="graduateuniversity" type="text" value='<%=student.getGraduate_university()%>'>
                          	</td>
                          </tr>
                            
                          <tr class="header1">
                          	<td>
                          		<span>手机号码:</span>
                          		<input name="phone" type="text" value='<%=student.getPhone()%>'>
                          	</td>
                          	
                          	<td>
                          		<span>邮箱地址:</span>
                          		<input name="email" type="text" value='<%=student.getEmail()%>'>
                          	</td>
                          	
                          	<td>
                          		<span>通讯地址：</span>
                          		<input id="Addr" name="Addr" type="text" value='<%=student.getAddress()%>'>
                          	</td>
                          </tr>
                     </table>
                     
                      <div class="btn-center1">
                      	<a href="#" class="save" onclick="save()">保存</a>
                      	<a href="#" class="back" onclick="back()">返回</a>
                      </div>
                      
                  </form>
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
