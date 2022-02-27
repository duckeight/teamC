<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<p> 회원 아이디 : ${accInfo.id}</p>
<c:forEach var="h" items="${accHashInfo}">
<p> 해시태그에 저장된 회원의 아이디 : ${h.target_id}</p>
</c:forEach>
