<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {font-family: "바탕"; font-size: 10; }
.style5 {font-family: "바탕"; font-size: 10; }
-->
</style>
</head>
<BODY>
<%@ page import="java.sql.*" %>
<div align="center">
<span class="style5"> 사용자 가계부 내역 결과</span></div>
<%
try {
	Class.forName("com.mysql.jdbc.Driver"); 
	String url = "jdbc:mysql://localhost:3306/account_book";
	String id = "root";
	String pass = "2542";
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();

	int user_id=0;
	String income_or_expenses=null;
	String card_or_cash=null;
	int how_much=0;
	String income_day=null;
	String memo=null;

%>
	<table width="500" border ="0" align="center" cellpadding="0" cellspacing="1">
	<tr align="center" bgcolor="#BBFFFF" class="style1">
	<td><span class="style5"> 아이디 </span></td>
	<td><span class="style5"> 수입 또는 지출 </span></td>
	<td><span class="style5"> 카드 또는 현금 </span></td>
	<td><span class="style5"> how much</span></td>
	<td><span class="style5">거래 일자</span></td>
	<td><span class="style5"> memo </span></td>

	</tr></p><br><br>
	
	<%
	user_id = Integer.parseInt(request.getParameter("user_id"));
	ResultSet rs=stmt.executeQuery("select * from income_expenses where user_id='"+user_id+"'");

	while(rs.next()) { 
		user_id= Integer.parseInt(rs.getString("user_id"));
		income_or_expenses = new String(rs.getString("income_or_expenses"));
		card_or_cash= new String(rs.getString("card_or_cash"));
		how_much= Integer.parseInt(rs.getString("how_much"));
		income_day= new String(rs.getString("income_day"));
		memo= new String(rs.getString("memo"));
	%>
	
	<trclass="style1">
	<trclass="style1">
	<td><%=user_id%></td>
	<td><%=income_or_expenses%></td>
	<td><%=card_or_cash%></td>
	<td><%= how_much%></td>
	<td><%= income_day%></td>
	<td><%=memo%></td></tr>

	<% 
	}
	
	stmt.close();
	conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>
</table>
</from>

</body>
</html>