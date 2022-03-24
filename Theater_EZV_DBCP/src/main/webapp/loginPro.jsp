<%@page import="com.ezvtheater.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보삭제</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	MemberDAO mdao = MemberDAO.getInstance();
	int chk = mdao.logIn(id, pw);
	if (chk == 1) {
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60*30);
	%>
	<script>
		alert("로그인 되었습니다.");
		opener.document.location.reload();
		window.close();
	</script>
	<%
	} else if (chk == -1) {
	%>
	<script>
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
	<%
	} else {
	%>
	<script>
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>

</body>
</html>