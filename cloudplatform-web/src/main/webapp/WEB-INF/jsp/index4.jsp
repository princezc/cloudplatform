<%@ page pageEncoding="GBK" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<%
request.setCharacterEncoding("utf-8");
String username = request.getParameter("username");
session.setAttribute("username",username);
%>
<title>��Դ���� ��Ա��Ϣɾ�� </title>
<link rel="stylesheet" href="book.css" type="text/css">
</head>
<body>
<table align="center" width="100%" border="2">
	<tr><th><font size = "5">��Ա����</font></th><th><font size = "5">����</font></th></tr>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
		String sql="select * from operatorInfo";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String name=rs.getString("username");
	%>      
	        
			<tr>
	     	<td width=40%><%=name %></td> 
			<td><a href="ed4.jsp?id=<%=name %>">ɾ��</a>&nbsp;
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

