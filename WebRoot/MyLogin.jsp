<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.security.MessageDigest"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link type="text/css" href="pages/css/base.css" rel="stylesheet" />
<link type="text/css" href="pages/css/login.css" rel="stylesheet" />
</head>

<body>
	<div class="header">
		<div class="header_i">
			<p class="logo">
				<img src="pages/images/logo.png" width="60" height="60" />
			</p>
			<p class="logotext">
				<img src="pages/images/logotext.png" width="218" height="30" />
			</p>
		</div>
	</div>

	<div class="mainwrap">
		<div class="mainbox m0">
			<div class="login fr">
				<div class="qrswitch" id="qrswitch">
					<a class="qrswitch_logo" id="qrswitch_logo"
						href="javascript:void(0)" title="二维码登录"></a>
				</div>
				<div class="log-user">

					<form
						action="${pageContext.request.contextPath}/userAction_login.action"
						method="post" id="loginForm" novalidate="novalidate">
						<input type="hidden" name="From" value="2">
						<h2 style="color:#02519c; font-family:"黑体";>用户登录</h2>
						<img src="pages/images/line1.png" width="338" height="3" />
						<div class="userinput">
							<div class="cb">

								<%
									String usernameCookie = null;
									String passwordCookie = null;
									Cookie[] cookies = request.getCookies();
									if (cookies != null) {
										for (Cookie cookie : cookies) {
											if ("SESSION_LOGIN_USERNAME".equals(cookie.getName())) {
												usernameCookie = cookie.getValue(); // 得到cookie的用户名    
												usernameCookie = URLDecoder.decode(usernameCookie,
														"utf-8");
											}
											if ("SESSION_LOGIN_PASSWORD".equals(cookie.getName())) {
												passwordCookie = cookie.getValue(); // 得到cookie的密码    
											}
										}
										if (usernameCookie != null && passwordCookie != null) { // 如果存在
										System.out.println("cookie存在！");
								%>
								<div class="username mb25 mt25">
									<span class="fl"> <img
										src="pages/images/username_03.png" width="38" height="38"
										alt="账户"></span><input type="text" name="name" id="name"
										style="color: rgb(160, 160, 160);width:288px;height:38px;"
										value="<%=usernameCookie%>">
								</div>
								<div class="userpw">
									<span class="fl"> <img
										src="pages/images/password_07.png" width="38" height="38"
										alt="密码"></span> <input name="password" placeholder=" 密码"
										id="password" type="password" autocomplete="off"
										style="color: rgb(160, 160, 160);width:288px;height:38px;"
										value="<%=passwordCookie%>">
								</div>
								<div class="auto mt40">
									<span><a href="###">忘记密码?</a></span> <input type="checkbox"
										name="checkbox" id="checkbox" checked="checked">自动登录 
								</div>

								<%
										} else{
											System.out.println("cookie不存在！");
										%>
										<div class="username mb25 mt25">
											<span class="fl"> <img
												src="pages/images/username_03.png" width="38" height="38"
												alt="账户"></span><input type="text" name="name" id="name"
												style="color: rgb(160, 160, 160);width:288px;height:38px;"
												placeholder=" 账户">
										</div>
										<div class="userpw">
											<span class="fl"> <img
												src="pages/images/password_07.png" width="38" height="38"
												alt="密码"></span> <input name="password" placeholder=" 密码"
												id="password" type="password" autocomplete="off"
												style="color: rgb(160, 160, 160);width:288px;height:38px;">
										</div>
										<div class="auto mt40">
											<span><a href="###">忘记密码?</a></span> <input type="checkbox"
												name="checkbox" id="checkbox">自动登录 
										</div>
		
										<%
										}
									} else {
									System.out.println("cookie不存在2！");
								%>
								<div class="username mb25 mt25">
									<span class="fl"> <img
										src="pages/images/username_03.png" width="38" height="38"
										alt="账户"></span><input type="text" name="name" id="name"
										style="color: rgb(160, 160, 160);width:288px;height:38px;"
										placeholder=" 账户">
								</div>
								<div class="userpw">
									<span class="fl"> <img
										src="pages/images/password_07.png" width="38" height="38"
										alt="密码"></span> <input name="password" placeholder=" 密码"
										id="password" type="password" autocomplete="off"
										style="color: rgb(160, 160, 160);width:288px;height:38px;">
								</div>
								<div class="auto mt40">
									<span><a href="###">忘记密码?</a></span> <input type="checkbox"
										name="checkbox" id="checkbox">自动登录 
								</div>

								<%
								}
								%>

							</div>

							<div class="logbtn cb mt10">
								<input value=" 登    录 " class="btn" type="submit" id="logbtn"
									style="cursor:pointer;width:336px; border:none;height:51px;line-height: 47px;display: block;border: none;background: #024ec6;color: #fff;margin: 0 auto;font-size: 20px;">
							</div>
							<a class="auto-zc mt10" href="###">注册账号</a>
						</div>
					</form>
				</div>

			</div>
		</div>


	</div>

	</div>
	<div class="loginfooter">
		<p class="m0 mt15">版权所有 北京理工大学</p>
	</div>


</body>
</html>
