<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	label{
		display :inline-block;
		width: 100px;
		font-weight: bold;
		
	}
	fieldset{
		padding : 20px;
	}
	div{
		text-align: center;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align = "center">로그인 페이지</h2>
	<form action = "loginPro.jsp" method = "post">
		<fieldset>
			<label>아이디</label><input type = "text" name = "id" required placeholder ="아이디를 입력해주세요" autofocus><br><br>
			<label>비밀번호</label><input type = "password" name = "pw" required placeholder ="8~15자리 영문,숫자,특수문자 혼용">
		</fieldset>
		<br>
		<div>
			<input type = "submit" value = "로그인"> <input type = "button" value ="닫기" onClick="window.close()">
		</div>
	</form>
</body>
</html>