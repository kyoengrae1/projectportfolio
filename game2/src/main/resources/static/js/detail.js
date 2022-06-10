/*var init = function(){
	$.ajax({
		type:"get",
		url:"/replies/getList/"+${board.id},
		dataType:"JSON",
		contentType:"application/json;charset=utf-8",
	})
	.done(function(resp){
		var str = "<table class='table table-hover mt-3'>";
		$.each(resp,function(key,val){
			str += "<tr>"
			str += "<td>" + val.writer + "</td>"
			str += "<td>" + val.content + "</td>"
			str += "<td>" + val.regdate + "</td>"
			
			if("${principal.user.username}"==val.writer){
				str+= "<td><a href='javascript:fdel("+val.id+")'>삭제</a></td>"
			}
			
			str += "</tr>"
		})
		str += "</table>"
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
		location.href="/board/list?pageNum=${pageNum}&field=${field}&word=${word}"
	}
});

init();
*/