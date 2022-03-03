<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.signup {
  width:80px;
  font-weight: bold;
}

body {
	padding-top:66.9px;
	font-family: -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 2.2;
    color: #292b2c;
    background-color: #fff;
	
}

.chkBtn {
  margin:0 auto;
}

#wrap {
  background:url('/img/bg-01.jpg');
}

</style>

<div class="container">
	<div class="container-login100" >
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="wrap d-md-flex">
				<div class="login-wrap p-4 p-md-5">
     			<h2 style="text-align:center"  > ${accInfo.name}님의 회원정보 </h2>
				
				<form method="post" id="accDetailFrm" action="/yamsuleng/account/updateInfo" class="signup-form">
				
						<div class="row">
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="name">
				      			<div class="signup">Name</div></label>
					            <input type="text" name="name" id="name" value="${accInfo.name}" readonly="true" class="form-control">
			      				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="user_id">
				      			<div class="signup">Login id</div></label>
				      			<input type="text" name="user_id" id="user_id" value="${accInfo.user_id}" readonly="true" class="form-control">
			      				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
			      			<label  class="label" for="pwd">
			      			<div class="signup">Password</div></label>
						    <input type="password" name="pwd" id="pwd" value="${accInfo.pwd}" class="form-control"><br>
						    <span id="pwdchk"></span>
			      				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
		            		<label class="label" for="gender" >
		            		<div class="signup">Gender</div></label>
		             		 <c:choose >
								<c:when test="${fn:contains(accInfo.gender, 'F')}">
								<input type="text" id="gender" value="여성" readonly="true" class="form-control">
								</c:when>
								<c:when test="${fn:contains(accInfo.gender, 'M')}">
								<input type="text" id="gender" value="남성" readonly="true" class="form-control">
								</c:when>
							</c:choose>
		           				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="age">
				      			<div class="signup">Age</div></label>
				      			<input type="text" name="age" id="age" value="${accInfo.age}" readonly="true" class="form-control">
				      			</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="email" >
				      			<div class="signup">Email</div></label>
				      			<input type="text" name="email" id="email" value="${accInfo.email}" readonly="true" class="form-control">
				      			</div>
							</div>
													
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="phone">
				      			<div class="signup">Phone</div></label>
				      			<input type="text" name="phone" id="phone" value="${accInfo.phone}" readonly="true" class="form-control">
				      			</div>
							</div>	
													
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="address">
				      			<div class="signup">Address</div></label>
				      			<input type="text" name="address" id="address" value="${accInfo.address}" readonly="true" class="form-control">
				      			</div>
							</div>	
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="regdate">
				      			<div class="signup">Register Date</div></label>
				      			<input type="text" id="reg_date" value="${accInfo.reg_date}" readonly="true" class="form-control">
				      			</div>
							</div>		
							<!-- 이거 풋터인 이유가 있나요? -->						
					        <footer class="chkBtn" >
					        	<input type="hidden" name="id" value="${accInfo.id }">
					            <input type="submit" id="accUpBtn" value="회원 정보 수정하기">
					        </footer>							
						</div>
       			
       			</form>
        </div>
      </div>
		</div>
	</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
