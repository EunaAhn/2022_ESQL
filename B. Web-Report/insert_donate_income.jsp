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
	String account=null;
	int dp_how_much=0;


	user_id= Integer.parseInt(request.getParameter("user_id"));
	account = new String(request.getParameter("account"));
	dp_how_much= Integer.parseInt(request.getParameter("dp_how_much"));


	Statement stmt = conn.createStatement();
	ResultSet rs=stmt.executeQuery("select user_id from userinfo where user_id='"+user_id+"'");
	//�����ͺ��̽��� ������ ��ȣ�� �ִ��� Ȯ��
	if(rs.next()) {
		stmt.executeUpdate("insert into Deposit values ('"+user_id+"','"+account+"','"+dp_how_much+"')");
	%>
	<span class="style1">�ԱݿϷ�.</span>
	<%
	}
	
	else{

	%>
	<script>
	alert("�ش�Ǵ� ���̵� �����ϴ�."); 
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
