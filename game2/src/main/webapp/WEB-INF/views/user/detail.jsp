<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/headeru.jsp" %>
<div class="container">
  <h2>${principal.user.username} 유저정보</h2>
  
    <div class="form-group">
      <label for="id">회원번호</label>
      <input type="text" class="form-control" id="id" name="id" value="${principal.user.id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="title">아이디</label>
      <input type="text" class="form-control" id="title" name="title" value="${principal.user.username}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">이메일</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${principal.user.email}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">주소</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${principal.user.address}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">전화번호</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${principal.user.tel}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">등록일</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${principal.user.regdate}" readonly="readonly">
    </div>
    <div class="form-group text-right">
      <button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">회원수정</button>
      <button type="button" class="btn btn-secondary btn-sm" id="btnDelete">회원탈퇴</button>
      <button type="button" class="btn btn-secondary btn-sm" id="btnHome">홈페이지로</button>
    </div>
     
</div>
<script type="text/javascript">
$("#btnUpdate").click(function(){
	location.href="/user/update"
});
$("#btnDelete").click(function(){
	if(confirm("정말 탈퇴하시겠습니까?")){
		location.href="/user/delete"
	}
});
$("#btnHome").click(function(){
		location.href="/"
});
</script>

<%@ include file="../includes/footer.jsp" %>