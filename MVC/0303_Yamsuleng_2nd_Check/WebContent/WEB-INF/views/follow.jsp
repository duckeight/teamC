<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="reloadDiv">
<div class="container">
	<div class="listrecent listrelated"> 
		
		<br> <br>
		<table class="table">
			<thead class="table-light">
			<tr>
				<!-- <th class="text-center">#</th> -->
				<th class="text-center">프로필사진</th>
				<th class="text-center">Yamsuleng ID</th>
				<c:if test="${isOwner == 'Y'}">
					<c:if test="${activeTab == 'following'}">
						<th class="text-center">팔로우 취소</th>
					</c:if>
					<c:if test="${activeTab == 'follower'}">
						<th class="text-center">팔로워 차단</th>
					</c:if>
				</c:if>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="follow" items="${ followList }"> 
					<tr>
						<!-- <th class="text-center">${following.TARGET_ID}</th> -->
						<td class="text-center">${follow.FILE_NAME}</td>
						
						
						<td class="text-center">
							<c:if test="${activeTab == 'following'}"> 
								<a href="/yamsuleng/userPage/userTemplate?pageOwnerId=${follow.TARGET_ID}">
								${follow.USER_ID}
								</a>
							</c:if>
							<c:if test="${activeTab == 'follower'}">
								<a href="/yamsuleng/userPage/userTemplate?pageOwnerId=${follow.FOLLOWER}">
								${follow.USER_ID}
								</a>
							</c:if>
							
						</td>
						<c:if test="${isOwner == 'Y'}">
							<td class="text-center">
								<c:if test="${activeTab == 'following'}"> 
									<input type="button" value="cancel" class="followDel"
										data-url="followDel" data-del="${follow.TARGET_ID}">
								</c:if>
								<c:if test="${activeTab == 'follower'}">
									<input type="button" value="cancel" class="followDel"
										data-url="followDel" data-del="${follow.FOLLOWER}">
								</c:if>
								
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function() {
	$('.followDel').click(function() {
		var delTargetId = $(this).attr('data-del');  
		var isOwner = "<c:out value='${isOwner}' />";
		var pageOwnerId = ${sessionScope.sessionID}; 
		var activeTab = "<c:out value='${activeTab}' />";
		 
		$.ajax({
			type : 'GET',          			 
			url : "followDel", 			 	
			data : {delTargetId : delTargetId, pageOwnerId : pageOwnerId, activeTab:activeTab},
			success : function(data) {  	 
				$.ajax({
					type : 'GET',          		 
					url : "follow", 			 	 
					dataType : "html",     //성공시.. follow페이지를 다시 받아와서 띄워줄거얏			 
					data : {isOwner : isOwner, pageOwnerId:pageOwnerId, activeTab : activeTab},
					success : function(data) { 
						$('#reloadDiv').empty;
						$('#reloadDiv').html(data);
					},
					error : function(error) {         //통신 실패시
						alert('reload fail - ' + error);
					}
				});
			},
			error : function(error) {         //통신 실패시
				alert('통신실패!? - ' + error);
			}
		});
	});
	
	     
});
</script>
