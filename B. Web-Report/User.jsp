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
<span class="style5">ȸ�� ������ �Է��ϼ���.</span></div>

<form action="./insert_user.jsp" method="get">
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
<span class="style1"> �̸� </span>
</div>
</td>
<td><input name ="user_nickname" type="text" size ="20"> </input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> �ֹε�Ϲ�ȣ</span>
</div></td>
<td><input name ="SSN" type="text" size ="20"> </input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF">
<div align="center">
<span class="style1"> ��ȭ��ȣ </span>
</div></td>
<td><input name ="tel" type="text" size ="20"> </input>
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