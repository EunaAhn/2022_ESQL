<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {
font-family: "바탕";
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
	Statement stmt = conn.createStatement();
	
	int user_id=0;
	int dn_how_much=0;


	user_id= Integer.parseInt(request.getParameter("user_id"));
	dn_how_much= Integer.parseInt(request.getParameter("dn_how_much"));


	ResultSet rs=stmt.executeQuery("select user_id from deposit where user_id='"+user_id+"' and dp_how_much='"+dn_how_much+"'");
//데이터베이스에 동일한 번호가 있는지 확인
	if(rs.next()) {
		stmt.executeUpdate("insert into donate values ('"+user_id+"','"+dn_how_much+"')");
		stmt.executeUpdate("delete from deposit where user_id ='"+user_id+"' and dp_how_much='"+dn_how_much+"'");
		%>
		<script>
		alert("기부명단 등록 완료되었습니다.");
		</script>
		<%
	}else{

		%>
		<script>
		alert("기부금 내역이 존재하지 않습니다."); // ID 중복되는지 검사
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