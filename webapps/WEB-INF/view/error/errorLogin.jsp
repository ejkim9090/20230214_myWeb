<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var errMsg = '<%= (String) request.getAttribute("errorMsg") %>';
	//var errMsg = '${errorMsg}';
	alert(errMsg);
</script>
	<h4>로그인 되지 않았습니다. 로그인 페이지로 이동하세요.</h4>
	<a href="<%=request.getContextPath()%>/login">로그인페이지이동</a>
</body>
</html>