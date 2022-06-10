<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="includes/header2.jsp" %>

	<!-- Hero section -->
	<section class="hero-section overflow-hidden">
		<div class="hero-slider owl-carousel">
			<div class="hero-item set-bg d-flex align-items-center justify-content-center text-center" data-setbg="img/slider-bg-1.jpg">
				<div class="container">
					<h2>Game</h2>
					<p>원하시는 게임을 찾아보세요~</p>
					<a href="/game/glist" class="site-btn">Read More  <img src="img/icons/double-arrow.png" alt="#"/></a>
				</div>
			</div>
			<div class="hero-item set-bg d-flex align-items-center justify-content-center text-center" data-setbg="img/slider-bg-2.jpg">
				<div class="container">
					<h2>Community</h2>
					<p>유저들과 소통하는 게시판입니다.</p>
					<a href="/board/list" class="site-btn">Read More  <img src="img/icons/double-arrow.png" alt="#"/></a>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero section end-->

	<!-- Blog section -->
	<section class="blog-section spad">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 col-lg-8 col-md-7">
					<div class="section-title text-white">
						<h2>Latest News</h2>
					</div>
					<ul class="blog-filter">
						<li><a href="#">Racing</a></li>
						<li><a href="#">Shooters</a></li>
						<li><a href="#">Strategy</a></li>
						<li><a href="#">Online</a></li>
					</ul>
					<!-- Blog item -->
					<div class="blog-item">
						<div class="blog-thumb">
							<img src="./img/blog/1.jpg" alt="">
						</div>
						<div class="blog-text text-box text-white">
							<div class="top-meta">11.11.18  /  in <a href="">Games</a></div>
							<h3>The best online game is out now!</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius-mod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet, consecte-tur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.....</p>
							<a href="#" class="read-more">Read More  <img src="img/icons/double-arrow.png" alt="#"/></a>
						</div>
					</div>
					<!-- Blog item -->
					<div class="blog-item">
						<div class="blog-thumb">
							<img src="./img/blog/2.jpg" alt="">
						</div>
						<div class="blog-text text-box text-white">
							<div class="top-meta">11.11.18  /  in <a href="">Games</a></div>
							<h3>The best online game is out now!</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius-mod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet, consecte-tur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.....</p>
							<a href="#" class="read-more">Read More  <img src="img/icons/double-arrow.png" alt="#"/></a>
						</div>
					</div>
					<!-- Blog item -->
					<div class="blog-item">
						<div class="blog-thumb">
							<img src="./img/blog/3.jpg" alt="">
						</div>
						<div class="blog-text text-box text-white">
							<div class="top-meta">11.11.18  /  in <a href="">Games</a></div>
							<h3>The best online game is out now!</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius-mod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Lorem ipsum dolor sit amet, consecte-tur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.....</p>
							<a href="#" class="read-more">Read More  <img src="img/icons/double-arrow.png" alt="#"/></a>
						</div>
					</div>
				</div>
				
				
				
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="categories-widget" >
							<a href="https://eldenring.bn-ent.net/kr/"><img src="img/elden.png" height="400" ></a>
							</div>
							<div class="categories-widget" >
							<img src="img/red.png" height="400">
							</div>
						</div>
					</div>
					
					
					
				</div>
				
				
			
				
				
			</div>
		</div>
	</section>
	<!-- Blog section end -->


	
<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
			<div class="footer-left-pic">
				<img src="../img/footer-left-pic.png" alt="">
			</div>
			<div class="footer-right-pic">
				<img src="../img/footer-right-pic.png" alt="">
			</div>
			<a href="#" class="footer-logo">
				<img src="./img/logo.png" alt="">
			</a>
			<ul class="main-menu footer-menu">
				<li><a href="">Home</a></li>
				<li><a href="">Games</a></li>
				<li><a href="">Reviews</a></li>
				<li><a href="">News</a></li>
				<li><a href="">Contact</a></li>
			</ul>
			<div class="footer-social d-flex justify-content-center">
				<a href="#"><i class="fa fa-pinterest"></i></a>
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-dribbble"></i></a>
				<a href="#"><i class="fa fa-behance"></i></a>
			</div>
			<div class="copyright"><a href="">Colorlib</a> 2018 @ All rights reserved</div>
		</div>
	</footer>
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.slicknav.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.sticky-sidebar.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/main.js"></script>

	</body>
</html>   



