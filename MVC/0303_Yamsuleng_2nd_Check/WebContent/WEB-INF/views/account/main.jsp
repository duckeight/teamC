<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<p> ȸ�� ���̵� : ${accInfo.id}</p>
<c:forEach var="h" items="${accHashInfo}">
<p> �ؽ��±׿� ����� ȸ���� ���̵� : ${h.target_id}</p>
</c:forEach>
