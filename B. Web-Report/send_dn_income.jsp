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
<span class="style5">����� ��� ���</span><br>
<span class="style5">����ȸ�� ����Ͻ� �и� ��� ��� �����մϴ�.</span></div>
<form action="./insert_donate_list.jsp" method="get">
<table width="250" border ="0" align="center" cellpadding="0" cellspacing="1">

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF"><div align="center">
<span class="style1"> ���̵�</span>
</div></td>
<td><input name ="user_id" type="text" size ="20"> </input>
</td>
</tr>

<tr class="style5" >
<td align="right" bgcolor="#BBFFFF"><div align="center">
<span class="style1"> ��� �ݾ�</span>
</div></td>
<td><input name ="dn_how_much" type="text" size ="20"> </input>
</td>
</tr>


<tr><tr height="5">
<td></td><td></td></tr>
<tr>
<td align="right"colspan="2"><input type="submit" value="����� ��ܿ� ����ϱ�"
onClick ="true"></td></tr>
</tr>
</table>
</form>
</BODY>
</html>