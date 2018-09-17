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
    String deviceId1 = request.getParameter("id");
    String username=(String)session.getAttribute("username");
    System.out.println("用户名"+username);
    System.out.println("设备Id"+deviceId1);
    String sql1="select * from reference where deviceId='"+deviceId1+"'";
    Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	Statement stmt1=con1.createStatement();
	ResultSet rs1=stmt1.executeQuery(sql1);
    rs1.next();		
    String tagMask= rs1.getString("dbRName");
    String description = rs1.getString("descriptioin");
    float offset = rs1.getFloat("DataoffSet");
	System.out.println("标签掩码"+tagMask);
	System.out.println("描述"+description);
    rs1.close();
    stmt1.close();
    con1.close();


    float temp=1;
    Server server = new ServerImpl("10.74.20.101", 6327, "sa", "golden");
    server.connect();// 
    server.login();// 
    Base base = new BaseImpl((ServerImpl) server);
    SearchConditionTotal condition = new SearchConditionTotal();
    condition.setTagmask(tagMask);
    int[] ids = base.search(condition, 1, DataSort.SORT_BY_ID);
    Snapshot snap = new SnapshotImpl((ServerImpl) server);
    List<DoubleData> list = new ArrayList();
    DoubleData data = new DoubleData();
    data.setDateTime(new Date());
    temp=temp+offset;
	data.setValue(temp);
	data.setId(ids[0]);// 
	data.setQuality((short) 0);//
	list.add(data);
	snap.putDoubleSnapshots(list);
	server.close();
%>
<%  request.setCharacterEncoding("utf-8");    
    String sql2 = "INSERT INTO historyInfo(deviceId,tagmask,username,description) VALUES('"+deviceId1+"','"+tagMask+"','"+username+"','"+description+"')";      
    Class.forName("com.mysql.jdbc.Driver");
    Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
    Statement stmt2=con2.createStatement();
    stmt2.execute(sql2);
    stmt1.close();
    con1.close();
%>
<%
	request.setCharacterEncoding("utf-8");
	String deviceId = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	String sql="delete  from alert where deviceId=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, deviceId);
	boolean result = pstmt.execute();
	System.out.println(result);
	String msg = "完成处理后设备信息将不会在列表页出现";
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