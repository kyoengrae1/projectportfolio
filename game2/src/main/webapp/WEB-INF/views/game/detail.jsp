<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../includes/headerg.jsp" %>
 



      <section class="games-single-page">
		<div class="container">
			<div class="game-single-preview">
				<img src="/resource/upload/game/${game.gameAttachs[0].savefolder}/${game.gameAttachs[0].savefile}" width="1200" height="600" alt="">
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				 <button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정하기</button>
      			 <button type="button" class="btn btn-secondary btn-sm" id="btnDelete">삭제하기</button>
			</sec:authorize>
			<div class="row">
				<div class="col-xl-9 col-lg-8 col-md-7 game-single-content">
					<div class="gs-meta"><fmt:formatDate value="${game.regdate}" pattern="yyyy-MM-dd"/> /  개발사 : <a href="">${game.developer}</a> / 판매량 : ${game.sellCount}</div>
					<h2 class="gs-title">${game.gname}</h2>
					<h4>설명1</h4>
					<p>${game.mainContent}</p>
					<h4>설명2</h4>
					<p>${game.subContent}</p>
					<div class="geme-social-share pt-5 d-flex">
						<p>Share:</p>
						<a href="#"><i class="fa fa-pinterest"></i></a>
						<a href="#"><i class="fa fa-facebook"></i></a>
						<a href="#"><i class="fa fa-twitter"></i></a>
						<a href="#"><i class="fa fa-dribbble"></i></a>
						<a href="#"><i class="fa fa-behance"></i></a>
					</div>

				<section class="mb-5" style="color: black;">
					<div class="card bg-light">
						<div class="card-body">
							<!-- Comment form-->
							<form class="mb-4">
								<select name="replyGrade" id="replyGrade">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								<textarea class="form-control" rows="2"
									placeholder="Join the discussion and leave a comment!"
									id="replyContent"></textarea>
								<button type="button" class="btn btn-success" id="replyBtn">Reply
									Write</button>
							</form>
							<div id="replyResult"></div>
							<!-- Single comment-->
							<br>
						</div>
					</div>
				</section>
				</div>
				
				
				
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="rating-widget">
								<h4 class="widget-title">평점</h4>
								<ul>
									
								</ul>
								<div class="rating">
									<h5><span id="replyAvg"></span> / 5</h5>
								</div>
							</div>
						</div>
						
						
						<div class="widget-item">
							<div class="rating-widget">
								<h4 class="widget-title">가격</h4>
								<ul>
									
								</ul>
								<div class="rating">
									<h5><i>금액</i><span>${game.price}</span> 원</h5>
									<sec:authorize access="hasRole('ROLE_USER')">
									<center><button class="favorite styled" type="button" id="btnPlusCart">카트담기</button></center>
									</sec:authorize>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script type="text/javascript">
$("#btnUpdate").click(function(){
	location.href="/game/update?id=${game.id}"
});
$("#btnDelete").click(function(){
	if(confirm("정말 삭제할까요?")){
		location.href="/game/delete?id=${game.id}"
	}
});
$("#btnList").click(function(){
	location.href="/game/glist"
});

$("#btnPlusCart").click(function(){
	
	$.ajax({
		type:"post",
		url:"/game/cartAdd?id="+${game.id},
		contentType:"application/json;charset=utf-8",
	})
	.done(function(res){
		if(res=="success"){
			alert("카트에 등록되었습니다.");
		}
		else if(res=="IsCart"){
			alert("카트에 이미 있습니다.");
		}
		else if(res=="IsGame"){
			alert("이미 구매한 게임입니다.");
		}
		else{
			alert("카트등록에 실패하였습니다.");
		}
	})
});

var avg = function(){
	$.ajax({
		type:"get",
		url:"/gamereplies/avg/"+${game.id},
		dataType:"JSON",
		contentType:"application/json;charset=utf-8"
	})
	.done(function(res){
		var str = res;
		$("#replyAvg").html(str);
	});
};
avg();

var init = function(){
	$.ajax({
		type:"get",
		url:"/gamereplies/getList/"+${game.id},
		dataType:"JSON",
		contentType:"application/json;charset=utf-8",
	})
	.done(function(resp){
		var str = "";
		$.each(resp,function(key,val){
			str += "<div class='d-flex'><div class='flex-shrink-0'><img class='rounded-circle'src='/img/gamerepl.png' height='50' width='50' alt='...'' /></div><div class='ms-3'><div class='fw-bold'>"
			str += "&nbsp&nbsp" + val.writer+ "&nbsp&nbsp★" +val.grade +"&nbsp&nbsp&nbsp" + val.regdate + "</div>"
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
		url:"/gamereplies/"+rno,
	})
	.done(function(resp){
		alert(rno+"번 글 삭제 완료");
		init();
		avg();
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
			"writer":"${principal.user.username}",
			"grade" : $("#replyGrade option:selected").val()
	}
	$.ajax({
		type:"post",
		url:"/gamereplies/new/"+${game.id},
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		alert("댓글 추가 성공");
		init();
		avg();
	})
	.fail(function(){
		alert("댓글 추가 실패")
	});
});

init();
</script>		
		
	</section>


<%@ include file="../includes/footer.jsp" %>

<style>
.styled {
    border: 0;
    line-height: 2.5;
    padding: 0 20px;
    font-size: 1rem;
    text-align: center;
    color: #fff;
    text-shadow: 1px 1px 1px #000;
    border-radius: 10px;
    background-color: rgba(220, 0, 0, 1);
    background-image: linear-gradient(to top left,
                                      rgba(0, 0, 0, .2),
                                      rgba(0, 0, 0, .2) 30%,
                                      rgba(0, 0, 0, 0));
    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
                inset -2px -2px 3px rgba(0, 0, 0, .6);
}

.styled:hover {
    background-color: rgba(255, 0, 0, 1);
}

.styled:active {
    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
                inset 2px 2px 3px rgba(0, 0, 0, .6);
}
</style>




 

 
