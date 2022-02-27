<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>얌슐랭 로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
   
    <!-- 타일즈를 빼기 위해 LoginController의 '/' 추가해주세요! -->
    
<link rel="icon" type="image/png" href="/img/icons/favicon.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="/css/util.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/img/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">

					<form class="login100-form validate-form" method="post"
						id="loginFrm" action="/yamsuleng/login/login">
					<span class="login100-form-title p-b-49">
						Login
					</span>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">User ID</span>
						<input class="input100" type="text" name="loginId" id="loginId" placeholder="Username" required="required">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="Password" required="required" id="password"
						onkeyup="enterkey();">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<br><br>
					  <div>
         			  <span id="target"></span>
     				  </div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button type="button" class="login100-form-btn"  id="accLoginBtn" value="로그인">	Login</button>
						</div>
					</div>
					</form>
						<div class="flex-col-c p-t-155">
						<a href="/yamsuleng/account/register" class="txt2">
							Sign Up
						</a>
						</div>
					</div>
			
			</div>
		</div>
</body>	
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function enterkey(){
	if(window.event.keyCode==13){
		$("#accLoginBtn").click();
	}
};

$("#accLoginBtn").click(function(){
	var id = $("#loginId").val();
	var pwd = $("#password").val();
    $.ajax({
        url:'/yamsuleng/account/idchk',
        type:'post',
        dataType:"text",
        data:{"id":id},
        success:function(cnt){
            console.log('cnt =>' + cnt);
        	// 입력된 아이디가 존재하지 않으면 로그인 실패
            if (cnt == 0){
                $('#target').html('잘못된 아이디입니다.')
                $('#target').css('color', 'red')
            } else {
            // 입력된 아이디가 존재하면 비밀번호 체크
            	$.ajax({
            		url:'/yamsuleng/login/pwdchk',
                    type:'post',
                    dataType:"text",
                    data:{"id":id, "pwd":pwd},
                    success:function(cnt){
                        console.log('cnt =>' + cnt);
                    	// 해당아이디의 DB상 비밀번호와 입력 비밀번호가 다르면 로그인 실패
                    	if (cnt == 0){
                            $('#target').html('잘못된 비밀번호입니다.')
                            $('#target').css('color', 'red')
                    	} else { // 같으면 form 제출해 로그인처리
                    		$("#loginFrm").submit();
                    	}
                    }
            	});
            };
        }
    });

});
</script>