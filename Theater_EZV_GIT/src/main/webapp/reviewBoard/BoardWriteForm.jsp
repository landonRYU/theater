<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	label{
	width : 120px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<br><br>
	<form method = "post">
		<label>작성자</label><input type="text" name = "writer" autofocus><br>
		<label>글제목</label><input type="text" name = "title"><br>
		<label>전자우편</label> <input type="email" name = "email"><br>
		<label>비밀번호</label> <input type="password" name = "pw"><br>
		글내용 <br> <textarea rows = "10" cols="40" name = "content" required></textarea>
		<br><br>
		<input type = "submit" value = "글쓰기" formaction = "index.jsp?view=./reviewBoard/BoardWritePro.jsp">
		<input type = "reset" value = "취소">
		<input type = "submit" value = "목록보기" formaction = "">
	</form>
</body>
</html>