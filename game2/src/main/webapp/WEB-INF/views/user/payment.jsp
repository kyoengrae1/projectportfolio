<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<section class="review-section">
		<div class="container">
			<c:forEach items="${lists}" var="cart">
			<div class="review-item">
				<div class="row">
					<div class="col-lg-4">
						<div class="review-pic">
							<img src="/resource/upload/game/${cart.game.gameAttachs[0].savefolder}/${cart.game.gameAttachs[0].savefile}" alt="" width="200" height="200">
						</div>
					</div>
					<div class="col-lg-8">
						<div class="review-content text-box text-white">
							<div class="rating">
								<h5><i>가격</i><span>${cart.game.price}원</span></h5>

							</div>
							<div class="top-meta">제작자 : <a href="">${cart.game.developer}</a></div>
							<h3>${cart.game.gname}</h3>
							<!-- <a href="#" class="read-more">Read More  <img src="/img/icons/double-arrow.png" alt="#"/></a> -->
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<div class="review-item2" >
				<div class="row">
					<div class="col-lg-4">
						<div class="review-pic">
						<h2 style="color:white;">결제수단</h2>
								<input type="radio" name="chk_info" value="HTML">신용카드 : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="text">
								<br><input type="radio" name="chk_info" value="CSS">무통장입금 
								<br><input type="radio" name="chk_info" value="웹디자인">휴대폰결제 : <input type="text" name="text">
							
						</div>
					</div>
					<div class="col-lg-8">
						<div class="review-content text-box text-white">
							<div class="rating">
								<h5><i>총 합계 금액</i><span>${sum}원</span></h5>
							&nbsp;&nbsp;&nbsp;&nbsp;
								<center><button class="favorite styled2" type="button" id="btnPayment">결제하기</button></center>
							</div>
							<div class="top-meta"> <a href=""></a></div>
							<h3></h3>
						</div>
					</div>
				</div>
			</div>
			
		</div>
<script type="text/javascript">
	$("#btnPayment").click(function(){
		location.href="/user/payment";
	});
</script>
	</section>
	
	<%@ include file="../includes/footer.jsp" %>
	
<style>
.review-pic.h3{
color:white;
}

	.review-item2{
	 border-top: solid 3px white;
	}
	
	.review-item {
    margin-bottom: 30px;
}
	
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
                inset 2px 2px 3px rgba(0, 0, 0, .6);}
                
/*  ------------------------------------------- */        

.styled2 {
    border: 0;
    line-height: 2.5;
    padding: 0 20px;
    font-size: 1rem;
    text-align: center;
    color: #fff;
    text-shadow: 1px 1px 1px #000;
    border-radius: 10px;
    background-color: lightblue;
    background-image: linear-gradient(to top left,
                                      rgba(0, 0, 0, .2),
                                      rgba(0, 0, 0, .2) 30%,
                                      rgba(0, 0, 0, 0));
    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
                inset -2px -2px 3px rgba(0, 0, 0, .6);
}

.styled2:hover {
    background-color: lightblue ;
}

.styled2:active {
    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
                inset 2px 2px 3px rgba(0, 0, 0, .6); }       
                
}
</style>