<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {
font-family: "돋움";
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
	Class.forName("com.mysql.jdbc.Driver"); //DB연결 객체 생성
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
	//데이터베이스에 동일한 번호가 있는지 확인
	if(rs.next()) {
	%>

	<script>
	alert("이미 등록된 아이디입니다!"); // 아이디가 중복되는지 검사한다.
	history.go(-1);
	</script>
	<%
	}

	else{
		stmt.executeUpdate("insert into userinfo values ('"+user_id+"','"+user_nickname+"','"+SSN+"','"+tel+"')");
	%>
	<span class="style1">가입이 완료되었습니다.</span>
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
