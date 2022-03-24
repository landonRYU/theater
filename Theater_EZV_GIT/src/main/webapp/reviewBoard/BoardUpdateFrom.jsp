<%@page import="com.ezvtheater.BoardDAO"%>
<%@page import="com.ezvtheater.BoardVO"%>
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
	BoardVO bvo = new BoardVO();
	bvo = bdao.getOneBoard(num);
%> 

	<form action ="./reviewBoard/BoardUpdatePro.jsp" name = "updateForm" method = "post" onsubmit = "return pwcheck();">
		<input type = "hidden" name = "num" value = "<%=num %>">
		<label>작성자 : </label> <%=bvo.getWriter() %><br>
		<label>글제목</label><input type="text" name = "title" value="<%=bvo.getTitle() %>"><br>
		<label>전자우편</label> <input type="email" name = "email" value = "<%=bvo.getEmail()%>"><br>
		글내용 <br> <textarea rows = "10" cols="40" name = "content" required><%=bvo.getContent() %></textarea>
		<br>
		<br>
		<label>비밀번호 확인</label> <input type="password" name = "pw" required><br>
		<br><br>
		<input type = "submit" value = "수정하기">
		<input type = "reset" value = "원래대로 되돌리기">
	</form>
		<a href = "index.jsp?view=./reviewBoard/BoardList.jsp"><input type = "button" value = "목록보기"></a>
</body>
<script>
	function pwcheck(){
		let dbPw = <%=bvo.getPw()%>;
		let inputPw = document.updateForm.pw.value;
		if(dbPw!=inputPw)
			alert("비밀번호가 틀렸습니다");
			document.updateForm.pw.value = "";
			return false;
		}else
			return true;
</script>
</html>