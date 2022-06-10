<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<link rel="stylesheet" href="/css/login.css"/>
<div class="header-bar-warp d-flex">
				<!-- site logo -->
				<a href="/index" class="site-logo">
					<img src="../img/logo.png" alt="">
				</a>
				
 <div class="content">
	<div class="text">Login </div>
	<form action="/loginProc" method="post">

		<div class="field">
		<span class="fa fa-user"></span>
			<label for="username"></label> 
			<input type="text" class="form-control"
				id="username" placeholder="ID" name="username" required>
		</div>
		<div class="field">
		<span class="fa fa-lock"></span>
			<label for="pass"></label> <input type="password"
				class="form-control" id="password" placeholder="Password"
				name="password">
		</div>
		<center><button type="submit" class="btn btn-primary btn-sm" id="btnLogin">Log in</button></center>
	<div class="or">Or</div>
<!--social icon -->
   <div class="icon-button"> 
      <span class="facebook"><i class="fa fa-facebook"></i>  Facebook</span>
      <span><i class="fa fa-google"></i>  Google</span>
   </div>
   
   
	</form>
</div>
<!-- <script type="text/javascript" src="../js/member.js"></script> -->
