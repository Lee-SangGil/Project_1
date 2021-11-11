<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet"
			  href="${ pageContext.request.contextPath }/resources/css/style.css">
			  
		<link rel="stylesheet"
			  href="${ pageContext.request.contextPath }/resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
			
		<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			function find_pwd(){
				
				var id = document.getElementById("id").value;
				var name = document.getElementById("name").value;
				var pnum = document.getElementById("pnum").value;
				
				//유효성체크
				if(id == ''){
					alert("id를 입력하세요");
					return;
				}
				if(name == ''){
					alert("이름을 입력하세요");
					return;
				}
				if(pnum == ''){
					alert("전화번호를 입력하세요");
					return;
				}
				
				var url = "find_pwd.do";
				var param = "id="+id+"&name="+name+"&pnum="+pnum;
				
				sendRequest( url, param, resultFn, "post");
				
			}
			
			function resultFn(){
				
				if(xhr.readyState == 4 && xhr.status == 200){
					
					var pwd = xhr.responseText;
	
					if(pwd == ''){
						alert("일치하는 정보가 없습니다.");
						location.href = "login_form.do";
					
					}else{
						alert("당신의 비밀번호는" + pwd + "입니다." );
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
						<span>비밀번호 찾기</span>
					</p>
					<div class="form-wrapper">
						<input name="id" type="text" placeholder="아이디" id="id"
							class="form-control"> <i class="zmdi zmdi-account-box"></i>
					</div>
						
					<div class="form-wrapper">
						<input name="name" type="text" placeholder="이름" id="name"
							class="form-control"> <i class="zmdi zmdi-account-box"></i>
					</div>
		
					<div class="form-wrapper">
						<input type="text" name="pnum" placeholder="휴대폰번호" id="pnum"
							class="form-control"> <i class="zmdi  zmdi-phone"></i>
					</div>
					
					<button class="find_pwd_Button clickedButton" onclick="find_pwd();">
						<span> &nbsp &nbsp 비밀번호 찾기 →</span> <i class="zmdi zmdi-arrow-right"></i>
					</button>
	
				</form>
			</div>
		</div>
	</body>
</html>




