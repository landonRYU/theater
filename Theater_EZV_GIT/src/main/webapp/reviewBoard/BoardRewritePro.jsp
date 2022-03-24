<%@page import="com.ezvtheater.BoardVO"%>
<%@page import="com.ezvtheater.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num")); //부모글 고유번호
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO dbVO = bdao.getOneBoard(num); 
%> 

	<jsp:useBean id="bvo" class ="com.ezvtheater.BoardVO">
		<jsp:setProperty name = "bvo" property="*"/>
		<jsp:setProperty name = "bvo" property="ref" value = "<%=dbVO.getRef() %>"/>
		<jsp:setProperty name = "bvo" property="re_step" value = "<%=dbVO.getRe_step() %>"/>
		<jsp:setProperty name = "bvo" property="re_level" value = "<%=dbVO.getRe_level() %>"/>		
	</jsp:useBean>
	
<%
	bdao.insertBoardRe(bvo);
%>
<script>
	alert('답글이 등록되었습니다.');
	location.href = "index.jsp?view=./reviewBoard/BoardList.jsp"
</script>
</body>
</html>