<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>
<div class="container">
  <h3>내 게임목록</h3>

         <div class="row">

            <div class="col-xl">

               <div class="row">
			<c:forEach items="${lists}" var="mygame">
                  <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
				  
                     <div class="game-item">

                        <img height="180" width="240" src="/resource/upload/game/${mygame.game.gameAttachs[0].savefolder}/${mygame.game.gameAttachs[0].savefile}"  onerror="this.src='/img/gamerepl.png'">

                        <h5>${mygame.game.gname}</h5>
	
                     </div>

                  </div>
			</c:forEach>
</div>
</div>
</div>
</div>

<%@ include file="../includes/footer.jsp" %>