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
                  <a class="link-dark" href="author.html">${account.user_id}</a>
               </div>
            </div>
        <div style="width:450px; margin:auto; background:white">
            <form method="post" id = "detailForm"> 

            
            <p class="jg"> 게시글 수정하기 </p>

            </h1>
         </div>

         <!-- Begin Featured Image -->
         <img class="featured-image img-fluid" src="/img/demopic/10.jpg" alt="">
         <!-- End Featured Image -->            
            
                <fieldset>

					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">title</label>
					  <input type="text" class="form-control" id="title">
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">content</label>
					  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
                    <p>
                         <label for="row">star</label>
                         <select name="star" id="star">
                             <option value="" disabled>=== 선택 ===</option>
                             <option value="1">⭐</option>
                             <option value="2">⭐⭐</option>
                             <option value="3">⭐⭐⭐</option>
                             <option value="4">⭐⭐⭐⭐</option>
                             <option value="5" selected>⭐⭐⭐⭐⭐</option>
                         </select>
                    </p>

         <div class="btn-group" role="group" aria-label="Basic outlined example">
         <!-- 나중에 경로 수정하기 -->
           <button type="button" onclick="location.href='list'" class="btn btn-outline-primary">수정취소</button>
           <button type="button" onclick="location.href='list'" class="btn btn-outline-primary">수정</button>
           <button type="button" onclick="location.href='delete'" class="btn btn-outline-primary">삭제하기</button>
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
                $(function(){
                    $('#listBtn').click(function(){
                        location="detail?id=" + {{detail_info.4}};
                    });

                    $('#delBtn').click(function(){
                        if(confirm('정말 삭제 하겠습니까?')){
                            $('#detailForm').attr('action','delete').submit();
                        }
                    });

                    $('#modBtn').click(function(){
                        $('#detailForm').attr('action','modify').submit();
                    });
                });

            </script>


