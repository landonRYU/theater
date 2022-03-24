<%@page import="com.ezvtheater.MemberVO"%>
<%@page import="com.ezvtheater.MemberDAO"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<!DOCTYPE html>
<html>
<head>
<style>
	#SetCenter{
	text-align: center;
	}
</style>
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
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<div id = "SetCenter">
		<%
		String id = "";
		if (request.getParameter("id") != null) {
			id = request.getParameter("id");
		}else if(session!=null){
			id = (String) session.getAttribute("id");
		}
		%>
		<h2><%=id %>님의 회원정보를 수정합니다.</h2>
		<br>
		<br>
		<h3>본인 확인을 위해 비밀번호를 다시 입력해주세요.</h3>
		<form action = "index.jsp?view=memberUpdate.jsp" method = "post">
			<input type = "hidden" name = "id" value = "<%=id%>">
			<input type = "password" name = "pw"> 
			<input type = "submit" value = "확인">
		</form>
		<br>
		<br>
	</div>
</body>
</html>