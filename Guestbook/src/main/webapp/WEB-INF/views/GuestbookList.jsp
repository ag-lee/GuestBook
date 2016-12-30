<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록</title>
</head>
<body>
	<table width="90%" cellpadding="0" cellspacing="0" border="0">
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<tr height="30" bgcolor="#82B5EF" style="text-align: center;">
			<td width="40">글번호</td>
			<td width="45">이메일</td>
			<td width="200">내용</td>
			<td width="45"> 등록일자 </td>
		</tr>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<% 
			List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
			for(Map<String, Object> m: list) {
		%>
				<tr style="text-align: center;">
					<td><%=m.get("NO") %></td>
					<td><%=m.get("EMAIL")%></td>
					<td><%=m.get("CONTENTS") %></td>
					<td><%=m.get("REG_DATE") %></td>
				</tr>
			<%} %>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>

		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table width="90%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
			<td><input type=button value="글쓰기"></td>
		</tr>
	</table>
</body>
</html>