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
	Statement stmt = conn.createStatement();
	
	int user_id=0;
	int dn_how_much=0;


	user_id= Integer.parseInt(request.getParameter("user_id"));
	dn_how_much= Integer.parseInt(request.getParameter("dn_how_much"));


	ResultSet rs=stmt.executeQuery("select user_id from deposit where user_id='"+user_id+"' and dp_how_much='"+dn_how_much+"'");
//�����ͺ��̽��� ������ ��ȣ�� �ִ��� Ȯ��
	if(rs.next()) {
		stmt.executeUpdate("insert into donate values ('"+user_id+"','"+dn_how_much+"')");
		stmt.executeUpdate("delete from deposit where user_id ='"+user_id+"' and dp_how_much='"+dn_how_much+"'");
		%>
		<script>
		alert("��θ�� ��� �Ϸ�Ǿ����ϴ�.");
		</script>
		<%
	}else{

		%>
		<script>
		alert("��α� ������ �������� �ʽ��ϴ�."); // ID �ߺ��Ǵ��� �˻�
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