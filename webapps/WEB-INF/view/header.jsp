<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div>
		<c:choose>
			<c:when test="${empty lgnss}">
				<button type="button" class="btn login">로그인</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn logout">로그아웃</button>
			</c:otherwise>
		</c:choose>
	</div>

	<div>
		<%
		if(session.getAttribute("lgnss") == null){
		%>
			<button type="button" class="btn login">로그인</button>
		<%
		} else {
		%>
			<button type="button" class="btn logout">로그아웃</button>
		<%
		}
		%>
	</div>
	<hr>
</header>