<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

<!--
.style1 {font-family: "����"; font-size: 10; }
.style5 {font-family: "����"; font-size: 10; }
-->
</style>
</head>
<BODY>

<div align="center">
<span class="style5">���� ���԰� ���⳻�� �Է��ϱ�.</span></div>
<form action="./insert_Income_expenses.jsp" method="get">
<table width="250" border ="0" align="center" cellpadding="0" cellspacing="1">

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> ���̵�</span>
</div>
</td>
<td><input name ="user_id" type="text" size ="20"> </input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> income or expenses </span>
</div></td>
<td><input type="radio" name="income_or_expenses" value="In" checked>���� </input>
<input type="radio" name="income_or_expenset" value="Out">���� </input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> ī�� or ����</span>
</div></td>
<td><input type="radio" name="card_or_cash" value="card" checked>ī�� </input>
<input type="radio" name="card_or_cash" value="cash">����</input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF"><div align="center">
<span class="style1"> how much </span>
</div></td>
<td><input name ="how_much" type="text" size ="20"> </input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> �ŷ�����</span>
</div></td>
<td><input name ="income_day" type="text" size ="20"> </input><br>
������ YY-MM-DD
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> memo </span>
</div></td>
<td><input name ="memo" type="text" size ="20" > </input>
</td>
</tr>

<tr><tr height="5">
<td></td><td></td></tr>
<tr>
<td align="right"colspan="2"><input type="submit" value=" ����"
onClick ="true"></td></tr>
</tr>
</table>
</form>
</BODY>
</html>