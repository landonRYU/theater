<%@page import="com.ezvtheater.MemberVO"%>
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
	int result = mdao.deleteMember(id, pw);
	%>

		<script>
			if(<%=result%>>0){
				alert("<%=id%>님의 회원정보가 삭제되었습니다.");
				location.href = "index.jsp?view=memberList.jsp";
			}else{
				alert("비밀번호가 틀렸습니다.");
				history.go(-1);
			}
		</script>
</body>
</html>