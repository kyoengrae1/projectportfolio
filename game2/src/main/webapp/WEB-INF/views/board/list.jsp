<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../includes/headerb.jsp"%>
<section class="games-single-page">

	<div class="container">
		<h2 style="color: white;">Community(${count})</h2>
		<div class="form-group text-right">
			<c:if test="${not empty principal }">
				<button type="button" class="btn btn-secondary btn-sm" id="btnWrite">글쓰기</button>
			</c:if>
		</div>
		<table class="table table-dark table-striped table-borderless table-sm">
			<thead class="table-light thead" style="color: black;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${lists.content}" var="board">
						<tr onClick="location.href='/board/detail?id=${board.id}&page=${cp}&field=${field}&word=${word}'" style="cursor:pointer;">
						<td>${board.id}</td>
						<td>${board.title}</td>
						<td>${board.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.regdate}" /></td>
						<td>${board.hitcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="d-flex justify-content-between mt-3">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${prev==true}">
					<li class="page-item"><a class="page-link"
						href="?page=${startPage-blockSize}&field=${field}&keyword=${keyword}">이전</a></li>
				</c:if>
				<!--페이지 리스트-->
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<li class="page-item"><a class="page-link"
						href="?page=${i}&field=${field}&keyword=${keyword}">${i+1}</a></li>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${next==true}">
					<li class="page-item"><a class="page-link"
						href="?page=${endPage+1}&field=${field}&keyword=${keyword}">다음</a></li>
				</c:if>
			</ul>

			<form class="form-inline" action="/board/list" id="searchFrm"
				method="get">
				<select name="field" class="form-control mb-2 mr-sm-2">
					<option value="" disabled selected>--</option>
					<option value="writer" ${field=='writer' ? 'selected':''}>작성자</option>
					<option value="title" ${field=='title' ? 'selected':''}>제목</option>
					<option value="content" ${field=='content' ? 'selected':''}>내용</option>
					<option value="cwt" ${field=='cwt' ? 'selected':''}>제목or작성자or내용</option>
				</select> <input type="text" class="form-control mb-2 mr-sm-2"
					placeholder="Enter Search" value="${keyword}" name="keyword">
				<button type="submit" class="btn btn-secondary mb-2 btn-sm">Search</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$("#btnWrite").click(function() {
			location.href = "/board/register"
		});
	</script>
	
</section>


<%@ include file="../includes/footer.jsp"%>











