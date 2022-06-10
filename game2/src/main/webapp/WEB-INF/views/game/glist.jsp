<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../includes/headerg.jsp" %>
 


<section class="games-section">
   <div class="content">

   

   <div id="carouselExampleControls" class="carousel slide container mt-4" data-ride="carousel">

      <div class="carousel-inner">

        <div class="carousel-item active">

          <img src="/resource/upload/game/${lists.content[0].gameAttachs[0].savefolder}/${lists.content[0].gameAttachs[0].savefile}" width="800" height="500" class="d-block w-100" onerror="this.src='/img/gamerepl.png'">

        </div>
		
		<c:forEach begin="1" end="4" var="i">
        <div class="carousel-item">

          <img src="/resource/upload/game/${lists.content[i].gameAttachs[0].savefolder}/${lists.content[i].gameAttachs[0].savefile}" width="800" height="500" class="d-block w-100" onerror="this.src='/img/gamerepl.png'">

        </div>
		</c:forEach>

      </div>

      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">

        <span class="carousel-control-prev-icon" aria-hidden="true"></span>

        <span class="sr-only">Previous</span>

      </a>

      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">

        <span class="carousel-control-next-icon" aria-hidden="true"></span>

        <span class="sr-only">Next</span>

      </a>

    </div>

 

</div>

<br>
 

      
         <div class="row">

            <div class="col-xl-7 col-lg-8 col-md-7">

               <div class="row">
	
                  <%-- c:foreach --%>
<c:forEach items="${lists.content}" var="game">
                  <div class="col-lg-4 col-md-6">
				  
                     <div class="game-item">

                        <img height="180" width="240" src="/resource/upload/game/${game.gameAttachs[0].savefolder}/${game.gameAttachs[0].savefile}"  onerror="this.src='/img/gamerepl.png'">

                        <h5>${game.gname}</h5>

                        <a href="/game/detail?id=${game.id}" class="read-more">Read More  <img src="../img/icons/double-arrow.png" alt="#"/></a>

                     </div>

                  </div>
</c:forEach>
               </div>

               <%-- 페이징 --%>

               <div class="d-flex justify-content-between mt-3">
				<ul class="pagination">
					<!-- 이전 -->
					<c:if test="${prev==true}">
						<li class="page-item"><a class="page-link"
							href="?page=${startPage-blockSize}&category=${category}&field=${field}&keyword=${keyword}"  style="color: purple;">이전</a></li>
					</c:if>
					<!--페이지 리스트-->
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<li class="page-item"><a class="page-link"
							href="?page=${i}&category=${category}&field=${field}&keyword=${keyword}"  style="color: purple;">${i+1}</a></li>
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${next==true}">
						<li class="page-item"><a class="page-link"
							href="?page=${endPage+1}&category=${category}&field=${field}&keyword=${keyword}"  style="color: purple;">다음</a></li>
					</c:if>
				</ul>
				
				
				<form class="form-inline" action="/game/glist" id="searchFrm" method="get">
					<input type="text" name="category" value="${category}" hidden="">
					<select name="field" class="form-control mb-2 mr-sm-2">
						<option value="" disabled selected>--</option>
						<option value="gname" ${field=='gname' ? 'selected':''}>게임이름</option>
						<option value="developer" ${field=='developer' ? 'selected':''}>제작사</option>
						<option value="gd" ${field=='gd' ? 'selected':''}>게임이름or제작사</option>
						<option value="price" ${field=='price' ? 'selected':''}>가격(이하)</option>
					</select> <input type="text" class="form-control mb-2 mr-sm-2"
						placeholder="Enter Search" value="${keyword}" name="keyword">
					<button type="submit" class="btn btn-secondary mb-2 btn-sm">Search</button>
				</form>
			</div>
		</div>

            

            <div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">

               <div id="stickySidebar">

                  <div class="widget-item">

                     <div class="categories-widget">

                        <h4 class="widget-title">categories</h4>
						
                        <ul>
						<c:forEach items="${cats}" var="category">
                           <li><a href="/game/glist?category=${category}">${category}</a></li>
						</c:forEach>
                        </ul>
						
                     </div>

                  </div>

               </div>

            </div>

         </div>
</section>
      


<%@ include file="../includes/footer.jsp" %>

<style>
.games-section{

	margin-left: 10%;

}

.categories-widget{
	margin-left: 50%;
}
</style>
 

 
