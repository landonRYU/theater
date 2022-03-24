<%@page import="com.ezvtheater.MemberVO"%>
<%@page import="com.ezvtheater.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
<title>회원 전체 목록</title>
</head>
<body>
	<h1 align = "center">회원 정보 보기</h1>
	<table id = "tableS">
		<tr>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>취미</th>
			<th>직업</th>
			<th>연령</th>
			<th>할말</th>
			<th>가입일자</th>
		</tr>
<%
	MemberDAO mdao = MemberDAO.getInstance();
	ArrayList<MemberVO> mvoArr = new ArrayList<MemberVO>();
	mvoArr = mdao.memberSelectAll();
	for(int i = 0; i< mvoArr.size(); i++){
%>
		<tr>
			<td><a href = "index.jsp?view=memberSelectOne.jsp&id=<%=mvoArr.get(i).getId()%>"> <%=mvoArr.get(i).getId()%></a></td>
			<td><%=mvoArr.get(i).getEmail()%></td>
			<td><%=mvoArr.get(i).getTel()%></td>
			<td><%=mvoArr.get(i).getInterests()%></td>
			<td><%=mvoArr.get(i).getJob()%></td>
			<td><%=mvoArr.get(i).getAge()%>대</td>
			<td><%=mvoArr.get(i).getIntroduce()%></td>
			<td><%=mvoArr.get(i).getRegdate()%></td>
		</tr>	
<%		
	}
%>
	</table>
	<br>
	<br>
	<br>
</body>
</html>