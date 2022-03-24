<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript">
function formcheck(){
	const pwchk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	let pw = document.regform.pw.value;
	let pw2 = document.regform.pw2.value;
	
	if(pw!=pw2){
		alert('비밀번호가 틀렸습니다.');
		document.regform.pw.focus();
		document.regform.pw.value = "";
		document.regform.pw2.value = "";
		return false;
	}else if(pwchk.test(pw)==false){
		alert('비밀번호는 영문자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력하세요.');
		document.regform.pw.focus();
		document.regform.pw.value = "";
		document.regform.pw2.value = "";
		return false;
	}
}
</script>
<style>
	.table1 tr td {
		border : 1px solid;
		padding : 10px;
	}
	.table1{
		margin-bottom : 50px;
		margin: auto;		
		width : 600px;
		border-collapse: collapse;		
	}
</style>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h2 align = "center"> 회원가입 페이지</h2>
		<form action = "memberSignupPro.jsp" name="regform" method = "post" onsubmit="return formcheck();">
		<table class = "table1">
			<tr>
				<td><B>아이디</b></td>
				<td><input type = "text" name = "id" size= "50" placeholder = "아이디를 입력하세요." required> 
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				<td><input type = "password" name = "pw" size= "50" placeholder = "영문자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력하세요." required> 
			</tr>
			<tr>
				<td><b>비밀번호 확인</b></td>
				<td><input type = "password" name = "pw2" size= "50" placeholder = "위와 같은 비밀번호를 입력하세요." required> 
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td><input type = "email" name = "email" size= "50" placeholder = "이메일을 입력하세요." required> 
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><input type = "tel" name = "tel" size= "50" placeholder = "전화번호를 입력하세요" required> 
			</tr>
			<tr>
				<td><b>관심분야</b></td>
				<td><input type = "checkbox" name = "interests" value = "공포"> 공포 
					<input type = "checkbox" name = "interests" value = "뮤지컬"> 뮤지컬 
					<input type = "checkbox" name = "interests" value = "코미디"> 코미디 
					<input type = "checkbox" name = "interests" value = "액션"> 액션 
					<input type = "checkbox" name = "interests" value = "멜로"> 멜로 
				</td> 
			</tr>
			<tr>
				<td><b>직업</b></td>
				<td><select name = "job">
				<option value = "자영업자">자영업자</option>
				<option value = "회사원">회사원</option>
				<option value = "학생">학생</option>
				<option value = "공무원">공무원</option>
				<option value = "전문직">전문직</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><b>나이대</b></td>
				<td><input type = "radio" name = "age" value = "10"> 10대 
					<input type = "radio" name = "age" value = "20"> 20대 
					<input type = "radio" name = "age" value = "30"> 30대 
					<input type = "radio" name = "age" value = "40"> 40대 
					<input type = "radio" name = "age" value = "50"> 50대 
					<input type = "radio" name = "age" value = "60"> 60대 
				</td> 
			</tr>
			<tr>
				<td><b>하고싶은말</b></td>
				<td><textarea rows = "4" cols = "50" name = "introduce" required></textarea> 
			</tr>	
			<tr align = "center">
			<td colspan = "2"><input type = "submit" value = "확인"> <input type = "reset" value = "취소"><br>
			</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		</form>
</body>
</html>