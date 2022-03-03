<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="graybg authorpage">
	<div class="container">
		<div class="listrecent listrelated">
			
			<c:forEach items="${storeList}" var="store">
				<!-- begin post -->
				<div class="authorpostbox">
					<div class="card">
						<a href="author.html">
						<img class="img-fluid img-thumb" src="/img/demopic/8.jpg" alt="">
						</a>
						<div class="card-block">
							<h2 class="card-title"><a href="/yamsuleng/store/detail?id=${store.ID}">${store.NAME}</a></h2>
							<h4 class="card-text">${store.TOTAL_RATE}</h4>
							<h4 class="card-text">${store.MENU_CAT}</h4>
							<!-- 
							<div class="metafooter">
								<div class="wrapfooter">
								<span class="meta-footer-thumb">
								<a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a>
								</span>
								<span class="author-meta">
								<span class="post-name"><a href="author.html">Sal</a></span><br/>
								<span class="post-date">22 July 2017</span><span class="dot"></span><span class="post-read">6 min read</span>
								</span>
								<span class="post-read-more"><a href="post.html" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span>
								</div>
							</div>
							 -->
						</div>
					</div>
				</div>
				<!-- end post -->
			</c:forEach>  
		</div>
	</div>
	
	<!-- 검색결과 X -->
	<c:if test="${fn:length(storeList) == 0}">
		<h1>검색어에 해당하는 결과가 없습니다.</h1>
	</c:if>
	<!-- Start Pagination
	================================================== -->
	<form id="frmAction" method="Get" action="/yamsuleng/store/list">
		<input type="hidden" id="pageNo" name="pageNo" value="${pageNavInfo.pageNo}">
		<input type="hidden" name="amount" value="${pageNavInfo.amount}">
		<input type="hidden"  name='searchKeyWord' value="${pageNavInfo.searchKeyWord}">
	</form>
	
	<div class="fa-pull-center" style="width: 200px; margin: 0 auto;">
		<ul class="pagination">
			<c:if test="${pageNavInfo.prev}">
				<li><a class="page-link" href="${pageNavInfo.startPage - 1}">Prev</a></li>
			</c:if>
			<c:forEach var="pageNum" begin="${pageNavInfo.startPage}" end="${pageNavInfo.endPage}">
				<li><a class="page-link" href="${pageNum}">${pageNum}</a></li>
			</c:forEach>
			<c:if test="${pageNavInfo.next}">
				<li><a class="page-link" href="${pageNavInfo.endPage + 1}">Next</a></li>
			</c:if>
		</ul>
	</div>
	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function() {

	$(".page-link").on("click", function(e) {
		e.preventDefault();
		$("#pageNo").val($(this).attr("href"));
		$("#frmAction").submit();	
	});

});
</script>
