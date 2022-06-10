<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>
<div class="container">
  <h2>${principal.user.username} 유저정보</h2>
	<form action="/user/update" method="post">
	    <div class="form-group">
	      <label for="id">회원번호</label>
	      <input type="text" class="form-control" id="id" name="id" value="${principal.user.id}" readonly="readonly">
	    </div>
	    <div class="form-group">
	      <label for="username">아이디</label>
	      <input type="text" class="form-control" id="username" name="username" value="${principal.user.username}" readonly="readonly">
	    </div>
	    <div class="form-group">
	      <label for="password">패스워드</label>
	      <input type="password" class="form-control" id="password" name="password" placeholder="change password">
	    </div>
	    <div class="form-group">
	      <label for="email">이메일</label>
	      <input type="text" class="form-control" id="email"name="email" value="${principal.user.email}">
	    </div>
	    <div class="form-group">
	      <label for="address">주소</label>
	      <input type="text" class="form-control" id="address"name="address" value="${principal.user.address}">
	    </div>
	    <div class="form-group">
	      <label for="tel">전화번호</label>
	      <input type="text" class="form-control" id="tel"name="tel" value="${principal.user.tel}">
	    </div>
	    <div class="form-group">
	      <label for="regdate">등록일</label>
	      <input type="text" class="form-control" id="regdate"name="regdate" value="${principal.user.regdate}" disabled="disabled">
	    </div>
	    <button type="submit" class="btn btn-primary btn-sm">수정하기</button>
	</form>
     
</div>

<script type="text/javascript">
	
</script>


<%@ include file="../includes/footer.jsp" %>