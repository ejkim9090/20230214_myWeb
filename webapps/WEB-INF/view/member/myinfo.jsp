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
	Object obj = request.getAttribute("myinfo");
	MemberVo vo = null; 
	if(obj == null){
		// 로그아웃상태
%>
		<h4>로그인 되지 않았습니다. 정보가 없습니다.</h4>
		<a href="<%=request.getContextPath()%>/login">로그인페이지이동</a>
<%
	} else {
		if(obj instanceof MemberVo){
			vo = (MemberVo)obj;
		}
		if(vo == null){
			// 로그아웃상태
%>
			<h4>로그인 되지 않았습니다. 정보가 없습니다.</h4>
			<a href="<%=request.getContextPath()%>/login">로그인페이지이동</a>
<%
		} else {
			// 로그인된 정보 
%>
			id: <%=vo.getId() %>
			<br>
			name: <%=vo.getName() %>
			<br>
			email: <%=vo.getEmail() %>
<%
		}
	}
%>


</body>
</html>