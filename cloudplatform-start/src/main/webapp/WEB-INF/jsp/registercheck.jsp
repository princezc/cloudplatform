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
	String username=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");
	String password=new String(request.getParameter("password").getBytes("utf-8"),"utf-8");
	String repassword = new String(request.getParameter("conPassword").getBytes("utf-8"),"utf-8");
	String msg = null;
	if(password.equals(repassword)){
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
		String sql1="insert into operatorinfo values('"+username+"','"+password+"')";
		Statement stmt1=con1.createStatement();
		stmt1.execute(sql1);
	    stmt1.close();
	    con1.close();
	    msg = "完成验证,操作员信息已添加";
	    
	}else{
		msg = "两次密码不一致请重新输入";
	}	
	  	
 %>
    <script>window.alert('<%=msg %>');</script> 
<% 
     response.setHeader("Refresh", "1;url=register.jsp");
%>


</body>
</html>