<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<html>
  <head>
    <title>c操作人员注册页面</title>
    <meta name="description" content="a simple demo to Web APP">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
  </head>
  
  <body>
	
	<h2 align=center>注册页面</h2>
	<center>
  	
  		<form action="registercheck.jsp" method="post">  
  			<table border="1">
  				<tr>
  					<td>员工姓名：</td>
  					<td><input name="userName"></td>
  				</tr>
  				<tr>
  					<td>密码：</td>
  					<td><input name="password" type="password"></td>
  				</tr>
  				<tr>
  					<td>重复密码：</td>
  					<td><input name="conPassword" type="password"></td>
  				</tr>
  				<tr align="center">
  					<td colspan="2"><input type="submit" value="提交注册"></td>
  				</tr>
  			</table>
  		</form>
  	</center>	
  </body>
</html>