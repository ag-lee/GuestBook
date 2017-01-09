<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 수정</title>
<!-- JQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>

<body>
	<form id="frm">
		<table>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="text-align: center;">
							<td>방명록 수정</td>
					</table>
					<table>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><b>이메일</b></td>
							<td><input type="text" name="email" id="email" size="50"
								maxlength="50" value="${map.EMAIL}"></input></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><b>비밀번호</b></td>
							<td><input type="password" name="pwd" id="pwd" size="50"
								maxlength="50" value="${map.PWD}"></input></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><b>내용</b></td>
							<td><textarea name="contents" id="contents" cols="50"
									rows="13">${map.CONTENTS}</textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2"><input type="button" value="저장" id="write">
								<input type="button" value="취소" id="cancel"></td>
							<td>&nbsp;</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
	</form>
	
	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#cancel").click(function(e) {
				e.preventDefault();
				bn_cancelRegister();
			});

			$("#write").on("click", function(e) {
				var email = document.getElementById("email").value;
				var pwd = document.getElementById("pwd").value;
				var contents = document.getElementById("contents").value;
				
				if(email == null) {
					alert("이메일을 입력해주세요.");
					return;
				} else if(pwd == null) {
					alert("비밀번호를 입력해주세요.");
					return;
				} else if(contents==null) {
					alert("내용을 입력해주세요.");
					return;
				}
				
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(exptext.test(email)==false){	
					alert("이 메일형식이 올바르지 않습니다.");
					return;
				}  
					e.preventDefault();
					bn_registerGuestbook();
			});
		});

		function bn_cancelRegister() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("/guestbook/guestbookList");
			comSubmit.submit();
		}

		function bn_registerGuestbook() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("/guestbook/updatedGuestbook");
			comSubmit.submit();
		}

		function gfn_isNull(str) {
			if (str == null) return true;
		    if (str == "NaN") return true;
		    if (new String(str).valueOf() == "undefined") return true;   
		    var chkStr = new String(str);
		    if( chkStr.valueOf() == "undefined" ) return true;
		    if (chkStr == null) return true;  

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
								$("<input type='hidden' name='"+key+"'id='"+key+"' value='"+value+"' >"));
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