<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>校级管理员管理-个人信息维护2</title>
<link type="text/css" href="../css/base.css"  rel="stylesheet">
<link type="text/css" href="../css/header.css" rel="stylesheet">
<link type="text/css" href="../css/table.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){
  $(".menu ul li").menu();
}); 
</script> 

</head>

<body>

   <div class="header">
         <div class="header_i">
            <p class="logo"><img src="../images/logo.png" width="60" height="60" alt="logo"></p>
            <p class="logotext"><img src="../images/logotext.png" width="218" height="30" alt="研究生评教系统系统"></p>
            <p class="login"><span>欢迎您:</span><span class="role">院级管理员</span><span>欢迎登陆!</span><em> | </em><span><a href="###">注销</a></span></p>
           
         </div>
</div>
   
   <!-- content -->
        <div  class="content">
            <div class="content_i">
               <div class="menu">
                   <ul>
                      <li  style="border:none;"><a href="../college/index.jsp"><i><img src="../images/house1.png" width="30" height="27"></i><span>首页</span></a></li>
                      <li><a href="javascript:;" class="active"><i><img src="../images/setting1.png" width="29" height="29"></i><span>系统管理</span></a>
 							<ul>
                                           <li><a href="javascript:;" class="cur"  >个人信息维护</a></li>
                                           
                           </ul>
                                    

                      </li>
                       <li><a  href="javascript:;" class="active"><i><img src="../images/Thumb.png" width="29" height="29"></i><span>课程评价系统</span></a>
                               
                             <ul style="display:none;">
                                            <li><a href="../college/rate.jsp">评价完成比</a></li>
                                            <li><a href="../college/evaluation_statistics.jsp">课程情况</a></li>
                                           
                           </ul>


                       </li>
                   </ul>
               </div>
               <div class="content_r">
                     <div class="line">
                         <span class="line-text">个人信息维护</span>
                     </div>
                    
                    <table class="info">
                          <tr class="header1">
	                          <td><span>姓名</span><input type="text" readOnly="true"disabled="true"> </td>
	                          <td><span style="width:50px; text-align:center;">性别</span><input type="radio" name="gender" style="margin:0 12px;"><em>男</em><input type="radio" name="gender" style="margin:0 12px;"><em>女</em></td>
	                          <td><span>出生年月</span><input type="text"placeholder="请输入日期" class="laydate-icon" onclick="laydate()" style="width:110px;"> </td>
                          </tr>
                           <tr>
	                           <td><span>证件类型:</span><select ><option>学生证</option></select> </td>
	                           <td><span>证件号:</span><input type="text"> </td>
	                           <td><span>名族：</span><select ><option>汉</option></select> </td>
                            </tr>
                            <tr class="header1">
	                            <td><span>所属院系:</span><select ><option>计算机学院</option></select>  </td>
	                            <td><span>职称:</span><select ><option>中级</option></select>  </td>
	                            <td><span>行政职务</span><select ><option>助教</option></select>  </td>
                             </tr>
                            <tr>
	                            <td><span>最高学历:</span><select ><option>研究生</option></select>  </td>
	                            <td><span>毕业院校:</span><select ><option>北大</option></select>  </td>
	                            <td><span>授予年份：</span><input type="text"></td> 
                            </tr>
                            <tr class="header1">
	                            <td><span>手机号码:</span><input type="text" > </td>
	                            <td><span>邮箱地址:</span><input type="text"> </td>
	                            <td><span>通讯地址：</span><input type="text"> </td> 
                            </tr>
                     </table>
                     <div class="btn-center1"><a href="###" class="save">保存</a><a href="javascript:;" class="back">返回</a></div>
                     
                            
               </div>

            </div>
       </div>   
          
<!--footer-->
    <iframe MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no src="../footer/footer.html" height=91 width=100%></iframe>
       
       

         
</body>
</html>
