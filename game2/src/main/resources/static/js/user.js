/**
 *
 */
 

 //스크립트에서는 id(#)으로, 자바로 보내줄 때는 name으로
 $(document).ready(function(){
	// var exp = /^[0-9]{3}[0-9]{4}[0-9]{4}$/  // 전화번호 형식
	$("#btnJoin").click(function(){
		//유효성 검사
		//아이디 입력검사
		if($("#username").val()==""){
			alert("아이디를 입력하세요");
			$("#username").focus();
			//false로 벗어나기
			return false;
		}
		//비밀번호 입력검사
		if($("#password").val()==""){
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
		}
		//비밀번호 확인 검사
		if($("#pass_check").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pass_check").focus();
			return false;
		}
		//비밀번호 일치 검사
		if($("#password").val()!=$("#pass_check").val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#pass_check").focus();
			return false;
		}
		//이메일 입력검사
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		if($("#tel").val()==""){
			alert("tel를 입력하세요");
			$("#tel").focus();
			return false;
		}
		if($("#address").val()==""){
			alert("address를 입력하세요");
			$("#address").focus();
			return false;
		}
		//json
		//join폼에서 데이터를 받아서
		var data={
			"username":$("#username").val(),
			"password":$("#password").val(),
			"email":$("#email").val(),
			"address":$("#address").val(),
			"tel":$("#tel").val()
		}
		
		//ajax를 통해서 Controller로 요청
		$.ajax({
			type:"post",
			url:"/join",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data)
		})
		//ajax가 성공적으로 이루어 졌다면, @ResponseBody때문에 여기로 리턴
		//@ResponseBody에 출력된 결과를 res로 전달됨(success or fail)
		.done(function(res){
			if(res=="success"){
				alert("회원가입을 축하합니다");
				location.href="/login"
			
			}else if(res=="fail"){
				alert("아이디 중복확인을 하세요");
				$("#username").val("");
			}
		})
		//.fail(function()) -> ajax가 실패했다면
		//$("#frm").submit();
		
	});
	
	
	$("#btnLogin").click(function(){
		
		$.ajax({
			type:"post",
			url:"/login",
			data:{
				"username":$("#username").val(),
				"password":$("#password").val()
			}
		}).done(function(resp){
			if(resp=="no"){
				alert("회원이 아닙니다. 회원가입하세요");
				location.href="/join"
			}else if(resp=="success"){
				alert("로그인 성공");
				location.href="/board/list"
			}else{
				alert("비밀번호를 확인하세요");
			}
		})
		
	});
	
	$("#btnIdCheck").click(function(){
		if($("#username").val()==""){
				alert("아이디를 입력하세요");
				return;
			}
		$.ajax({
			type:"post",
			url:"/idCheck",
			data:{"username":$("#username").val()}
		}).done(function(respo){
			if(respo.trim()=="true"){
				alert("사용가능한 아이디입니다");
				$(opener.document).find("#username").val($("#username").val());
				self.close();
			}else if(respo=="false"){
				alert("이미 사용 중인 아이디입니다.")	;
				$("#username").val("");
				$("#username").focus();
			}
		})
	});

	
});