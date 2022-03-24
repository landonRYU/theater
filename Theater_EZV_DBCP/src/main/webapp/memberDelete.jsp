<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
	#SetCenter{
	text-align: center;
	}
</style>
<meta charset="UTF-8">
<title>회원정보삭제</title>
</head>
<body>
	<%
	String id = "";
	if (request.getParameter("id") != null) {
		id = request.getParameter("id");
	}else if(session!=null){
		id = (String) session.getAttribute("id");
	}
	%>
	<div id = "SetCenter">
		<h2><%=id %>님의 회원정보를 삭제합니다.</h2>
		<br>
		<br>
		<h3>본인 확인을 위해 비밀번호를 다시 입력해주세요.</h3>
		<form action = "memberDeletePro.jsp" method = "post">
		<input type = "hidden" name = "id" value = "<%=id%>">
		<input type = "password" name = "pw"> 
		<input type = "submit" value = "확인">
		</form>
		<br>
		<br>
	</div>
</body>
</html>