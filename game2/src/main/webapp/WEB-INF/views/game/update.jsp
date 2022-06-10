<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../includes/headerg.jsp" %>
    
    <div class="container">
  <h2>게임등록</h2>
  <form action="update" method="post" enctype="multipart/form-data">
      <input type="text" class="form-control" id="id" value="${game.id}" name="id" hidden="">
    <div class="form-group">
      <label for="gname">게임이름:</label>
      <input type="text" class="form-control" id="gname" value="${game.gname}" name="gname">
    </div>
    <div class="form-group">
      <label for="price">가격:</label>
      <input type="text" class="form-control" id="price" value="${game.price}" name="price">
    </div>
    <div class="form-group">
      <label for="developer">개발자:</label>
      <input type="text" class="form-control" id="developer" value="${game.developer}" name="developer">
    </div>
    <div class="form-group">
      <label for="mainContent">주내용:</label>
      <textarea class="form-control" rows="5" id="mainContent" name="mainContent">${game.mainContent}</textarea>
    </div>
    <div class="form-group">
      <label for="subContent">보조내용:</label>
      <textarea class="form-control" rows="5" id="subContent" name="subContent">${game.subContent}</textarea>
    </div>
    <button type="submit" class="btn btn-primary btn-sm">Submit</button>
  </form>
</div>
    
    <%@ include file="../includes/footer.jsp" %>