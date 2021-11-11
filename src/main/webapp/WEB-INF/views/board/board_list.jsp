<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/font.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/fonts/css/material-design-iconic-font.min.css">
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<!-- MATERIAL DESIGN ICONIC FONT -->
<script>


//	window.onload = function(){
//		document.getElementById("mt1").checked = "checked";
//	}

	function getMovieName(event) {

		const nameId = event.target.id; // nameId에 id값(mt1) 저장
		const query = 'label[for="' + nameId + '"]'  // label for가 mt1인 라벨을 찾아라
		const text = document.querySelector(query).innerText;  // label for가 mt1인 라벨 안의 text값을 가져와라.
															   // mt1 = 킬러의 보디가드2
		document.getElementById('movienameresult').innerText = text;  // div id가 movienameresult인곳에 킬러의 보디가드2를 저장.
	}

	function getMovieplace(event) {

		const placeId = event.target.id;
		const query = 'label[for="' + placeId + '"]'
		const text = document.querySelector(query).innerText;

		document.getElementById('movieplaceresult').innerText = text;
	}
	
	function getMoviedate(event) {

		const dateId = event.target.id;
		const query = 'label[for="' + dateId + '"]'
		const text = document.querySelector(query).innerText;

		document.getElementById('moviedateresult').innerText = text;
	}
	
	function getMovietime(event) {

		const timeId = event.target.id;
		const query = 'label[for="' + timeId + '"]'
		const text = document.querySelector(query).innerText;

		document.getElementById('movietimeresult').innerText = text;
	}
	
	
	function giveTime(f) {
		
		var moviename = document.getElementById('movienameresult').innerText;
		var movietheater = document.getElementById('movieplaceresult').innerText;
		var moviedate = document.getElementById('moviedateresult').innerText;
		var c_moviename = document.getElementById('');
		
		if (moviename == "" || movietheater == "" || moviedate == "") {
			alert("모든 것을 선택하고 눌러주세요!");
			return;
		}
		var url = 'givemovielist.do';
		var param = "moviename=" + moviename + "&movietheater="
				+ encodeURIComponent(movietheater) + "&moviedate="
				+ encodeURIComponent(moviedate);

		sendRequest(url, param, resModify, "POST");
	}

	function resModify() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var data = xhr.responseText;
			var json = eval(data);

			if (json[0].res == 'yes') {
				alert("시간을 불러왔습니다. 영화부터 다시 선택해주세요.");

				location.href = "list.do";

			} else {
				alert("수정실패");
			}

		}

	}
	
	// 영화이름, 극장, 날짜, 시간을 가지고와 좌석화면으로 이동
	function send(f) {
		var moviename = document.getElementById('movienameresult').innerText;
		var movietheater = document.getElementById('movieplaceresult').innerText;
		var moviedate = document.getElementById('moviedateresult').innerText;
		var movietime = document.getElementById('movietimeresult').innerText;

		f.moviename.value = moviename;
		f.movietheater.value = movietheater;
		f.moviedate.value = moviedate;
		f.movietimelist.value = movietime;

		f.action = "seat.do";
		f.submit();
	}
</script>
<style>

.b1{
	font-color:red;
}

footer{
	margin-top: 1300px;
	border-top: 1px solid gray;
}

* {
	font-size: 11px;
}

body {
	background-color: #FDFCF0;
}

/* header */
.movies {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
	border-top: 20px solid red;
}

.movies td {
	border-top: 5px solid yellow;
}

thead th:nth-child(1) {
	width: 10%;
}

thead th:nth-child(2) {
	width: 20%;
}

thead th:nth-child(3) {
	width: 15%;
}

thead th:nth-child(4) {
	width: 35%;
}

th, td {
	padding: 20px;
}

/* //header */

/* nav */
.radio input[type="radio"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.radio input[type="radio"]+label {
	display: inline-block;
	position: relative;
	padding-left: 30px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.radio input[type="radio"]+label:before {
	content: '';
	position: absolute;
	left: 0;
	top: -4px;
	width: 21px;
	height: 21px;
	text-align: center;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 100%;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}

.radio input[type="radio"]+label:active:before, .checks input[type="radio"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.radio input[type="radio"]:checked+label:before {
	background: #E9ECEE;
	border-color: #adb8c0;
}
/* 
.radio{
  padding-right: 2px;
    margin-top: 2px;
    height: 300px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    overflow: scroll;
    overflow-x: hidden;} */
.button {
	display: flex;
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.button:hover {
	background-color: #4CAF50;
	color: white;
}

.welcome {border ="0" margin-left:0px;
	margin-right: 0px;
	margin-bottom: 20px;
	width: 200px;
}

.welcome td {
	font-weight: bolder;
	padding-top: 3px;
	padding-bottom: 20px;
	text-align: center;
	vertical-align: top;
}

.welcome button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 4px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.moviesinside {
	border-top: 5px solid black;
	float: left;
	margin-left: 100px;
	margin-right: 60px;
}

.moviesinside2 {
	border-top: 5px solid black;
	margin-left: 80px;
	margin-right: 40px;
	float: left;
}

.moviesinside3 {
	border-top: 5px solid black;
	float: left;
	
	margin-left: 170px;
	margin-right: 120px;
}

.moviesinside4 {
	border-top: 5px solid black;	
	float: left;
	margin-left: 160px;
	margin-right: 60px;
}
</style>

</head>

<body>
	<form>
		<table class="welcome">
			<tr>
				<%
					if (vo != null) {
				%>
				<td><input type="button" value="마이페이지" class="welcomebutton"
					style="margin-top: 10px;" onclick="location.href='moveMypage.do'"></td>

				<td><input type="button" value="로그아웃" class="welcomebutton"
					style="margin-top: 10px;" onclick="location.href='login_form.do'"></td>

				<%
					} else {
				%>
				<td><input type="button" value="마이페이지" class="button"
					style="margin-top: 10px;" onclick="location.href='moveMypage.do'"></td>

				<td><input type="button" value="로그인" class="button"
					style="margin-top: 10px;" onclick="location.href='login_form.do'"></td>
				<%
					}
				%>
			</tr>
		</table>



		<nav>
			<div class="logo-wrapper">
				<a href="main.do"> <img class="cgvLogo"
					src="${ pageContext.request.contextPath }/resources/images/cgv.png"></a>
			</div>
			<div class="nav-content">
				<div class="movieLogo-wrapper">
					<img class="cgvMovie"
						src="${ pageContext.request.contextPath }/resources/images/h2_movie.png">
				</div>
				
			
				<div class="nav-inner">
					<div>
						<button><a href="main.do">영화</a></button>
					</div>
					<div>
						<button style="border-bottom:3px solid gray;"><a href="list.do">예매</a></button>
					</div>
					<div>
						<button>극장</button>
					</div>
					<div>
						<button>이벤트&컬쳐</button>
					</div>

				</div>

			</div>
			<div></div>
			<div></div>
		</nav>
		<table border="1" align="center" class="movies">
			<tr>
				<th>영화</th>
				<th>영화관</th>
				<th>날짜</th>
				<th>시간</th>

			</tr>
		</table>

		<table class="moviesinside">
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mt1' name="movietitle" value='킬러의 보디가드2'
							onclick="getMovieName(event)"><label for='mt1'>킬러의
							보디가드2</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mt2' name="movietitle" value='발신제한'
							onclick="getMovieName(event)"><label for='mt2'>발신제한</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mt3' name="movietitle" value='콰이어트 플레이스2'
							onclick="getMovieName(event)"><label for='mt3'>콰이어트
							플레이스2</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mt4' name="movietitle" value='크루엘라'
							onclick="getMovieName(event)"><label for='mt4'>크루엘라</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mt5' name="movietitle" value='루카'
							onclick="getMovieName(event)"><label for='mt5'>루카</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mt6' name="movietitle"
							value='분노의 질주: 더 엘티메이텀' onclick="getMovieName(event)"><label
							for='mt6'>분노의 질주: 더 엘티메이텀</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="movienameresult" style="display: none"></div> 
					<input name="moviename" type="hidden">
				</td>

			</tr>

		</table>

		<table class="moviesinside2">
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp1' name="movieplace" value='신촌'
							onclick="getMovieplace(event)"><label for='mp1'>신촌</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp2' name="movieplace" value='강변'
							onclick="getMovieplace(event)"><label for='mp2'>강변</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp3' name="movieplace" value='건대입구'
							onclick="getMovieplace(event)"><label for='mp3'>건대입구</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp4' name="movieplace" value='구로'
							onclick="getMovieplace(event)"><label for='mp4'>구로</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp5' name="movieplace" value='대학로'
							onclick="getMovieplace(event)"><label for='mp5'>대학로</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp6' name="movieplace" value='동대문'
							onclick="getMovieplace(event)"><label for='mp6'>동대문</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp7' name="movieplace" value='목동'
							onclick="getMovieplace(event)"><label for='mp7'>목동</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp8' name="movieplace" value='명동'
							onclick="getMovieplace(event)"><label for='mp8'>명동</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp9' name="movieplace" value='미아'
							onclick="getMovieplace(event)"><label for='mp9'>미아</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp10' name="movieplace" value='불광'
							onclick="getMovieplace(event)"><label for='mp10'>불광</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp11' name="movieplace" value='상봉'
							onclick="getMovieplace(event)"><label for='mp11'>상봉</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp12' name="movieplace" value='송파'
							onclick="getMovieplace(event)"><label for='mp12'>송파</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp13' name="movieplace" value='강변'
							onclick="getMovieplace(event)"><label for='mp13'>신촌</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp14' name="movieplace" value='수유'
							onclick="getMovieplace(event)"><label for='mp14'>수유</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp15' name="movieplace" value='압구정'
							onclick="getMovieplace(event)"><label for='mp15'>압구정</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp16' name="movieplace" value='영등포'
							onclick="getMovieplace(event)"><label for='mp16'>영등포</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp17' name="movieplace" value='왕십리'
							onclick="getMovieplace(event)"><label for='mp17'>왕십리</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='mp18' name="movieplace" value='중계'
							onclick="getMovieplace(event)"><label for='mp18'>중계</label>
					</div>
				</td>
			</tr>
			<tr>
				<td><div id="movieplaceresult" style="display: none"></div> <input
					name="movietheater" type="hidden"></td>

			</tr>
		</table>



		<table class="moviesinside3" width="100">
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md1' name="moviedate" value='7월2일'
							onclick="getMoviedate(event)"><label for='md1'>7월2일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md2' name="moviedate" value='7월 3일'
							onclick="getMoviedate(event)"><label for='md2'>7월 3일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md3' name="moviedate" value='7월 4일'
							onclick="getMoviedate(event)"><label for='md3'>7월 4일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md4' name="moviedate" value='7월 5일'
							onclick="getMoviedate(event)"><label for='md4'>7월 5일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md5' name="moviedate" value='7월 6일'
							onclick="getMoviedate(event)"><label for='md5'>7월 6일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md6' name="moviedate" value='7월 7일'
							onclick="getMoviedate(event)"><label for='md6'>7월 7일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md7' name="moviedate" value='7월 8일'
							onclick="getMoviedate(event)"><label for='md7'>7월 8일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md8' name="moviedate" value='7월 9일'
							onclick="getMoviedate(event)"><label for='md8'>7월 9일</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="radio">
						<input type="radio" id='md9' name="moviedate" value='7월 10일'
							onclick="getMoviedate(event)"><label for='md9'>7월 10일</label>
					</div>
				</td>
			</tr>

			<tr>
				<td><div id="moviedateresult" style="display: none"></div> <input
					name="moviedate" type="hidden"></td>

			</tr>
			<tr>
				<td><input type="button" value="검색" class="button"
					onclick="giveTime(this.form);"></td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${empty sessionScope.time}">
				<div class="moviesinside4">선택된 영화들이 없습니다.</div>

			</c:when>
			<c:otherwise>
				<table class="moviesinside4">
					<!-- ${time.get(cnt.index)} :  -->
					<c:forEach var="value" items="${time}" varStatus="cnt">
			
						<tr>
							<td><input type="radio" id='btn' name="movietime"
								value="${time.get(cnt.index)}" onclick="getMovietime(event)"><label
								for='btn'>${time.get(cnt.index)}</label></td>
						</tr>
					</c:forEach>
					<tr>
						<td><input type="button" value="예매하기" class="button"
							onclick="send(this.form);"></td>
					</tr>
					<tr>
						<td><div id="movietimeresult" style="display: none"></div> <input
							name="movietimelist" type="hidden"></td>

					</tr>
				</table>

			</c:otherwise>
		</c:choose>
	

	
	</form>

	<footer>
        <div class="foot">
        	<div class="logo">
        		<img src="resources/img/logo.JPG">
        	</div>
            <div class="sect-cinfo">
                <p class="logo">CJ CGV 로고</p>
                <h2>CJ CGV 회사소개 및 정책</h2>
                <div class="policy">
                    <ul style="display: flex;">
                        <li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li> &nbsp;&nbsp;
                        <li><a href="http://corp.cgv.co.kr/company/ir/financial/financial_list.aspx" target="_blank">IR</a></li>&nbsp;&nbsp;
                        <li><a href="http://corp.cgv.co.kr/company/recruit/step/default.aspx" target="_blank">채용정보</a>&nbsp;&nbsp;
                        </li>
                        <li><a href="http://corp.cgv.co.kr/company/advertize/ad_Default.aspx" target="_blank">광고/프로모션문의</a></li>&nbsp;&nbsp;
                        <li><a href="http://corp.cgv.co.kr/company/advertize/af_default.aspx" target="_blank">제휴문의</a>&nbsp;&nbsp;
                        </li>
                        <li><a href="http://corp.cgv.co.kr/company/advertize/bp_insert.aspx" target="_blank">출점문의</a>&nbsp;&nbsp;
                        </li>
                        <li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>&nbsp;&nbsp;
                        <li><a href="http://www.cgv.co.kr/rules/organized.aspx">편성기준</a></li>&nbsp;&nbsp;
                        <li><a href="http://www.cgv.co.kr/rules/privacy.aspx" class="empha-red">개인정보처리방침</a></li>&nbsp;&nbsp;
                        <li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>&nbsp;&nbsp;
                        <li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>&nbsp;&nbsp;
                        <li><a href="http://www.cgv.co.kr/company/coexist.aspx">상생경영</a></li>&nbsp;&nbsp;
                        <li><a href="http://www.cgv.co.kr/guide/sitemap.aspx">사이트맵</a></li>&nbsp;&nbsp;
                    </ul>
                </div>
                <div class="share">
                    <a href="https://www.facebook.com/CJCGV" target="_blank" class="facebook" title="새창">페이스북&nbsp;&nbsp;</a><a href="https://twitter.com/cj_cgv" target="_blank" class="twitter" title="새창">트위터&nbsp;&nbsp;</a><a href="https://www.instagram.com/cgv_korea/" target="_blank"
                        class="instagram" title="새창">인스타그램&nbsp;&nbsp;</a>
                </div>
                <div class="address">
                    <address>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)</address><br>
                    <p class="vl">
                        <span>대표이사진 : 김재연 김유림 이인재 이상길  &nbsp;</span><br>
                        <span>사업자등록번호 : 104-81-45690</span><br>
                        <span>통신판매업신고번호 : 2017-서울용산-0662</span>
                        <a href="javascript:void(0);" onclick="goFtc()" class="btn_goFtc"><img src="http://img.cgv.co.kr/r2014/images/common/btn_reg.png" alt="사업자정보확인" />
                            </a>
                    </p>
                    <p class="vl">
                        <span>호스팅사업자 : CJ올리브네트웍스</span><br>
                        <span>개인정보보호 책임자 : 이인재</span> &nbsp;
                        <span>대표이메일 : cjcgvmaster@cj.net</span><br>
                        <span>CGV고객센터 : 1544-1122</span>
                    </p>
                    <p class="copyright">&copy; CJ CGV. All Rights Reserved</p>
                </div>
                <div class="familysite">
                    <label for="familysite" class="hidden">CJ그룹 계열사 바로가기</label>
                    <select id="familysite">
                        <option value="">계열사 바로가기</option>
                        <optgroup label="CJ그룹">
                            <option value="http://www.cj.net/">CJ주식회사</option>
                        </optgroup>
                        <optgroup label="엔터테인먼트 & 미디어">
                            <option value="http://www.cjenm.com/">CJ ENM (E&M)</option>
                            <option value="http://www.cgv.co.kr/">CJ CGV</option>
                            <option value="http://www.cjpowercast.com/">CJ파워캐스트</option>
                        </optgroup>
                        <optgroup label="식품 & 식품서비스">
                            <option value="https://www.cj.co.kr">CJ제일제당 (식품)</option>
                            <option value="http://www.cjfreshway.com/">CJ프레시웨이</option>
                            <option value="http://www.cjfoodville.co.kr/">CJ푸드빌</option>
                            <option value="http://www.md1.co.kr/">CJ엠디원</option>
                        </optgroup>
                        <optgroup label="생명공학">
                            <option value="https://www.cj.co.kr/kr/about/business/bio">CJ제일제당 (바이오)</option>
                        </optgroup>
                        <optgroup label="신유통">
                            <option value="http://display.cjmall.com">CJ ENM (오쇼핑)</option>
                            <option value="http://www.cjlogistics.com">CJ대한통운</option>
                            <option value="http://www.cjtelenix.com/">CJ텔레닉스</option>
                            <option value="http://www.oliveyoung.co.kr/store/main/main.do">CJ올리브영</option>
                        </optgroup>
                        <optgroup label="인프라">
                            <option value="http://www.cjenc.co.kr/">CJ대한통운 (건설)</option>
                            <option value="http://www.cjolivenetworks.co.kr/itbusiness/">CJ올리브네트웍스</option>
                        </optgroup>
                    </select>
                    <button type="button" title="새창" onclick="goFamilySite()">GO</button>
                </div>
            </div>
        </div>

        <!-- Float Ad -->

        <!-- footer_area (e) -->

        <!-- //Float Ad -->
      
	</footer>


</body>
</html>





