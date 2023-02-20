<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css"> 
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20230214 myWeb home</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/myTest.js"></script>
<script>
f1();
</script>
</head>
<body>
<h1> 서버프로그램 구현 실습 </h1>
	<img src="<%=request.getContextPath()%>/resources/imgaes/1607412378456l0.jpg"
	width="100" height="100">
	<img src="<%=request.getContextPath()%>/resources/imgaes/trash.png"
	width="100" height="100">
	<img src="<%=request.getContextPath()%>/resources/imgaes/ico_welcome_marketing_1.svg">
	<object data="<%=request.getContextPath()%>/resources/imgaes/ico_welcome_marketing_1.svg">
	</object>
	
	
	
	<jsp:include page="/WEB-INF/view/header.jsp"/>
	
	<c:if test="${not empty lgnss }">
		<button class="btn myinfo">내정보보기</button>
	</c:if>
	
	<jsp:include page="/WEB-INF/view/board/boardlist.jsp"/>
	
	
	
	<script>
	$(".btn.login").on("click", handlerClickBtnLogin);
	$(".btn.logout").on("click", handlerClickBtnLogout);
	$(".btn.myinfo").on("click", handlerClickBtnMyinfo);
	
	function handlerClickBtnMyinfo(){
		console.log("BtnMyinfo 눌림");
		location.href="<%=request.getContextPath()%>/myinfo";
	}
	function handlerClickBtnLogin(){
		console.log("btnLogin 눌림");
		location.href="<%=request.getContextPath()%>/login";
	}
	function handlerClickBtnLogout(){
		console.log("btnLogout 눌림");
		location.href="<%=request.getContextPath()%>/logout";
	}

	</script>
	
</body>
</html>

