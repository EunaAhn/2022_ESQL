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
<div align="center">
<span class="style5">가계부 내역을 삭제할 아이디를 입력하세요.</span></div>
<form action="./search_delete.jsp" method="get">
<table width="250" border ="0" align="center" cellpadding="0" cellspacing="1">

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF"><div align="center">
<span class="style1">  아이디   </span></div></td>
<td><input name ="user_id" type="text" size ="20"> </input>
</td>
</tr>


<tr><tr height="5">
<td></td><td></td></tr>
<tr>
<td align="center"colspan="2"><input type="submit" value="내역 삭제"
onClick ="true"></td></tr>
</tr>
</table>
</form>
</BODY>
</html>