<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="/css/join.css"/>
<div class="header-bar-warp d-flex">
				<!-- site logo -->
				<a href="/index" class="site-logo">
					<img src="../img/logo.png" alt="">
				</a>
				
<div class="content">
	<h2>회원가입</h2>
	
	<form action="#" method="post">
		<div class="field">
		<span class="fa fa-user"></span>
			<label for="username"></label> 
			<input type="text" class="form-control"
				id="username" placeholder="아이디:" name="username" required>
				<div class="col align-self-end">
				
			</div>
			
			<button type="button" class="btn btn-primary" id="btnIdCheck">중복확인</button>
			</div>
		
			
	
		<div class="field">
		<span class="fa fa-lock"></span>
			<label for="pass"></label> <input type="password"
				class="form-control" id="password" placeholder="비밀번호"
				name="password">
		</div>		
		<div class="field">
		<span class="fa fa-lock"></span>
			<label for="pass"></label> <input type="password"
				class="form-control" id="pass_check" placeholder="비밀번호 확인"
				name="pass_check">
		</div>
		<div class="field">
			<label for="email"></label> <input type="text" class="form-control"
				id="email" placeholder="email" name="email">
		</div>
		<div class="field">
			<label for="tel"></label> <input type="text" class="form-control"
				id="tel" placeholder="휴대폰번호를 입력하세요" name="tel">
		</div>
		<div class="field">
			<label for="address"></label> <input type="text" class="form-control"
				id="address" placeholder="주소를 입력하세요" name="address">
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="btnJoin">회원가입</button>
	</form>
	</div>
</div>

<script type="text/javascript" src="../js/user.js"></script>

<style>
.content h2{
   color:white;
}
</style>

