<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
.signup {
  width:80px;
  font-weight: bold;
}

.footer {
    border-top: 0px solid rgba(0,0,0,.05)!important;
    padding-top: 0px;
    padding-bottom: 0px;
    font-size: 0.8rem;
    color: rgba(0,0,0,.44);
    height: 0px;
}

body {
    padding-top: 79px;
    font-family: -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 55.9px;
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
     			<h2 style="text-align:center" > ${accInfo.name}님의 회원정보 </h2>
				
				<form method="post" id="accUpFrm" >
				
						<div class="row">
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="name">
				      			<div class="signup">Name</div></label>
					            <input type="text" name="name" id="name" value="${accInfo.name}" class="form-control">
					            <br>
			      				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="user_id">
				      			<div class="signup">Login id</div></label>
				      			<input type="text" name="user_id" id="user_id" value="${accInfo.user_id}"class="form-control">
			      				<br>
			      				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
			      			<label  class="label" for="pwd">
			      			<div class="signup">Password</div></label>
						    <input type="password" name="pwd" id="pwd" value="${accInfo.pwd}" class="form-control"><br>
						    <br>
						    <span id="pwdchk"></span>
			      				</div>
							</div>

							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="email" >
				      			<div class="signup">Email</div></label>
				      			<input type="text" name="email" id="email" value="${accInfo.email}" class="form-control">
				      			<br>
				      			</div>
							</div>
													
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="phone">
				      			<div class="signup">Phone</div></label>
				      			<input type="text" name="phone" id="phone" value="${accInfo.phone}" class="form-control">
				      			<br>
				      			</div>
							</div>	
													
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="address">
				      			<div class="signup">Address</div></label>
				      			<input type="text" name="address" id="address" value="${accInfo.address}" class="form-control">
				      			<br>
				      			</div>
							</div>	
							
	
	        <footer class="chkBtn accUpBtn">
	            <input type="hidden" name="id" value="${accInfo.id }">
	            <input type="button" id="accUpBtn" value="수정하기" >
	            <input type="button" id="accDelBtn" value="탈퇴하기" >
	        </footer>
    </form>
</div>
</div>
</div>
</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	// 회원 정보 수정을 위한 submit
	$("#accUpBtn").click(function(){
		$("#accUpFrm").attr("action", "update")
		$("#accUpFrm").submit();
	});
	// 회원 탈퇴를 위한 submit
	$("#accDelBtn").click(function(){
		if(confirm("정말 탈퇴하시겠습니까?")){
			$("#accUpFrm").attr("action", "delete")
			$("#accUpFrm").submit();
		};
	});

</script>
