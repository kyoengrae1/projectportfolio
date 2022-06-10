<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- format 날짜 형태 변경하려고 사용 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/headeru.jsp" %>
<div class="container">
	<h3>User Total(${count})</h3>
	<table class="table-hover table table-danger table-striped table-borderless table-sm">
		<thead class="table-dark">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>권한</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${lists.content}" var="user">
			<tr onClick="location.href='/admin/detail?username=${user.username}'" style="cursor:pointer; color: black;">
				<td>${user.id}</td>
				<td>${user.username}</td>
				<td>${user.email}</td>
				<td>${user.tel}</td>
				<td>${user.address}</td>
				<td>${user.role}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="d-flex justify-content-between mt-3">
		<ul class="pagination">
		<!-- 이전 -->
		<c:if test="${prev==true}">
			<li class="page-item"><a class="page-link" href="?page=${startPage-pageSize}">Previous</a></li>
		</c:if>
		<!--페이지 리스트-->
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<li class="page-item"><a class="page-link" href="?page=${i}">${i+1}</a></li>
		</c:forEach>
		<!-- 다음 -->
		<c:if test="${next==true}">
			<li class="page-item"><a class="page-link" href="?page=${endPage+1}">Next</a></li>
		</c:if>			
		</ul>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>