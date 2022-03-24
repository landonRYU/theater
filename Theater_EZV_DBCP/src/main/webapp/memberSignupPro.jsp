<%@page import="com.ezvtheater.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<%
	MemberDAO mdao = MemberDAO.getInstance();
	String[] temp = request.getParameterValues("interests");
	String interests = "";
	for(int i = 0; i < temp.length; i++){
		interests = interests+temp[i]+" ";
	}
	%>
	<jsp:useBean id="mvo" class="com.ezvtheater.MemberVO">
		<jsp:setProperty name="mvo" property="*"/>
		<jsp:setProperty name="mvo" property="interests" value="<%=interests %>"/>
	</jsp:useBean>
	
	<%
	mdao.insertMember(mvo);
	%>
	
	
	
	<script>
		alert('<%=mvo.getId()%>님, 환영합니다. 회원가입이 완료되었습니다.');
		window.location.href="index.jsp?view=memberList.jsp";
	</script>
</body>
</html>