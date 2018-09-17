<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>操作人员登陆认证界面</title>
    <style>
#login_click{ margin-top:32px; height:40px;}
#login_click a 
{
    text-decoration:none;
	background:#2f435e;
	color:#f2f2f2;
	
	padding: 10px 30px 10px 30px;
	font-size:16px;
	font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
	font-weight:bold;
	border-radius:3px;
	
	-webkit-transition:all linear 0.30s;
	-moz-transition:all linear 0.30s;
	transition:all linear 0.30s;
	
	}
   #login_click a:hover { background:#385f9e; }
 
</style>
<link rel="stylesheet" href="1.css" type="text/css">
</head>
<body>
<form id="form1" name="form1" method="post" action="checklogin.jsp">
<p align="center">用户名</p>
<p align="center"><sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/datamapping" user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="result">
        SELECT username from operatorinfo;
        </sql:query>
        <select name="username" size="1">
            <c:forEach var="row" items="${result.rows}">
            <option value="<c:out value="${row.username}"/>"><c:out value="${row.username}"/></option>
            </c:forEach>
        </select>
        </p>
  <p align="center">密码</p><p align="center">
  	<label>
    <input type="text" name="password" />
    </label>
  </p>
  
   <div id="login_click">
    <p align="center">
    <a type="button" value="提交" onclick="document.getElementById('form1').submit();">登 录</a>
    </p>
    </div>

</form>

</body>
</html>