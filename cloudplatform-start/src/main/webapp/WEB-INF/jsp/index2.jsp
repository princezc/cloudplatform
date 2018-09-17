<%@ page pageEncoding="GBK" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<%
request.setCharacterEncoding("utf-8");
String username = request.getParameter("username");
session.setAttribute("username",username);
%>
<title>华源热力 设备处理历史信息 </title>
<link rel="stylesheet" href="book.css" type="text/css">
</head>
<body>
<table align="center" width="100%" border="2">
	<tr><th><font size = "5">标签掩码</font></th><th><font size = "5">最后操作人</font></th><th><font size = "5">描述</font></th><th><font size = "5">当前状态</font></th></tr>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
		String sql="select * from historyInfo";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String id=rs.getString("deviceId");
	%>      
	        
			<tr>
	<!--  	<td width=40%><%=rs.getString("deviceId") %></td> -->
			<td width=35%><%=rs.getString("tagmask") %></td>
			<td><%=rs.getString("username") %></td>
			<td><%=rs.getString("description") %></td>
			<td>完成处理</td>
			</tr>
	<%
		}
		rs.close();
		stmt.close();
		con.close();
	%>
</table>
</body>
</html>

