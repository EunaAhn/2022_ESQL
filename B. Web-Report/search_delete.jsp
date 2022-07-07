<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {font-family: "돋움"; font-size: 15px;}
.style5 {font-family: "돋움"; font-size: 12px; }
-->
</style>
</head>
<%@ page import="java.sql.*" %>
<BODY>
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
	String card_or_cash = null;
	int how_much=0;
	String income_day=null;
	String memo=null;

	user_id = Integer.parseInt(request.getParameter("user_id"));

	ResultSet rs=stmt.executeQuery("select * from income_expenses where user_id='"+user_id+"'");
	
	if(rs.next()) {
		stmt.executeUpdate("delete from income_expenses where user_id ='"+user_id+"'");
	%>
	<center>
	<span class="style1">데이터가 삭제되었습니다.</span></center>
	<%
	}
	else{
	%>
	<script>
	alert("입력하신 아이디의 가계부 내역은 없습니다.");
	history.go(-1);
	</script>
	<%
	}
	stmt.close();
	conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>
</body>
</html>