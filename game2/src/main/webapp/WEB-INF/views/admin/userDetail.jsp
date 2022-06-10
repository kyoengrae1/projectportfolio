<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/headeru.jsp" %>
<div class="container">
  <h2>${user.username} 유저정보</h2>
  
    <div class="form-group">
      <label for="id">회원번호</label>
      <input type="text" class="form-control" id="id" name="id" value="${user.id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="title">아이디</label>
      <input type="text" class="form-control" id="title" name="title" value="${user.username}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">이메일</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${user.email}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">주소</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${user.address}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">전화번호</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${user.tel}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">권한</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${user.role}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="regdate">등록일</label>
      <input type="text" class="form-control" id="regdate"name="regdate" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${user.regdate}' />" readonly="readonly">
    </div>
    <div class="form-group text-right">
      <button type="button" class="btn btn-secondary btn-sm" id="btnDelete">삭제하기</button>
      <button type="button" class="btn btn-secondary btn-sm" id="btnList">목록보기</button>
    </div>
     
</div>
<script type="text/javascript">
$("#btnDelete").click(function(){
	if(confirm("정말 삭제할까요?")){
		location.href="/admin/delete?id=${user.id}"
	}
});
$("#btnList").click(function(){
		location.href="/admin/ulist"
});
</script>

<%@ include file="../includes/footer.jsp" %>