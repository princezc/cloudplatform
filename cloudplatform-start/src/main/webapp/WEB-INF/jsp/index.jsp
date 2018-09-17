<%@ page pageEncoding="GBK" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<%
request.setCharacterEncoding("utf-8");
//String username = request.getParameter("username");
String username = (String)session.getAttribute("username");
System.out.println("session index.jsp"+username);
%>
<title>华源热力  欢迎<%= username%></title>
<link rel="stylesheet" href="book.css" type="text/css">
</head>
<body>
<table align="center" width="100%" border="2">
	<tr><th><font size = "5">标签掩码</font></th><th><font size = "5">设备状态</font></th><th><font size = "5">最后操作人</font></th><th><font size = "5">描述</font></th><th><font size = "5">操作</font></th><th><font size = "5">操作</font></th></tr>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
		String sql="select * from alert";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String id=rs.getString("deviceId");
	%>      
	        
			<tr><td width=20%><%=rs.getString("tagMask") %></td>
			<td><%=rs.getString("deviceState") %></td>
			<td><%=rs.getString("operator") %></td>
			<td><%=rs.getString("description") %></td>
			<td><a href="ed.jsp?id=<%=id %>&username=<%= username%>">开始处理</a>&nbsp;
			<td><a href="ed2.jsp?id=<%=id %>&username=<%= username%>">完成处理</a>&nbsp;
		  	</td></tr>
	<%
		}
		rs.close();
		stmt.close();
		con.close();
	%>
</table>
</body>
</html>

