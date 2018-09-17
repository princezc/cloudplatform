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
<style>
        select{text-align:center; width:200px; padding:20px 0;font-size: 1.8em ; *height:60px/*为IE7设置高度*/ }
</style>
</head>
<%  
    request.setCharacterEncoding("utf-8");    
    String deviceId1 = request.getParameter("id");
    String username=(String)session.getAttribute("username");
    String sql1="select * from reference where deviceId='"+deviceId1+"'";
    Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	Statement stmt1=con1.createStatement();
	ResultSet rs1=stmt1.executeQuery(sql1);
    rs1.next();		
    String tagMask= rs1.getString("dbRName");
	float offset = rs1.getFloat("DataoffSet");
	String description = rs1.getString("descriptioin");
    rs1.close();
    stmt1.close();
    con1.close();


    float temp=2;
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
<body>
  <p align="center"><br><font size = "6.8">请确认设备信息   </font></p>
  <table border="1" align="center">
  
  <tr>
  
    <th><font size = "5">设备参数</font></th>
    <th><font size = "5">参数值</font></th>
  </tr>
  <tr><td><font size = "5"> 设备ID </font></td><td><% out.println("<font size = \"5\">"+deviceId1+"</font>");%></td></tr>
  <tr><td><font size = "5"> 标签掩码 </font></td><td><% out.println("<font size = \"5\">"+tagMask+"</font>");%></td></tr> 
  <tr><td><font size = "5"> 设备描述 </font></td><td><% out.println("<font size = \"5\">"+description+"</font>");%></td></tr> 
  </table>
  <p align="center"><br><font size = "6.8">修改设备状态  </font></p>
  <form  id="form1" action="operation.jsp?id=<%=deviceId1%>" accept-charset="utf-8" method="post">
  <p align="center">
  <select id= "operation" name="operation" >
	<option value="勿动">勿动 </option> 
	<option value="丢失">丢失 </option>
	<option value="损坏">损坏 </option>
	</select>
	</p>
  </form>
  <p align="center">
  <input type="button" value="提交" onclick="document.getElementById('form1').submit();"  style="width: 200px; height: 60px;font-size: 1.8em;" >
  </p>
</body>
<%
	request.setCharacterEncoding("utf-8");
	String deviceId = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datamapping","root","root");
	String sql="update alert set deviceState='处理中' where deviceId=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, deviceId);
	int result = pstmt.executeUpdate();
	String msg = "修改失败，跳转到列表页！";
	if(result == 1){
		msg = "修改成功，跳转到列表页！";
	}
	pstmt.close();
	con.close();
%>
<!--  <script>window.alert('<%=msg %>');</script> -->
<%
	//response.setHeader("Refresh", "1;url=index.jsp");
%> 
</html>