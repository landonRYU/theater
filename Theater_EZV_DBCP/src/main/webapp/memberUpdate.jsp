<%@page import="com.ezvtheater.MemberVO"%>
<%@page import="com.ezvtheater.MemberDAO"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript">
function formcheck(){
	const pwchk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	let pw = document.regform.pw.value;
	let pw2 = document.regform.pw2.value;
	
	if(pw!=pw2){
		alert('비밀번호가 틀렸습니다.');
		document.regform.pw.focus();
		document.regform.pw.value = "";
		document.regform.pw2.value = "";
		return false;
	}else if(pwchk.test(pw)==false){
		alert('비밀번호는 영문자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력하세요.');
		document.regform.pw.focus();
		document.regform.pw.value = "";
		document.regform.pw2.value = "";
		return false;
	}
}
</script>
<style>
	.tableS td {
		border : 1px solid;
		padding : 10px;
		
	}
	.tableS{
		margin: auto;
		width : 600px;
		text-align: center;
		border-collapse: collapse;		
	}
</style>

<meta charset="UTF-8">
<title>회원수정 페이지</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	MemberDAO mdao = MemberDAO.getInstance();
	int result = mdao.logIn(id, pw);
%>
	<script>
		if(<%=result%>==-1){
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		}
	</script>
<%	
	MemberVO mvo = new MemberVO();
	mvo = mdao.selectMemberOne(id);
	String interestsTemp = mvo.getInterests();
	String[] intArr = interestsTemp.split(" ");
	int age = mvo.getAge();

%>


	<h2 align = "center"> <%=mvo.getId() %>님의 회원정보를 수정합니다.</h2>
		<form action = "index.jsp?view=memberUpdatePro.jsp" method = "post" onsubmit="return formcheck();">
		<table class="tableS">
			<tr>
				<td><b>새 비밀번호</b></td>
				<td><input type = "password" name = "pw" size= "50" placeholder = "영문자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력하세요." required> 
			</tr>
			<tr>
				<td><b>비밀번호 확인</b></td>
				<td><input type = "password" name = "pw2" size= "50" placeholder = "위와 같은 비밀번호를 입력하세요." required> 
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td><input type = "email" name = "email" size= "50" value = "<%=mvo.getEmail() %>" required> 
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><input type = "tel" name = "tel" size= "50" value = "<%=mvo.getTel() %>" required> 
			</tr>
			<tr>
				<td><b>관심분야</b></td>
				<td><input type = "checkbox" name = "interests" value = "공포" <%=mdao.infoChk(intArr, "공포")%>> 공포 
					<input type = "checkbox" name = "interests" value = "뮤지컬" <%=mdao.infoChk(intArr, "뮤지컬")%>> 뮤지컬 
					<input type = "checkbox" name = "interests" value = "코미디" <%=mdao.infoChk(intArr, "코미디")%>> 코미디 
					<input type = "checkbox" name = "interests" value = "액션" <%=mdao.infoChk(intArr, "액션")%>> 액션 
					<input type = "checkbox" name = "interests" value = "멜로" <%=mdao.infoChk(intArr, "멜로")%>> 멜로 
				</td> 
			</tr>
			<tr>
				<td><b>직업</b></td>
				<td><select name = "job">
				<c:set var = "jobVal" value = "<%=mvo.getJob() %>"/>
				<option value = "자영업자" <c:if test = "${jobVal eq '자영업자'}"> selected </c:if>> 자영업자</option>
				<option value = "회사원" <c:if test = "${jobVal eq '회사원'}"> selected </c:if>> 회사원</option>
				<option value = "학생" <c:if test = "${jobVal eq '학생'}"> selected </c:if>> 학생</option>
				<option value = "공무원" <c:if test = "${jobVal eq '공무원'}"> selected </c:if>>공무원</option>
				<option value = "전문직" <c:if test = "${jobVal eq '전문직'}"> selected </c:if>> 전문직</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><b>나이대</b></td>
				<td><input type = "radio" name = "age" value = "10" <%=mdao.infoChk(10, age)%>> 10대 
					<input type = "radio" name = "age" value = "20" <%=mdao.infoChk(20, age)%>> 20대 
					<input type = "radio" name = "age" value = "30" <%=mdao.infoChk(30, age)%>> 30대 
					<input type = "radio" name = "age" value = "40" <%=mdao.infoChk(40, age)%>> 40대 
					<input type = "radio" name = "age" value = "50" <%=mdao.infoChk(50, age)%>> 50대 
					<input type = "radio" name = "age" value = "60" <%=mdao.infoChk(60, age)%>> 60대 
				</td> 
			</tr>
			<tr>
				<td><b>하고싶은말</b></td>
				<td><textarea rows = "4" cols = "50" name = "introduce" required><%=mvo.getIntroduce() %></textarea> 
			</tr>	
			<tr>
				<td colspan = "2"><input type = "hidden" name = "id" value = "<%=id%>"> 
				<input type = "submit" value = "확인"></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		</form>
</body>
</html>