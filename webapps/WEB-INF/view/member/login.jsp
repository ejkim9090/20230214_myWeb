<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kh 로그인</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp"/>
	<section>
		<form action="loginurl" method="post">
			id:<input type="text" name="n1"> 
			<br>
			pw:<input type="password" name="n2">
			<br>
			<button type="submit">로그인하기</button>
			<button type="button" class="btn enroll">회원가입</button>
		</form>
	</section>
	
	<script>
		$(".btn.enroll").on("click",handlerClickBtnEnroll);
		function handlerClickBtnEnroll(){
			console.log("btnEnroll 눌림");
			location.href="<%=request.getContextPath()%>/enroll";
		}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>