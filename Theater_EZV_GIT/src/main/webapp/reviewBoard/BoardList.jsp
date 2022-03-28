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
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum = "1";
	}
	
	int count = 0; //전체 글의 갯수 파악 150개
	//int number = 0;//페이지 넘버링 값 저장하는 변수
	int currentPage = Integer.parseInt(pageNum);
	
	BoardDAO bdao = BoardDAO.getInstance();
	count = bdao.getAllCount();
	
	int startRow = (currentPage - 1)*pageSize + 1; //시작 페이지 11
	int endRow = currentPage * pageSize; //끝 페이지 20
	ArrayList<BoardVO> arrBvo = bdao.getBoardAll(startRow, endRow);
	//number = (currentPage -1)*pageSize;
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
<%
	if(count>0){
		int pageCount = count/pageSize + (count%pageSize ==0 ? 0 : 1);
		int startPage = 1;
		if(currentPage % 10 != 0){
			startPage = (currentPage/10) * 10 + 1;
		}else{
			startPage = (currentPage / 10) * 10 -1;
		}
		
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1 ;
		
		//이전이나 다음에 대한 처리 부분 코딩
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > 10){
%>
		<a href = "index.jsp?view=./reviewBoard/BoardList.jsp&pageNum=<%=startPage - 10%>">[previous]</a>
<%
		}
		for(int i = startPage; i <=endPage ; i++){
%>
		<a href = "index.jsp?view=./reviewBoard/BoardList.jsp&pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
		
		if(endPage < pageCount){
%>
		<a href = "index.jsp?view=./reviewBoard/BoardList.jsp&pageNum=<%=startPage + 10%>">[next]</a>
<%
		}
	}
	
%>

</body>

</html>