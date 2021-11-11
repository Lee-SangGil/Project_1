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
		
		<!-- 
		<script language = "javascript">
			var imgArray = new Array();
			imgArray[0] = "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84643/84643_1000.jpg";
			imgArray[1] = "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84703/84703_1000.jpg";
			imgArray[2] = "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84647/84647_1000.jpg";
			imgArray[3] = "https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84686/84686_1000.jpg";
			
			function showImage(){
				var imgNum = Math.round(Math.random()*3);
				var objImg = document.getElementById("poster");
				objImg.src = imgArray[imgNum];
			}
		</script>
 		-->
		<script type="text/javascript">
			
		function login(){
			
			var id = document.getElementById("id").value; 
			var pwd = document.getElementById("pwd").value; 
			
			if(id == ''){
				alert("아이디를 입력하세요.");
				return;
			}
			if(pwd == ''){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			var url = "login.do";
			
			var param = "id="+id+"&pwd="+pwd;
			
			sendRequest( url, param, resultFn, "post");
			
			
		}
		
		function resultFn(){
			
			if(xhr.readyState == 4 && xhr.status == 200 ){
				
				var id = xhr.responseText;
				
				
				if(id != null){
					alert( id + "님 환영합니다." );
					location.href="main.do?id="+id;
					
				}else{
					alert("id 또는 비밀번호가 일치하지 않습니다.");
					return;
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
							src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84643/84643_1000.jpg"
							alt="">
					</div>
				
		<form>
				<p class="register-title">
							<img src="http://img.cgv.co.kr/R2014/images/title/h1_cgv.png">
							<span>로그인</span>
				</p>
			
				<div class="form-wrapper form-wrapper-id">
					<div class="id-wrapper">
						<input id="id" name="id" type="text" placeholder="아이디"
							   class="form-control"><i class="zmdi zmdi-accounts"></i>
					
					</div>
				</div>
				<div class="form-wrapper">
					<input type="password" name="pwd" placeholder="비밀번호"
						   id="pwd" class="form-control"> <i
						   class="zmdi zmdi-lock"></i>
				</div>
					<button type="button" class="loginButton" onclick="login();">
						<span>&nbsp&nbsp 로그인 하기 →</span><i class="zmdi zmdi-arrow-right"></i>
					</button>
					<button type="button" class="moveNewmember" style="margin-top: 10px;" onclick="location.href='newmember_form.do'">
						<span>&nbsp&nbsp 회원가입 하기 →</span> <i class="zmdi zmdi-arrow-right"></i>
					</button>
				
					<button type="button" class="moveMain" style="margin-top: 10px;" onclick="location.href='main.do'">
						<span>&nbsp&nbsp 메인 홈페이지 →</span><i class="zmdi zmdi-arrow-right"></i>
					</button>
					
					<button type="button" class="moveFind_id" style="margin-top: 10px;" onclick="location.href='find_id_form.do'">
						<span>&nbsp&nbsp 아이디 찾기 →</span><i class="zmdi zmdi-arrow-right"></i>
					</button>
					<button type="button" class="moveFind_pwd" style="margin-top: 10px;" onclick="location.href='find_pwd_form.do'">
						<span>&nbsp&nbsp 비밀번호 찾기 →</span><i class="zmdi zmdi-arrow-right"></i>
					</button>
					
			</form>
			</div>
		</div>
		

	</body>
</html>




