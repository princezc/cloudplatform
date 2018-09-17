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
<title>设备信息修改</title>
</head>
<%  
    request.setCharacterEncoding("utf-8");    
%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	String sql="delete  from historyInfo where id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id);
	boolean result = pstmt.execute();
	System.out.println(result);
	String msg = "完成处理后设备信息将不会在列表页出现";
	pstmt.close();
	con.close();
%>
<script>window.alert('<%=msg %>');</script>
<%
	response.setHeader("Refresh", "1;url=index3.jsp");
%> 
<body>

</body>
</html>