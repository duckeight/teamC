<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            			<form id = "frmPost" method="post" >
            <div class="row post-top-meta">
               <div class="col-md-2">
                  <a href="/yamsuleng/userPage/userTemplate?pageOwnerId=${postD.ACCID}">
                  <img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal">
                  </a>
               </div>
               <div class="col-md-10">
                  <h3><a class="link-dark" href="/yamsuleng/userPage/userTemplate?pageOwnerId=${postD.ACCID}">${postD.USER_ID}</a></h3> 
               </div>
            </div>
            <!-- End Top Menta -->
            

				<input type="hidden" name="postID" type="text" class="form-control" value="${postD.POSTID}" >
            <h2 class="posttitle">
	            <tr> 
	               <th scope="row"></th> 
	               <td colspan="3"> 제목 : ${postD.TITLE}</td> 
	            </tr>  
            </h2>
            
         </div>

         <!-- Begin Featured Image -->
         <img class="featured-image img-fluid" src="/img/demopic/10.jpg" alt="">
         <!-- End Featured Image -->

         <!-- Begin Post Content -->
       <div class="article-post">
      	<tbody> 
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label" >내용</label>
				<textarea name="content" class="form-control" readonly id="exampleFormControlTextarea1"  rows="10" >${postD.CONTENT}</textarea>
			</div>	  
		  	<div class="mb-3 row">
				<label for="exampleFormControlTextarea1" class="form-label">별점 </label>
		    	<input type="text" readonly class="form-control-plaintext" id="star_rate" value="${postD.STAR_RATE}">
		  	</div>
      </tbody>
      
         <div class="btn-group" role="group" aria-label="Basic outlined example">
<!--           <button type="button" onclick="location.href='write'" class="btn btn-outline-primary">글쓰러가기</button> -->
        	   <button data-action="list" class="btn btn-outline-primary">목록</button>
			
			<c:set var="accID" value="${postD.ACCID}" scope="page"/>
			<c:set var="sessionID" value="${sessionScope.sessionID}" scope="page"/> 
			<c:if test="${sessionID==accID}">
     	      <button data-action="modify" class="btn btn-outline-primary">수정</button>
   		      <button data-action="delete" class="btn btn-outline-primary">삭제</button>
			 </c:if>
           
         </div>
      <!-- End Post Content -->
      <!-- End Post -->

         </div>
      </div>
	</div>
</form>

<form id="frmAction">
	<input id="postIdInput" type="hidden" name="postID" value="${postD.POSTID}">
	<input id="pageNo" type="hidden" name="pageNo" value="${pageNavInfo.pageNo}">
	<input type="hidden" name="amount" value="${pageNavInfo.amount}">
	<input type="hidden" name="searchKeyWord" value="${pageNavInfo.searchKeyWord}">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	let frmAction = $("#frmAction");
	let frmPost = $("#frmPost")
	
	$("button[data-action='list']").on("click", function(e) {
		e.preventDefault();

		frmAction.attr("action", "list");
		frmAction.attr("method", "get");
		frmAction.submit();
	});
	
	$("button[data-action='modify']").on("click", function(e) {
		e.preventDefault();	
		
		frmAction.attr("action", "updateForm");
		frmAction.attr("method", "get");
		frmAction.submit();
	});
	
	$("button[data-action='delete']").on("click", function(e) {
		e.preventDefault();	
		
		if (confirm("정말 삭제하시겠습니까?")) {
			frmPost.attr("action", "deletePost");
			frmPost.submit();
		};
	});

});
</script>

</div>
      
<!-- End Article
================================================== -->

<div class="hideshare"></div>
 


