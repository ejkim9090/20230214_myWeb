<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20230214 myWeb home</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
<h1> 서버프로그램 구현 실습 </h1>
	<jsp:include page="/WEB-INF/view/header.jsp"/>
	
	<script>
	$(".btn.login").on("click", handlerClickBtnLogin);
	$(".btn.logout").on("click", handlerClickBtnLogout);
	
	function handlerClickBtnLogin(){
		console.log("btnLogin 눌림");
		location.href="<%=request.getContextPath()%>/login";
	}
	function handlerClickBtnLogout(){
		console.log("btnLogout 눌림");
	}

	</script>
</body>
</html>