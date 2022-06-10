<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../includes/headerg.jsp" %>
    
    <div class="container">
  <h2>게임등록</h2>
  <form action="insert" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="gname">게임이름:</label>
      <input type="text" class="form-control" id="gname" placeholder="Enter gname" name="gname">
    </div>
    <div class="form-group">
      <label for="price">가격:</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price">
    </div>
    <div class="form-group">
      <label for="developer">개발자:</label>
      <input type="text" class="form-control" id="developer" placeholder="Enter developer" name="developer">
    </div>
   	<div class="form-group">
      <label for="category">카테고리:</label>
	  <select name="category" id="category">
      <c:forEach items="${cats}" var="cate">
	  	<option value="${cate}">${cate}</option>
      </c:forEach>
	  </select>
    </div>
   	<div class="form-group">
      <label for="files">파일업로드:</label>
      <input type="file" class="form-control" id="files" name="files" multiple>
    </div> 
    <div class="form-group">
      <label for="mainContent">주내용:</label>
      <textarea class="form-control" rows="5" id="mainContent" name="mainContent"></textarea>
    </div>
    <div class="form-group">
      <label for="subContent">보조내용:</label>
      <textarea class="form-control" rows="5" id="subContent" name="subContent"></textarea>
    </div>
    <button type="submit" class="btn btn-primary btn-sm">Submit</button>
  </form>
</div>
    
    <%@ include file="../includes/footer.jsp" %>