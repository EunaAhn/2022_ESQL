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
	String user_nickname=null;
	String SSN=null;
	String tel=null;
	
	user_id= Integer.parseInt(request.getParameter("user_id"));
	user_nickname = new String(request.getParameter("user_nickname"));
	SSN= new String(request.getParameter("SSN"));
	tel= new String(request.getParameter("tel"));


	Statement stmt = conn.createStatement();
	ResultSet rs=stmt.executeQuery("select user_id from userinfo where user_id='"+user_id+"'");
	//�����ͺ��̽��� ������ ��ȣ�� �ִ��� Ȯ��
	if(rs.next()) {
	%>

	<script>
	alert("�̹� ��ϵ� ���̵��Դϴ�!"); // ���̵� �ߺ��Ǵ��� �˻��Ѵ�.
	history.go(-1);
	</script>
	<%
	}

	else{
		stmt.executeUpdate("insert into userinfo values ('"+user_id+"','"+user_nickname+"','"+SSN+"','"+tel+"')");
	%>
	<span class="style1">������ �Ϸ�Ǿ����ϴ�.</span>
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
