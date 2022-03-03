<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<style>
   .col-md-8 {
      margin:0 auto;
      width:50%;
}
.jg{font-family: 'Jeju Gothic', sans-serif;}
</style>
<!-- Begin Article
================================================== -->
<div class="container">
   <div class="row">
   
      <!-- Begin Post -->
      <div class="col-md-8 col-md-offset-2 col-xs-12">
         <div class="mainheading">

            <!-- Begin Top Meta -->
            <div class="row post-top-meta">
               <div class="col-md-2">
                  <a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
               </div>
               <div class="col-md-10">
                  <a class="link-dark" href="author.html">${postD.USER_ID}</a>
               </div>
            </div>
        <div style="width:450px; margin:auto; background:white">
  <form id = "frmPost" method="post" >          

            
            <p class="jg"> 게시글 수정하기 </p>

            </h1>
         </div>

         <!-- Begin Featured Image -->
         <img class="featured-image img-fluid" src="/img/demopic/10.jpg" alt="">
         <!-- End Featured Image -->            
  
                <fieldset>
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">글번호</label>
					  <input name="id" type="text" class="form-control" value="${postD.POSTID}" readonly>
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">제목</label>
					  <input name="title" type="text" class="form-control" id="title" value="${postD.TITLE}">
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
					  <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="10">${postD.CONTENT}</textarea>
					</div>
                    <p>
                         <label for="row">별점</label>
                         <select name="star_rate" id="star"> 
                             <option value="1">⭐</option>
                             <option value="2">⭐⭐</option>
                             <option value="3">⭐⭐⭐</option>
                             <option value="4">⭐⭐⭐⭐</option>
                             <option value="5" selected>⭐⭐⭐⭐⭐</option>
                         </select>
                    </p>

         <div class="btn-group" role="group" aria-label="Basic outlined example">
        	<input id="btnBack" type="button" value="돌아가기" class="btn btn-outline-primary">
			<input id="btnUpdate" type="button" value="수정" class="btn btn-outline-primary">
			<input id="btnDelete" type="button" value="삭제" class="btn btn-outline-primary">
         
<!--            <button type="button" onclick="location.href='list'" class="btn btn-outline-primary">수정취소</button>
           <button type="button" onclick="location.href='list'" class="btn btn-outline-primary">수정</button>
           <button type="button" onclick="location.href='delete'" class="btn btn-outline-primary">삭제하기</button> -->
         </div>
                </fieldset>
   		   </form>  


 <div class="hideshare"></div>
 
      	</div>
   		</div>
       
	</div>
</div>

<!-- End Related Posts
================================================== -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$("select option[value='${postD.STAR_RATE}']").prop('selected', true);

	$("#btnUpdate").on("click", function() {
		if (confirm("정말 수정하시겠습니까?")) {
		$("#frmPost").attr("action", "updatePost");
		$("#frmPost").submit();
		};
	});


	$("#btnDelete").on("click", function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			$("#frmPost").attr("action", "deletePost");
			$("#frmPost").submit();
		};
	});
	
	$("#btnBack").on("click", function() {
		history.back();
	});
</script>

