<%@page import="com.ezvtheater.MemberVO"%>
<%@page import="com.ezvtheater.MemberDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#tableS th {
		border : 1px solid;
	}
	
	#tableS td {
		border : 1px solid;
		padding : 10px 0px;
	}
	
	#tableS{
		width : 80%;
		margin : 0 auto;
		text-align: center;
		border-collapse: collapse;		
	}

</style>
<meta charset="UTF-8">
<title>회원정보 상세페이지</title>
</head>
<body>
	<%
	String id = "";
	if (request.getParameter("id") != null) {
		id = request.getParameter("id");
	}else if(session!=null){
		id = (String) session.getAttribute("id");
	}

	MemberDAO mdao = MemberDAO.getInstance();
	MemberVO mvo = new MemberVO();
	mvo = mdao.selectMemberOne(id);
	%>
	
	<h2 align="center">
		<%=id%>님의 회원정보
	</h2>
	<br>
	<form method="post">
		<table id = "tableS">
			<tr>
				<td><B>아이디</b></td>
				<td><%=mvo.getId()%></td>
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td><%=mvo.getEmail()%></td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><%=mvo.getTel()%></td>
			</tr>
			<tr>
				<td><b>관심분야</b></td>
				<td><%=mvo.getInterests()%></td>
			</tr>
			<tr>
				<td><b>직업</b></td>
				<td><%=mvo.getJob()%></td>
			</tr>
			<tr>
				<td><b>나이대</b></td>
				<td><%=mvo.getAge()%>대</td>
			</tr>
			<tr>
				<td><b>하고싶은말</b></td>
				<td><%=mvo.getIntroduce()%></td>
			</tr>
			<tr>
				<td><b>가입날짜</b></td>
				<td><%=mvo.getRegdate()%></td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="submit" value="회원정보수정" formaction="index.jsp?view=memberUpdateChk.jsp">
					<input type="submit" value="회원정보삭제" formaction="index.jsp?view=memberDelete.jsp">
					<input type="submit" value="회원목록보기" formaction="index.jsp?view=memberList.jsp">
					<input type="submit" value="신규회원가입" formaction="index.jsp?view=memberSignup.jsp">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
</body>
</html>