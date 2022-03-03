<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <div style="width:450px; margin:auto; background:white">
 
            
            <h2><p class="jg"> 게시글 작성하기 </p></h2>

            </h1>
         </div>

         <!-- Begin Featured Image -->
         <img class="featured-image img-fluid" src="/img/demopic/10.jpg" alt="">
         <!-- End Featured Image -->            
         	<form id="frmAction" method="post">  
                <fieldset>
					 <input type="hidden" name="accId_fk" value="${sessionScope.sessionID}">
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">제목</label>
					  <input name="title" type="text" class="form-control" id="title">
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
					  <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
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
		<!-- 돌아가기 버튼 필요시 -->
		<!-- <input id="btnBack" type="button" value="돌아가기" class="btn btn-outline-primary"> -->
		<button type="button" onclick="location.href='/yamsuleng/post/list?searchKeyWord='" class="btn btn-outline-primary">목록</button>
		<input type="reset" value="초기화"  class="btn btn-outline-primary">
		<input id="btnAdd" type="button" value="게시" class="btn btn-outline-primary">
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
	$("select option[value='${post.star_rate}']").prop('selected', true);
	
/* 	돌아가기버튼 필요시
	$("#btnBack").on("click", function() {
		history.back();
	}); */
	
	$("#btnAdd").on("click", function() {
		if (confirm("글을 등록하시겠습니까?")) {
			$("#frmAction").attr("action", "/yamsuleng/post/insertPost");
			$("#frmAction").submit();
		};
	});
	
	
/* 	$("#btnAdd").on("click", function() {
		$("#frmAction").attr("action", "/yamsuleng/post/insertPost");
		$("#frmAction").submit();
	}); */

</script>

