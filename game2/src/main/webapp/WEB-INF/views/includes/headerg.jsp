<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>4조</title>
	<meta charset="UTF-8">
	<meta name="description" content="EndGam Gaming Magazine Template">
	<meta name="keywords" content="endGam,gGaming, magazine, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="/css/slicknav.min.css"/>
	<link rel="stylesheet" href="/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="/css/magnific-popup.css"/>
	<link rel="stylesheet" href="/css/animate.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="/css/style.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="header-warp">
			<div class="header-social d-flex justify-content-end">
				<p>Follow us:</p>
				<a href="#"><i class="fa fa-pinterest"></i></a>
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-dribbble"></i></a>
				<a href="#"><i class="fa fa-behance"></i></a>
			</div>
			<div class="header-bar-warp d-flex">
				<!-- site logo -->
				<a href="/index" class="site-logo">
					<img src="../img/logo.png" alt="">
				</a>
				
				<nav class="top-nav-area w-100">
					<div class="user-panel">
					<sec:authorize access="isAnonymous()">
						<a href="/login"><img src="/img/login.png" width="40" height="40" class="">Login</a> / <a href="/join"><img src="/img/signup.png" width="40" height="40" class="">Sign Up</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
					<a href="/user/cartList"><img src="/img/cart.png" width="40" height="40" class=""></a> /
					 <a href="/user/detail"><img src="/img/human.png" width="35" height="35" class=""></a> /
					 <a href="/user/mygame"><img src="/img/mygame.png" width="35" height="35" class="">Mygame</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/admin/ulist"><img src="/img/users.png" width="40" height="40" class="">users</a>	/
						<a href="/game/register"><img src="/img/gameregister.png" width="40" height="40" class="">GamRegister</a>	
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
							/ <a href="/logout"><img src="/img/logout.png" width="38" height="38" class="">(${principal.user.username})</a>
					</sec:authorize>
					</div>
					<!-- Menu -->
					<ul class="main-menu primary-menu">
						<li><a href="/index">Home</a></li>
						<li><a href="/board/list">community</a></li>
						<li><a href="/game/glist">Game</a></li>
						
			
				
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header section end -->
	<section class="games-single-page">
<!-- Page top section -->
	<section class="page-top-section set-bg" data-setbg="/img/page-top-bg/1.jpg">
		<div class="page-info">
			<h2>Games</h2>
			<div class="site-breadcrumb">
				<a href="">Home</a>  /
				<span>Game</span>
			</div>
		</div>
	</section>