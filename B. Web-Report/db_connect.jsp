<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AccountBook</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<h4>Database ����̹� ����</h4>
<%
try {
	String url = "jdbc:mysql://localhost:3306/account_book";
	String id = "root";
	String pass = "2542";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,id,pass);
	out.println("Database���ӿϷ� ");
	conn.close();
}
catch (Exception e){
	out.println("Database���ӺҰ�");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>

</body>
</html>