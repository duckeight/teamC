<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- Begin Site Title
================================================== -->
<div class="container">
	<div class="mainheading">
		<h1 class="sitetitle">Yamsuleng</h1>
		<p class="lead">
			최강 C팀이 만들어낼 최고의 맛집 추천 사이트
		</p>
	</div>
<!-- End Site Title
================================================== -->
<c:choose>

	<c:when test="${sessionScope.sessionID == null}">
		<div class="section-title">
			<h3><span>로그인하시면 내게 맞는 추천 맛집 리스트를 볼 수 있습니다 ^-^☆</span></h3>
		</div> 
	</c:when>
	
	<c:when test="${sessionScope.sessionID != null}">

		<!-- Begin 사용자맞춤추천
		================================================== -->
		<section class="featured-posts">
		<div class="section-title">
			<h2><span>${sessionScope.sessionName }님을 위한 추천 식당</span></h2>
		</div>
		
		
		<div class="card-columns listfeaturedtag">
		<c:forEach var="i" items="${ storeList }">
			<!-- begin post -->
			<div class="card">
				<div class="row">
					<div class="col-md-5 wrapthumbnail">
						<a href="#" onclick="post_url()">
						<!-- 썸네일자리  -->
							<div class="thumbnail" style="background-image:url(/img/demopic/1.jpg);">
							</div>
						</a>
					</div>
					<div class="col-md-7">
						<div class="card-block">
							<!-- 상호명 넣기 -->
							<h2 class="card-title"><a href="#" onclick="post_url()">상호명</a></h2>
							<!-- 가게소개...? -->
							<h4 class="card-text">식당뭐...뭐쓰냐여기</h4>
							<!-- 기타정보 자리 -->
							<div class="metafooter">
								<div class="wrapfooter">
								<!-- 별점넣기? -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<form id="urlForm" method="post" action="/yamsuleng/store/detail" >
				<input type="hidden" name="url" id="url" value="${i.url}">
			</form>
			<!-- end post -->
			<script>
				function post_url() {
					document.getElementById('urlForm').submit();
					//document.getElementByClassName('urlForm').submit();
				}
			</script>
		</c:forEach>
		
	
		</div>
		</section>
		<!-- End 사용자맞춤추천
		================================================== -->
	</c:when>
</c:choose>
	

	<!-- Begin List Posts
	================================================== -->
	<section class="recent-posts">
	<div class="section-title">
		<h2><span>최근 게시글 5</span></h2>
	</div>
	<div class="card-columns listrecent">
	
		<c:forEach var="post" items="${ postList }">
		<!-- begin post -->
		<div class="card">
			<a href="post.html">
				<img class="img-fluid" src="/img/demopic/5.jpg" alt="">
			</a>
			<div class="card-block">
				<h2 class="card-title"><a href="/yamsuleng/post/detail?postID=${post.POSTID}">${post.TITLE }</a></h2>
				<h4 class="card-text">${post.CONTENT}</h4>
				<div class="metafooter">
					<div class="wrapfooter">
						<span class="meta-footer-thumb">
						<a href="#"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
						</span>
						<span class="author-meta">
						<span class="post-name">${post.USER_ID}<a href="#"></a></span><br/>
						<span class="post-date"><fmt:formatDate value="${post.REGISTER_DATE}" pattern="yyyy-MM-dd"/></span>
						</span>
						<span class="post-read-more"><a href="#" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	
		<!-- end post -->


	</div>
	</section>
	<!-- End List Posts
	================================================== -->



</div>
<!-- /.container -->

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
