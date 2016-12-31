<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록</title>
<!-- JQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<h1 width="90%" style=""text-align:center;">방명록</h1>
	<table width="90%" cellpadding="0" cellspacing="0" border="0">
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<tr height="30" bgcolor="#82B5EF" style="text-align: center;">
			<td width="40">글번호</td>
			<td width="45">이메일</td>
			<td width="200">내용</td>
			<td width="45">등록일자</td>
			<td width="40"></td>
		</tr>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<%
			List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
			for (Map<String, Object> m : list) {
		%>
		<tr style="text-align: center;">
			<td><%=m.get("NO")%></td>
			<td><%=m.get("EMAIL")%></td>
			<td><%=m.get("CONTENTS")%></td>
			<td><%=m.get("REG_DATE")%></td>
			<td class="modify"> 
				<a href="#this" name="modify">수정</a>
				 <input type="hidden" id="NO" value="${m.IDX}">
			</td>
		</tr>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<%
			}
		%>
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
			<td><input type=button value="글쓰기" id="write"></td>
		</tr>
	</table>

	<!-- include-body -->
	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").click(function() {
				bn_registerGuestbook();
			});
			
			$("a[name='modify']").click(function() {
				fn_modifyGuestbook($(this));
			});
			
		});

		function bn_registerGuestbook() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/guestbook/guestbookAdd");
			comSubmit.submit();
		}
		
		function fn_modifyGuestbook(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/guestbook/guestbookUpdate");
			comSubmit.addParam("NO",obj.parent().find("#NO").val());
			comSubmit.submit();
		}

		function gfn_isNull(str) {
			if (str == null)
				return true;
			if (str == "Nan")
				return true;

			if (new String(str).valueOf() == "undefined")
				return true;

			var chkStr = new String(str);
			if (chkStr.valueOf() == "undefined")
				return true;
			if (chkStr == null)
				return true;
			if (chkStr.toString().length == 0)
				return true;

			return false;
		}

		function ComSubmit(opt_formId) {
			this.formId = gfn_isNull(opt_formId) == true ? "commonForm"
					: opt_formId;
			this.url = "";

			if (this.formId == "commonForm") {
				$("#commonForm")[0].reset();
			}

			this.setUrl = function setUrl(url) {
				this.url = url;
			};

			this.addParam = function addParam(key, value) {
				$("#" + this.formId)
						.append(
								$("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
			};

			this.submit = function submit() {
				var frm = $("#" + this.formId)[0];
				frm.action = this.url;
				frm.method = "post";
				frm.submit();
			};
		}
	</script>
</body>
</html>