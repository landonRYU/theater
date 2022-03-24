<%@page import="com.ezvtheater.BoardVO"%>
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
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO bvo = bdao.getOneBoard(num);
%>
<form method = "post">
	<table border = "1" align = "center">
		<tr>
			<th>번호</th>
			<td><%=bvo.getNum() %></td>
			<th>조회수</th>
			<td><%=bvo.getReadCount() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= bvo.getWriter() %></td>
			<th>작성일자</th>
			<td><%= bvo.getRegDate() %></td>
		</tr>
		<tr>
			<th>전자우편</th>
			<td><%=bvo.getEmail() %></td>
			<th>제목</th>
			<td><%=bvo.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan = "3"><%=bvo.getContent() %></td>
		</tr>
	
		<tr>
			<td colspan = "4" align = "center">
				<input type = "hidden" name = "num" value = "<%=num %>">
				<input type = "submit" value = "답글달기" formaction = "index.jsp?view=./reviewBoard/BoardRewriteForm.jsp">
				<input type = "submit" value = "수정하기" formaction = "index.jsp?view=./reviewBoard/BoardUpdateFrom.jsp">
				<input type = "submit" value = "삭제하기" formaction = "index.jsp?view=./reviewBoard/BoardDeleteFrom.jsp">
				<input type = "submit" value = "목록보기" formaction = "index.jsp?view=./reviewBoard/BoardList.jsp">
			</td>
		</tr>
	</table>
</form>
	
</body>
</html>