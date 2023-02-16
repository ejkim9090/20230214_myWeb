<%@page import="kh.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
내정보보기
<%
	if(request.getAttribute("myinfo") instanceof MemberVo){
		MemberVo vo = (MemberVo)request.getAttribute("myinfo");
		if(vo == null){
			// 로그아웃상태
%>
			<h4>로그인 되지 않았습니다. 정보가 없습니다.</h4>
			<a href="<%=request.getContextPath()%>/login">로그인페이지이동</a>
<%
		} else {
			// 로그인된 정보 
		}
	}
%>


id
email
name
pw
</body>
</html>