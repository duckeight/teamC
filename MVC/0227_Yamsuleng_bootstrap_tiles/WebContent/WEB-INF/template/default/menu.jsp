<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
	<li><a href="/yamsuleng">Home</a></li>
	<c:choose>
		<c:when test="${sessionScope.sessionID == null}">
		<li><a href="/yamsuleng/login/">로그인</a></li>
		<li><a href="/yamsuleng/account/register">회원가입</a></li>
		</c:when>
		<c:when test="${sessionScope.sessionID != null}">
		<li><a href="/yamsuleng/login/logout">로그아웃</a></li>
		<li><a href="/yamsuleng/account/mypage">마이페이지</a></li>
		</c:when>
	</c:choose>
		<li><a href="/yamsuleng/store/allStore">식당목록</a></li>
		<li><a href="/yamsuleng/post/list">게시글목록</a></li> 
		<c:if test="${sessionScope.sessionID != null}">
		<li>${sessionScope.sessionName }님 반갑습니다</li>
	</c:if>
</ul>