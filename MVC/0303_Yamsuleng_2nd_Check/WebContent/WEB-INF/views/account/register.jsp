<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.signup {
  width:80px;
  font-weight: bold;
}

body {
    margin: 0px;
    padding-top: 112.5px;
    font-family: -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 48.5px;
    color: #292b2c;
    padding-top: 74px;
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
				<div class="login-wrap p-4 p-md-5">
     			<h3 class="mb-3" style="text-align:center" > 회원가입 </h3>
					<form method="post" action="insert" id="accAddFrm" accept-charset="UTF-8">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center" >
			      				<label class="label" for="user_id"> 
			      				<div class="signup">ID</div></label>
					            <input type="text" name="user_id" id="id" placeholder="아이디" class="form-control"> <br/>
					            <input type="button" value="중복확인" id="chkBtn" class="chkBtn">
			      				</div>
							</div>
					        <div>
					            <span id="target"></span>
					        </div>	
					        						
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
			      			<label class="label" for="pwd">
			      			<div class="signup">Password</div>
			      			</label>
			      			<input type="password" name="pwd" id="pwd" placeholder="비밀번호" value="123456"  class="form-control">
			      				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
			      			<label class="label" for="name">
			      			<div class="signup">Name</div>
			      			</label>
			      			<input type="text" name="name" id="name" placeholder="이름" class="form-control">
			      				</div>
							</div>							
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
			      			<label  class="label" for="gender">
			      			<div class="signup">Gender</div></label>
						            <select name="gender" class="form-control">
						            <option value="M">남자</option>
						            <option value="F">여자</option>
				           			</select>
			      				</div> </br>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
		            		<label class="label" for="age">
		            		<div class="signup">Age</div></label>
		             		 <input type="text" name="age" id="age" placeholder="나이" value="25" class="form-control">
		           				</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="email">
				      			<div class="signup">E-Mail</div></label>
				      			<input type="email" name="email" id="email" placeholder="이메일" value="a@a.com" class="form-control">
				      			</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="phone">
				      			<div class="signup">Phone</div></label>
				      			<input type="text" name="phone" id="phone" placeholder="전화번호" value="010-1111-1111" class="form-control" >
				      			</div>
							</div>
													
							<div class="col-md-12">
								<div class="form-group d-flex align-items-center">
				      			<label class="label" for="address">
				      			<div class="signup">Address</div></label>
				      			<td>
				      			<input type="text" name="address" value="서울시 금천구" class="form-control">
				      			</td>
				      			</div>
							</div>							
							<br>
							<div class="col-md-12" >
								<div class="form-group d-flex align-items-center" >
				      			<input type="submit" value="가입하기" class="chkBtn" id="accAddBtn" >
				      			</div>
							</div>							
						</div>
         			</form>
        		</div>
      		</div>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$("#chkBtn").click(function(){
    $.ajax({
        url:'/yamsuleng/account/idchk',
        type:'post',
        dataType:"text",
        data:{"id":$("#id").val()},
        success:function(cnt){
            console.log('cnt =>' + cnt);
            if (cnt == 0){
                $('#target').html('사용 가능한 아이디입니다.')
                $('#target').css('color', 'blue')
            } else {
                $('#target').html('이미 사용 중인 아이디입니다.')
                $('#target').css('color', 'red')
            }
        }
    });
});
</script>
