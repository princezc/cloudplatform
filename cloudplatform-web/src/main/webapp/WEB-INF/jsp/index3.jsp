<%@ page pageEncoding="GBK" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<%
request.setCharacterEncoding("utf-8");
String username = request.getParameter("username");
session.setAttribute("username",username);
%>
<title>��Դ���� �豸������ʷ��Ϣ���� </title>
<link rel="stylesheet" href="book.css" type="text/css">
</head>
<body>
<table align="center" width="100%" border="2">
	<tr><th><font size = "5">��ǩ����</font></th><th><font size = "5">��������</font></th><th><font size = "5">����</font></th><th><font size = "5">��ǰ״̬</font></th><th><font size = "5">����</font></th></tr>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
		String sql="select * from historyInfo";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			String id=rs.getString("id");
			String tagmask = rs.getString("tagmask");
	%>      
	        
			<tr>
	<!--  	<td width=40%><%=rs.getString("deviceId") %></td> -->
			<td width=35%><%=rs.getString("tagmask") %></td>
			<td><%=rs.getString("username") %></td>
			<td><%=rs.getString("description") %></td>
			<td>��ɴ���</td>
			<td><a href="ed3.jsp?id=<%=id %>">ɾ��</a>&nbsp;
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

