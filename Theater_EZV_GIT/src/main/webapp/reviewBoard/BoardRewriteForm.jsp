<%@page import="com.ezvtheater.BoardDAO"%>
<%@page import="com.ezvtheater.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<h1>답글달기</h1>
	<br><br> 
	<form method = "post">
		<label>작성자</label><input type="text" name = "writer" autofocus><br>
		<label>글제목</label><input type="text" name = "title" value = "[re]"><br>
		<label>전자우편</label> <input type="email" name = "email"><br>
		<label>비밀번호</label> <input type="password" name = "pw"><br>
		글내용 <br> <textarea rows = "10" cols="40" name = "content" required></textarea>
		<br><br>
		<input type = "hidden" name = "num" value = "<%=num%>">
		<input type = "submit" value = "답글달기" formaction = "index.jsp?view=./reviewBoard/BoardRewritePro.jsp">
		<input type = "reset" value = "취소">
		<a href = "index.jsp?view=./reviewBoard/BoardList.jsp"><input type = "button" value = "목록보기"></a>
	</form>
</body>
</html>