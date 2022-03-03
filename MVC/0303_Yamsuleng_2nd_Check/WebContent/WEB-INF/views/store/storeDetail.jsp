<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<style>
   .col-md-8 {
      margin:0 auto;
      width:50%;
}
</style>

<!-- Begin Article
================================================== -->
<div class="container">
   <div class="row">
      <!-- Begin Post -->
      <div class="col-md-8 col-md-offset-2 col-xs-12">
         <div class="mainheading">
            <!-- Begin Top Meta -->
            <h1 class="posttitle">
	            <tr> 
	               <th scope="row">${store.NAME}</th> 
	               
	            </tr>  
            </h1>
         </div>

         <!-- Begin Featured Image -->
         <img class="featured-image img-fluid" src="/img/demopic/10.jpg" alt="">
         <!-- End Featured Image -->

         <!-- Begin Post Content -->
      
         <div class="article-post">
		      <tbody> 
				 <div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="ADDRESS" value="${store.ADDRESS}">
					</div>
				</div>
 
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">음식분류</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="MENU_CAT" value="${store.MENU_CAT}">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">별점</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="TOTAL_RATE" value="${store.TOTAL_RATE}">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">주요시설</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="FACILITY" value="${store.FACILITY}">
					</div>
				</div>
				<!-- 
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">메뉴.. 후에 추가</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="MENU" value="">
					</div>
				</div>
				 -->
		      </tbody>
      
      <!-- End Post Content -->
      <!-- End Post -->

         </div>
      </div>
	</div>
</div>
      
<!-- End Article
================================================== -->

<div class="hideshare"></div>

<!-- 디테일 하단 다른 리뷰글들 리스트
================================================== -->
<div class="graybg">
   <div class="container">
      <div class="row listrecent listrelated">

         <!-- begin post --><!-- 
      <c:forEach items="${store}" var="post">
         <div class="col-md-4">
            <div class="card">
               <a href="post.html">
               <img class="img-fluid img-thumb" src="/img/demopic/9.jpg" alt="">
               </a>
               <div class="card-block">
                  <h2 class="card-title">title<a href="detail">${store.ID}</a></h2>
                  <div class="metafooter">
                     <div class="wrapfooter">
                        <span class="meta-footer-thumb">
                        <a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
                        </span>
                        <span class="author-meta">
                        <span class="post-name">writer<a href="author.html">${store.ID}</a></span><br/>
                        </span>
                        <span class="post-read-more"><a href="post.html" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </c:forEach> -->
         <!-- end post -->


      </div>
   </div>
</div>

<!-- End Related Posts
================================================== -->


	

