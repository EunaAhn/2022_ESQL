<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {
font-family: "����";
font-size: 14px;
}
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
	
	int user_id=0;
	String income_or_expenses=null;
	String card_or_cash=null;
	int how_much=0;
	String income_day=null;
	String memo=null;

	user_id= Integer.parseInt(request.getParameter("user_id"));
	income_or_expenses = new String(request.getParameter("income_or_expenses"));
	card_or_cash= new String(request.getParameter("card_or_cash"));
	how_much= Integer.parseInt(request.getParameter("how_much"));
	income_day= new String(request.getParameter("income_day"));
	memo= new String(request.getParameter("memo"));


	Statement stmt = conn.createStatement();
	ResultSet rs=stmt.executeQuery("select user_id from userinfo where user_id='"+user_id+"'");
	//�����ͺ��̽��� ������ ��ȣ�� �ִ��� Ȯ��
	if(rs.next()) {
		stmt.executeUpdate("insert into income_expenses values ('"+user_id+"','"+income_or_expenses+"','"+card_or_cash+"','"+how_much+"','"+income_day+"','"+memo+"')");
		%>
		<span class="style1">���� �� ���� ������ ���ε�Ǿ����ϴ�!</span>
		<%
}
	else{
	%>
	<script>
	alert("���� ���̵��Դϴ�."); // 
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
</div>
</body>
</html>
