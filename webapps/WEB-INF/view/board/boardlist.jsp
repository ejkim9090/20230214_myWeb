<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <h1>게시글 목록</h1>
	<c:set var="aaa" value="3000"/>
	${aaa }
	
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성시간</td>
			<td>조회수</td>
		</tr>
	    <c:forEach items="${boardlist }" var="vo" varStatus="s">
			<%-- <c:set target="${vo }" property="boardTitle" value="aaa"/> --%>
			<c:if test="${s.count % 2 == 1 }">
			<tr style="{background:#ccc}">
			</c:if>
			<c:if test="${s.count % 2 == 0 }">
			<tr>
			</c:if>
				<td>&nbsp;${ vo.boardNum }: ${s.count }: ${s.index }</td>
				<td>${ vo.boardTitle }</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;${ vo.boardWriter }</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;${ vo.boardDate }</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;${ vo.boardReadcount }</td>
			</tr>
	    </c:forEach>
	</table>  
	
	<div>
<h3>페이지처리</h3>
<div>

<c:if test="${startPageNum > 1}">
<span>&nbsp;&nbsp;이전&nbsp;&nbsp;</span>
</c:if>
<c:forEach begin="${startPageNum }" end="${endPageNum }" step="1" var="page">
<c:choose>
	<c:when test="${page == currentPage }">
		<span><b>&nbsp;&nbsp;${page }&nbsp;&nbsp;</b></span>
	</c:when>
	<c:otherwise>
		<span><a href="<%=request.getContextPath()%>/?aaa=${page }">&nbsp;&nbsp;${page }&nbsp;&nbsp;</a></span>
	</c:otherwise>
</c:choose>

</c:forEach>
<c:if test="${endPageNum < pageCnt }">
<span>&nbsp;&nbsp;다음&nbsp;&nbsp;</span>
</c:if>

<!-- request.setAttribute("startPageNum", startPageNum);
request.setAttribute("endPageNum", endPageNum);
request.setAttribute("currentPage", currentPage);
request.setAttribute("pageCnt", pageCnt); -->
</div>
	</div>
	
	  
    <hr>
</section>
    