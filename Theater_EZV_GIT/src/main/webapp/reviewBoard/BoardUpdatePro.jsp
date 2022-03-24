<%@page import="com.ezvtheater.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bvo" class ="com.ezvtheater.BoardVO">
		<jsp:setProperty name = "bvo" property="*"/>		
	</jsp:useBean>
<%
	BoardDAO bdao = BoardDAO.getInstance();
	bdao.updateBoard(bvo);
%>

	<script>
		alert('글이 수정되었습니다.');
		location.href = "../index.jsp?view=./reviewBoard/BoardList.jsp"
	</script>	
</body>
</html>