<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {font-family: "����"; font-size: 10; }
.style5 {font-family: "����"; font-size: 10; }
-->
</style>
</head>
<BODY>
<%@ page import="java.sql.*" %>
<div align="center">
<%
try {
	Class.forName("com.mysql.jdbc.Driver"); //DB���� ��ü ����
	String url = "jdbc:mysql://localhost:3306/account_book";
	String id = "root";
	String pass = "2542";
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();


	int user_id = 0;
	int dn_how_much =0;


	%>
	<span class="style1">����ȸ ����� ���</span>
	</div>

	<form action="./search_list_id.jsp" method="get">
	<table width="300" border ="0" align="center" cellpadding="0" cellspacing="1">
	<tr align="center" bgcolor="#BBFFFF" class="style1">
	<td><span class="style5"> ���̵� </span></td>
	<td><span class="style5"> ��� �ݾ� </span></td>


</tr></p><br><br>
	<%
	ResultSet rs=stmt.executeQuery("select * from donate");
	while(rs.next()) { 
		user_id = Integer.parseInt(rs.getString("user_id"));
		dn_how_much = Integer.parseInt(rs.getString("dn_how_much"));



%>
<trclass="style1">
	<td><%=user_id%></td>
	<td><%=dn_how_much%></td>
</tr>

<%
}
%>

</table>
</from>
<%}
	catch (Exception e) {
		out.println(e); // �� ������ �����ϴ� �������� ���� �߻� �� ���� �޼��� ���
		}%>
<div align="center"><br>
<span class="style5" > ����ȸ ��ο� �������ּż� �����մϴ�.</span></div>
</BODY></html>