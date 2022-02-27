<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Begin Nav
================================================== -->
<nav class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="container">
	<!-- Begin Logo -->
	<a class="navbar-brand" href="/yamsuleng">
	<img src="/img/logo.png" alt="logo">
	</a>
	<!-- End Logo -->
	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		
		<!-- Begin Menu -->
		<ul class="navbar-nav ml-auto">
			<!--
			<li class="nav-item active">
			<a class="nav-link" href="index.html">회원가입 <span class="sr-only">(current)</span></a>
			</li>
			 -->
	 	<c:choose>
	 		<c:when test="${sessionScope.sessionID == null}">
				<li class="nav-item">
					<a class="nav-link" href="/yamsuleng/login/">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/yamsuleng/account/register">회원가입</a>
				</li>
			</c:when>
			<c:when test="${sessionScope.sessionID != null}">
				
				<li class="nav-item">
					<a class="nav-link" href="/yamsuleng/login/logout">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/yamsuleng/account/mypage">마이페이지</a>
				</li>
			</c:when>
		</c:choose>
			
			<li class="nav-item">
				<a class="nav-link" href="/yamsuleng/store/allStore">식당목록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/yamsuleng/post/list?searchKeyWord=">게시글목록</a>
			</li>
			
			<c:if test="${sessionScope.sessionID != null}">
				<li>${sessionScope.sessionName }님 반갑습니다</li>
			</c:if>
			
		</ul>
		<!-- End Menu -->
		
		<!-- Begin Search -->
		<form class="form-inline my-2 my-lg-0"
			id="frmSearch" method="Get" action="/yamsuleng/post/list" accept-charset="UTF-8">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
					name='searchKeyWord' value="${pageNavInfo.searchKeyWord}">
			
			<span class="search-icon">
				<label><!-- svg태그랑 submit 태그 연동 -->
				<input type="submit" style="display:none;"/>
				<svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25">
					<path d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z"></path>
				</svg>
				</label>
			</span>
		</form>
		<!-- End Search -->
	</div>
</div>
</nav>
<!-- End Nav
================================================== -->
