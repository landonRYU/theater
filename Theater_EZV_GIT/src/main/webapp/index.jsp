<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>  

<% String view = request.getParameter("view");
	if(view==null){
		view = "center.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<style type = "text/css">
   li{
        list-style: none;
      }
   ul a:hover {
   		font-weight : bold;
    	color: white;
    	transition:all .3s ease;
   		cursor: pointer;
   }
   .topMenu ul{
        height: 50px;
        background: black;
        line-height: 50px;
        }
        
    .topMenu ul li{
    	display: inline-block;
        margin-left: 30px;
        color: gray;
      }
     section{
     	width:100%;
     	float:left;
     }
     header{
     background-image: url('images/EZVsinlim2.jpg');
     }
     footer{
     	text-align:center;
     	width:100%;
     	height:150px;
     	background-color : black;
     	color:white;
     	float:left;
     	padding : 20px;
     }
     #welc{
     background-color : white;
     color: black;
     font-weight: bold;
     size: 30px;
     }
</style>
<meta charset="UTF-8">
<title>EZV에 오신 것을 환영합니다.</title>
</head>
<body> 
	<div id = "wrapper">
		<header>
		<jsp:include page = "top.jsp"/>
			<div align ="right">
				<button onclick = "location.href='index.jsp';">홈으로가기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:set var = "chk" value = "0"/>
				<c:if test="${sessionScope.id != null }">
					<c:set var = "id" value = "${sessionScope.id }"/>
					<c:set var ="chk" value = "1"/>
				</c:if>
				<c:choose>
					<c:when test = "${chk eq 0 }"><button onclick="window.open('login.jsp', '_blank', 'width=500, height=300');"> 로그인 </button>
					</c:when>
					<c:when test = "${chk eq 1 }"><font id ="welc"> ${id } 님 환영합니다. </font><button onclick="location.href='logoutPro.jsp';"> 로그아웃</button>
					</c:when>
				</c:choose>
			</div>
		</header>
			<nav class = "topMenu">
				<ul>
			        <li><a onclick = "changeView(1)">회원가입</a></li>
			        <li><a onclick = "changeView(2)">VOC</a></li>
			        <li><a onclick = "changeView(3)">회원정보관리</a></li>
			        <li><a onclick = "changeView(4)">나의정보관</a></li>
	      		</ul>
			</nav>
		<section>
			<jsp:include page ="<%=view%>"/>
		</section>
		<footer>
			<jsp:include page = "bottom.jsp"/>
		</footer>
	</div>
</body>
<script type = "text/javascript">
	function changeView(menu){
		if(menu=="1"){
			location.href="index.jsp?view=memberSignup.jsp";
		}
		if(menu=="2"){
			if(${chk}==0){
				alert("먼저 로그인을 해주세요.");
				window.open('login.jsp', '_blank', 'width=500, height=300');
			}else{
			location.href="index.jsp?view=/reviewBoard/BoardList.jsp";
			}
		}
		if(menu=="3"){
			if(${chk}==0){
				alert("먼저 로그인을 해주세요.");
				window.open('login.jsp', '_blank', 'width=500, height=300');
			}else{
			location.href="index.jsp?view=memberList.jsp";
			}
		}
		if(menu=="4"){
			if(${chk}==0){
				alert("먼저 로그인을 해주세요.");
				window.open('login.jsp', '_blank', 'width=500, height=300');
			}else{
				location.href="index.jsp?view=memberSelectOne.jsp";
			}
		}		
	}
</script>
</html>