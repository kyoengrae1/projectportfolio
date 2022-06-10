<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>
<div class="container">
	<h3 style="color: white;">결제가 완료되었습니다.</h3>
	<button type="button" id="btnMygame">확인</button>
</div>

<script type="text/javascript">
	$("#btnMygame").click(function(){
		location.href="/user/mygame";
	});
</script>

<%@ include file="../includes/footer.jsp" %>