<%@page import="com.rtdb.service.inter.Snapshot"%>
<%@page import="com.rtdb.service.inter.Server"%>
<%@page import="com.rtdb.service.impl.SnapshotImpl"%>
<%@page import="com.rtdb.model.SearchCondition"%>
<%@page import="com.rtdb.model.DoubleData"%>
<%@page import="com.rtdb.model.IntData"%>
<%@page import="com.rtdb.enums.DataSort"%>
<%@page import="com.rtdb.api.exception.UnexpectedMethodException"%>
<%@page import="com.rtdb.api.exception.EncodePacketErrorException"%>
<%@page import="com.rtdb.model.SearchConditionTotal"%>
<%@page import="com.rtdb.service.impl.BaseImpl"%>
<%@page import="com.rtdb.service.inter.Base"%>
<%@page import="com.rtdb.service.impl.ServerImpl"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改</title>
</head>
<%  
    request.setCharacterEncoding("utf-8");    
    String operation = request.getParameter("operation");
    System.out.println(operation);
    request.setCharacterEncoding("utf-8");    
    String deviceId1 = request.getParameter("id");
    String username=(String)session.getAttribute("username");
    System.out.println(deviceId1);
    System.out.println(username);
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	String sql="update alert set deviceState=?,operator=?  where deviceId=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, operation);
	pstmt.setString(2, username);
	pstmt.setString(3, deviceId1);
	int result = pstmt.executeUpdate();
	String msg = "修改失败，跳转到列表页！";
	if(result == 1){
		msg = "修改成功，跳转到列表页！";
	}
	pstmt.close();
	con.close();
%>
<script>window.alert('<%=msg %>');</script>
<%
	response.setHeader("Refresh", "1;url=index.jsp?username="+username);
%> 
<body>

</body>
</html>