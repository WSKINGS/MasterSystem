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
<script type="text/javascript" src="pages/laydate/laydate.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 

function fun(){
	alert("保存成功！");
}

function back()
{
   if(check()){
	 document.personinfo.action="${pageContext.request.contextPath}/userAction_back.action";
  	 document.personinfo.submit();
   }
}
function save()
{
   if(check()){
   	   confirm('确认保存？');
	   document.personinfo.action="${pageContext.request.contextPath}/userAction_save.action";
	   document.personinfo.submit();
   }
}
function ale()
{
   alert("请先对您的所有课程进行评价！");
}

function check() {
	var name = document.personinfo.name.value;
	var radio1 = document.personinfo.gender;
	var gender = '';
	for(var i1=0;i1<radio1.length;i1++){
		if (radio1[i1].checked) {
				gender = 'ok';
		}
	}
	var birthday = document.personinfo.birthday.value;
	var identity = document.personinfo.identity.value;
	var number = document.personinfo.number.value;
	var nation = document.personinfo.nation.value;
	var college = document.personinfo.college.value;
	var profession = document.personinfo.profession.value;
	var duty = document.personinfo.duty.value;
	var education = document.personinfo.education.value;
	var graduateyear = document.personinfo.graduateyear.value;
	var graduateuniversity = document.personinfo.graduateuniversity.value;
	var phone = document.personinfo.phone.value;
	var email = document.personinfo.email.value;
	var Addr = document.personinfo.Addr.value;
		
	if(name!="" && gender=='ok' && birthday!="" && identity!=""
		 && number!="" && nation!="" && college!="" && profession!=""
		 && duty!="" && education!="" && graduateyear!="" && graduateuniversity!=""
		 && phone!="" && email!="" && Addr!="") {
		 return true;
	} else{
		alert('请完整填写！');
		return false;
	}
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
                                
                               <%--  <li><a href="${pageContext.request.contextPath}/userAction_scoreinfo.action" >查看成绩</a></li> --%>
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
                    
                    <form name="personinfo" method="post" onsubmit="return check();">
                     <table >
                          <tr class="header1">
                          	<td>
                          		<span>姓名</span>
                          		<input name="name1" type="text" value='<%=student.getName()%>' readonly="readonly" disabled="true">
                          		<input name="name" type="hidden" value='<%=student.getName()%>'>
                          	</td>
                          	
                          	<%-- <td>
                          		<span>性别</span>
                          		<input name="gender" type="text" value='<%=student.getGender()%>' readonly="readonly">
                          	</td> --%>
                          		
                          		<%
                          			if(student.getGender().equals("男")){
                          				%>
                          				<td>
			                          		<span style="width:50px; text-align:center;">性别</span>
			                          		<input type="radio" name="gender" style="margin:0 12px;" checked="checked" readonly="readonly" value="男">
			                          		<em>男</em>
			                          		<input type="radio" name="gender" style="margin:0 12px;" readonly="readonly" value="女">
			                          		<em>女</em>
		                          		</td>
                          				<%
                          			} else{
                          				%>
                          				<td>
			                          		<span style="width:50px; text-align:center;">性别</span>
			                          		<input type="radio" name="gender" style="margin:0 12px;" readonly="readonly" value="男">
			                          		<em>男</em>
			                          		<input type="radio" name="gender" style="margin:0 12px;" checked="checked" readonly="readonly" value="女">
			                          		<em>女</em>
		                          		</td>
                          				<%
                          			}
                          		%>
                          	
                          	
                          	<%-- <td>
                          		<span>出生年月</span>
                          		<input name="birthday" type="text" value='<%=date%>'>
                          	</td>  --%>
                          	
                          	<td>
                          		<span>出生年月</span>
                          		<input name="birthday" type="text" placeholder="请输入日期" class="laydate-icon" onclick="laydate()" style="width:110px;" value='<%=date %>'>
                            </td>
                          
                          
                          </tr>
                          <tr>
                          	<%-- <td>
                          		<span>证件类型:</span>
                          		<input name="identity" type="text" value='<%=student.getIdentity()%>'>
                          	</td> --%>
                          	
                          	<td>
                          		<span>证件类型:</span>
                          		<select name="identity">
									<%
										if(student.getIdentity().equals("学生证")){
									%>
										<option selected="selected" value="学生证">学生证</option>
                          				<option value="身份证">身份证</option>
                          			<%
										} else{
									%>
										<option value="学生证">学生证</option>
                          				<option selected="selected" value="身份证">身份证</option>
                          			<%
										}
									%>                          		
                          		</select>
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
                          	
                          	<%-- <td>
                          		<span>职称:</span>
                          		<input name="profession" type="text" value='<%=student.getProfession()%>'> 
                          	</td> --%>
                          	
                          	<td>
                          		<span>职称:</span>
                          		<select name="profession">
                          			<%
										if(student.getProfession().equals("学生")){
									%>
										<option selected="selected" value="学生">学生</option>
                          				<option value="老师">老师</option>
                          			<%
										} else{
									%>
										<option value="学生">学生</option>
                          				<option selected="selected" value="老师">老师</option>
                          			<%
										}
									%>       
                          		</select>
                          	</td>
                          	
                          	<td>
                          		<span>行政职务：</span>
                          		<input name="duty" type="text" value='<%=student.getDuty()%>'>
                          	</td>
                          </tr>
                          <tr>
                          	<%-- <td>
                          		<span>最高学历:</span>
                          		<input name="education" type="text" value='<%=student.getEducation()%>'>
                          	</td> --%>
                          	
                          	<td>
                          		<span>最高学历:</span>
                          		<select name="education">
                          			<%
										if(student.getEducation().equals("研究生")){
									%>
										<option selected="selected" value="研究生">研究生</option>
                          				<option value="本科">本科</option>
                          			<%
										} else{
									%>
										<option value="研究生">研究生</option>
                          				<option selected="selected" value="本科">本科</option>
                          			<%
										}
									%>       
                          		</select>
                          	</td>
                          	
                          	<td>
                          		<span>毕业年份:</span>
                          		<%-- <input name="graduateyear" type="text" value='<%=gdate%>'> --%>
                          		<input name="graduateyear" type="text" class="laydate-icon" onclick="laydate()" style="width:110px;" value='<%=gdate %>'>
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
