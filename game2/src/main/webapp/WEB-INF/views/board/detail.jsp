<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%@ include file="../includes/headerb.jsp" %>

	<div class="container">
	
  <h2>${board.writer} 글보기</h2>
  
    <div class="form-group">
      <label for="id">글번호</label>
      <input type="text" class="form-control" id="id" name="id" value="${board.id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title" name="title" value="${board.title}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${board.writer}" readonly="readonly">
    </div>
        <div class="form-group">
      <label for="file">file</label>
      <div>
      	<ul>
      		<c:forEach items="${board.boardAttachs}" var="fileInfo">
	      		<li style="list-style:nome">
	     					<%-- 실제경로(RealPath)가 아니어도 찾아줌 --%>
	     					<img src="/resource/upload/board/${fileInfo.savefolder}/${fileInfo.savefile}" height="200">
	      			${fileInfo.originfile}
	      		</li>
      		</c:forEach>
      	</ul>
      </div>
    </div>
    
    <div class="form-group">
      <label for="writer">조회수</label>
      <input type="text" class="form-control" id="writer"name="writer" value="${board.hitcount}" readonly="readonly">
    </div>
     <div class="form-group">
      <label for="content">내용:</label>
      <textarea class="form-control" rows="5" id="content" name="content" readonly="readonly">${board.content}</textarea>
    </div>
    
    <div class="form-group text-right">
    <c:if test="${principal.user.username==board.writer}">
      <button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정하기</button>
      <button type="button" class="btn btn-secondary btn-sm" id="btnDelete">삭제하기</button>
    </c:if>  
      <button type="button" class="btn btn-secondary btn-sm" id="btnList">목록보기</button>
    </div>
   
	<section class="mb-5" style="color: black;">
		<div class="card bg-light">
			<div class="card-body">
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" rows="2"
						placeholder="Join the discussion and leave a comment!" id="replyContent"></textarea>
						<button type="button" class="btn btn-success" id="replyBtn">Reply Write</button>
				</form>
				<div id="replyResult"></div>
				<!-- Single comment-->
				<br>
			</div>
		</div>
	</section>
	<script type="text/javascript">

var init = function(){
	$.ajax({
		type:"get",
		url:"/replies/getList/"+${board.id},
		dataType:"JSON",
		contentType:"application/json;charset=utf-8",
	})
	.done(function(resp){
		var str = "";
		$.each(resp,function(key,val){
			str += "<div class='d-flex'><div class='flex-shrink-0'><img class='rounded-circle'src='/img/gamerepl.png' height='50' width='50' alt='...'' /></div><div class='ms-3' style='width: 90%'><div class='fw-bold'>"
			str += "&nbsp&nbsp" + val.writer+ "&nbsp&nbsp&nbsp" + val.regdate + "</div>"
			str += "&nbsp&nbsp" + val.content + "</div>"
			
			if("${principal.user.username}"==val.writer){
				str+= "<a href='javascript:fdel("+val.id+")'>삭제</a></div><br>"
			}
			
		})
		$("#replyResult").html(str);
	})
};

function fdel(rno){
	$.ajax({
		type:"delete",
		url:"/replies/"+rno,
	})
	.done(function(resp){
		alert(rno+"번 글 삭제 완료");
		init();
	})
	.fail(function(){
		alert("댓글 삭제 실패")
	})
}

$("#replyBtn").click(function(){
	
	if(${empty principal}){
		alert("로그인하세요");
		location.href="/login";
		return;
	}
	var data={
			"content":$("#replyContent").val(),
			"writer":"${principal.user.username}"
	}
	$.ajax({
		type:"post",
		url:"/replies/new/"+$("#id").val(),
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		alert("댓글 추가 성공");
		init();
	})
	.fail(function(){
		alert("댓글 추가 실패")
	});
});

$("#btnUpdate").click(function(){
	if(confirm("정말 수정할까요?")){
		location.href="/board/update/${board.id}"
	}
});

$("#btnDelete").click(function(){
	if(confirm("정말 삭제할까요?")){
		location.href="/board/delete/${board.id}"
	}
});

$("#btnList").click(function(){
	if(confirm("정말 이동할까요?")){
		location.href="/board/list?pageNum=${pageNum}&field=${field}&keyword=${keyword}"
	}
});

init();

</script>   



<%@ include file="../includes/footer.jsp" %>
</div>
 
    



