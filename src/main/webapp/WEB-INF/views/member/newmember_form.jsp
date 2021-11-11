<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet"
			  href="${ pageContext.request.contextPath }/resources/css/style.css">
		
	
		<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
		
			function idCheck(){
								
				var id = document.getElementById("id").value;
				
				var url = "idCheck.do";
				
				var param = "id="+id;
				
				sendRequest( url, param, resIdCheck, "get" );
			}
			
			function resIdCheck(){
				
				if(xhr.readyState == 4 && xhr.status == 200){
					
					var data = xhr.responseText;
						
					var json = eval(data);
					
					if(json[0].res == 'no'){
						alert("이미 사용중인 id입니다.");
						return;
						
					}else{
						alert("사용 가능한 id입니다.");
					}
				}
			}
		
			function newmember(f){
				
				var id = f.id.value.trim();
				var pwd = f.pwd.value.trim();
				var name = f.name.value.trim();
				var pnum = f.pnum.value.trim();
				var email = f.email.value.trim();
				
				document.write("== jsp 54 id == : " +id);
				document.write("== pwd == : " +pwd);
				document.write("== name == : " +name);
				
				//유효성 체크
				if(id == ''){
					alert("id를 입력하세요.");
					return;
				}
				if(pwd == ''){
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				var url = "newmember.do";
				
				var param = "id="+id
							+"&pwd="+encodeURIComponent(pwd)
							+"&name="+encodeURIComponent(name)
							+"&pnum="+encodeURIComponent(pnum)
							+"&email="+encodeURIComponent(email);
				
				document.write("==76 param == : " +param);
				
				sendRequest(url, param, resultFn, "post");
			}
			
			function resultFn(){
				
				document.write("==83 == : " + xhr.status);
				
				if(xhr.readyState == 4 && xhr.status == 200){
					
					var data = xhr.responseText;
					
					var json = eval(data);
					
					if(json[0].res == 'no'){
						alert("회원가입 실패");
						return;
					
					}else{
						alert("회원가입 성공");
						location.href = "login_form.do";
					}
				}
			}
		</script>
	</head>
	<body>
	
		<div class="wrapper" style="">

		<div class="inner">
			<div class="image-holder">
				<img id="poster"
					src="https://upload.wikimedia.org/wikipedia/ko/f/f2/%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4-_%EC%97%94%EB%93%9C%EA%B2%8C%EC%9E%84_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"
					alt="">
			</div>
			<form>
				<p class="register-title">
					<img  src="http://img.cgv.co.kr/R2014/images/title/h1_cgv.png">
					<span>회원가입</span>
				</p>
				<div class="form-wrapper form-wrapper-id">
					<div class="id-wrapper">
						<input id="id" name="id" type="text" placeholder="아이디"
							class="form-control">
						<!-- <i class="zmdi zmdi-id">아이디 체크</i> -->
						<button type="button" class="idCheckButton" onclick="idCheck();">아이디 체크</button>
					</div>
				</div>

				<div class="form-wrapper">
					<input type="password" name="pwd" placeholder="비밀번호" id="pwd"
						class="form-control"> <i class="zmdi zmdi-lock"></i>
				</div>
		
				<div class="form-wrapper">
					<input name="name" type="text" placeholder="이름"
						class="form-control"> <i class="zmdi zmdi-account-box"></i>
				</div>

				<div class="form-wrapper">
					<input type="text" name="pnum" placeholder="휴대폰번호"
						class="form-control"> <i class="zmdi  zmdi-phone"></i>
				</div>

				<div class="form-wrapper">
					<input type="email" name="email" placeholder="이메일"
						class="form-control"> <i class="zmdi zmdi-email"></i>
				</div>


				<button class="registerButton clickedButton" onclick="newmember(this.form);">
					<span> &nbsp &nbsp 회원가입 하기 →</span> <i class="zmdi zmdi-arrow-right"></i>
				</button>
			</form>
		</div>
	</div>
		
	</body>
</html>





