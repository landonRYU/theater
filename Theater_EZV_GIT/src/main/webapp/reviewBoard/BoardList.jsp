<%@page import="com.ezvtheater.BoardVO"%>
<%@page import="java.util.ArrayList"%>
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
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<BoardVO> arrBvo = bdao.getBoardAll();
	BoardVO bvo = null;
%>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
<%
	for(int i = 0; i < arrBvo.size(); i++){
		bvo = arrBvo.get(i);
%>
		<tr>
			<td><a href = "index.jsp?view=./reviewBoard/BoardDetail.jsp?num=<%= bvo.getNum()%>"><%= bvo.getNum()%></a></td>
			<td><%if(bvo.getRe_level()>1){
				for(int j = 1; j < bvo.getRe_level(); j++){
					%> &nbsp;
			<%
				}
			}	
			%>
			<%= bvo.getTitle() %></td>
			<td><%= bvo.getWriter() %></td>
			<td><%= bvo.getRegDate() %></td>
			<td><%= bvo.getReadCount() %></td>			
		</tr>
<%
	}
%>
	</table>
	<br><br>
	<a href = "index.jsp?view=./reviewBoard/BoardWriteForm.jsp"><input type = "button" value = "글쓰기"></a>

</body>
</html>