<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<!--
.style1 {font-family: "바탕"; font-size: 13; }
.style5 {font-family: "바탕"; font-size: 15; }
-->
</style>
</head>
<BODY>
<div align="center">
<span class="style5">바자회 기부 금액</span><p>
<span class="style1">1. 바자회 기부 금액 입금 폼</span><br>
<span class="style1">2. 기부자의 아이디와 기부 액수 명단 등록</span><br>
<span class="style1">3. 기부자 명단 확인</span><br>
<span class="style1"> 기부 명단 등록 후, 입금자 명단에서 사라집니다. </span><br>
</div>
<form action="./search_delete.jsp" method="get">
<table width="250" border ="0" align="center" cellpadding="0" cellspacing="1">

<tr>
<tr><td></td><td></td></tr>
<tr><td class="style1" align="center"colspan="2"><a target ="data" href="Income.jsp">1.기부금 폼(click)</td>
<td class="style1" align="center"colspan="2"><a target ="data" href="send_dn_income.jsp">2.기부자 명단 등록(click)</td></tr>
<tr><td>                     </td></tr>
<tr><td class="style1" align="center"colspan="4"><a target ="data" href="show_donate_list.jsp">3.기부자 명단 보기(click)</td></tr>

</tr>
</table>
</form>
</BODY>
</html>