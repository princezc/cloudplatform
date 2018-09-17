<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>判定系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

</head>
<body>

<%
	String username=new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
	String password=new String(request.getParameter("password").getBytes("utf-8"),"utf-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	String sql1="select * from operatorinfo where username='"+username+"'and psw='"+password+"'";
	Statement stmt1=con1.createStatement();
	ResultSet rs1=stmt1.executeQuery(sql1);
    String url = "index.jsp?username=<"+username+">";
	if(rs1.next()){
    	String msg = "完成验证,已授权操作";
    	 %>
    		<script>window.alert('<%=msg %>');</script>
    		<%
    		session.setAttribute("username",username);
    	response.setHeader("Refresh", "1;url=index.jsp?username="+username);  
    }else{
    String msg = "密码错误请回到主页重新输入密码";
    %>
	<script>window.alert('<%=msg %>');</script>
	<% 
     response.setHeader("Refresh", "1;url=login1.jsp");
    }
    rs1.close();
    stmt1.close();
    con1.close();
%>


</body>
</html>