<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.ezvtheater.BoardDAO" %>
<%	request.setCharacterEncoding("UTF-8");%>
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
	bdao.insertBoard(bvo);
%>
<script>
	alert('글이 등록되었습니다.');
	location.href = "index.jsp?view=./reviewBoard/BoardList.jsp"
</script>
	<!--"index.jsp?viewLeft=reviewBoard/BoardInfo.jsp&viewRight=BoardList.jsp"  -->
</body>
</html>