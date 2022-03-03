<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
#topMenu {
	width: 900px;
	height: 500px;
	display: inline;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 15px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}
</style>



<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 col-md-offset-2">
			<div class="mainheading">
				<div class="row post-top-meta authorpage">
					<div class="col-md-10 col-xs-12">
						<div class="col-md-10">
							<img class="author-thumb"
								src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x"
								alt="Sal">
							<h1 style="display: inline;">${accVO.user_id}</h1>

							<form id="followFrm" action="clkFollowBtn" method="post">
								<input type="hidden" name="pageOwnerId" value="${accVO.id}"> 
								<input type="hidden" name="loginId" value="${sessionScope.sessionID}">
								<input type="hidden" name="flag" value="${flag}">
							</form>

							<c:choose>
								<c:when test="${isOwner == 'Y'}">
									<a href="/yamsuleng/account/mypage" class="btn follow">내정보수정</a>
								</c:when>

								<c:when test="${isOwner == 'N'}">
									<!-- 남의 페이지면 팔로우버튼  -->
									<!-- 팔로우하고있으면 ing로 변경..? -->
									<c:if test="${flag == '1'}">
										<a href="#"
											onclick="document.getElementById('followFrm').submit();"
											class="btn follow"> 팔로우취소</a>
									</c:if>
									<c:if test="${flag == 0}">
										<a href="#"
											onclick="document.getElementById('followFrm').submit();"
											class="btn follow"> 팔로우하기</a>
									</c:if>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- ======== 가로메뉴바 시작=============================== -->
<!-- End Top Menta -->
<div class="container">

	<div class="listrecent listrelated" id="topMenu">

		<div>
			<ul>
				<c:if test="${isOwner == 'Y'}">
					<li class=tab><a class="menuLink tab" data-url="myPost"
						data-tab="myFeed">내 피드 글</a></li>
					<li>|</li>
				</c:if>

				<!-- <li data-tab="test" id="default"><a class="menuLink" href="/yamsuleng/myPage/test">내가 쓴 게시글</a></li> -->
				<li class=tab><a class="menuLink tab" data-url="myPost"
					data-tab="myPost" id="default">${accVO.user_id}님의 리뷰</a></li>

				<!--
					<li class=tab>
						<a class="menuLink" data-tab="/yamsuleng/account/mypage" href="#">내 정보보기</a>
					</li>  
				-->
				<li>|</li>
				<li class=tab><a class="menuLink" data-url="follow"
					data-tab="following">팔로잉</a></li>
				<li>|</li>
				<li class=tab><a class="menuLink" data-url="follow"
					data-tab="follower">팔로워</a></li>
			</ul>
		</div>
		<br>

		<hr>
		<div id="tabcontent"></div>
	</div>
</div>

<!-- <div id="tabcontent"></div> -->



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		// tab operation
		$('.menuLink').click(function() {
			var activeUrl = $(this).attr('data-url');
			var activeTab = $(this).attr('data-tab');
			var accId = '${accVO.id}';
			var isOwner = '${isOwner}';
			console.log(accId);
			$('li .tab').css('background-color', 'black');
			$(this).css('background-color', 'green');
			$.ajax({
				type : 'GET', //get방식으로 통신 
				url : activeUrl, //탭의 data-tab속성의 값으로 된 html파일로 통신
				dataType : "html", //html형식으로 값 읽기
				data : {
					pageOwnerId : accId,
					activeTab : activeTab,
					isOwner : isOwner
				},
				success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').empty;
					$('#tabcontent').html(data);
				},
				error : function(error) { //통신 실패시
					alert('통신실패!? - ' + error);
				}
			});
		});

		$('#default').click();

	});
</script>