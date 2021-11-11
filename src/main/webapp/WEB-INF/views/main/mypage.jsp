<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO vo = (MemberVO)session.getAttribute("vo");
%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
   		<title>Document</title>
   		
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    	
		<link rel="stylesheet"
			  href="${ pageContext.request.contextPath }/resources/css/main.css">
			  
		<link rel="stylesheet"
			  href="${ pageContext.request.contextPath }/resources/css/reset.css">
			  
		<link rel="stylesheet"
			  href="${ pageContext.request.contextPath }/resources/css/header.css">		
			  
	 	<link rel="stylesheet" 
	 		  href="${ pageContext.request.contextPath }/resources/fonts/css/material-design-iconic-font.min.css">
		 	
		<style>
			#main{
				height:1000px;
				border-bottom:1px solid gray;
			}
			
			footer{
				margin-top: 500px;
				border-top: 1px solid gray;
			}
			
		</style>
	</head>
	<body>
	
		 <div class="header-nav-wrapper">
         <header class="header">
            <div class="header-inner">
                <div><button><i class="zmdi zmdi-apps"></i><span>&nbsp;CGV APP</span></button></div>
                <div><button><i class="zmdi zmdi-facebook-box"></i><span>&nbsp;Like</span></button></div>
                <div><button><i class="zmdi zmdi-instagram"></i><span>&nbsp;follow</span></button></div>
			</div>
			 <div class="header-inner">
				  <% if(vo != null){
                	%>
                	<div><button><%=vo.getName()%>님 환영합니다</button></div>
                	<div><a href="mypage.do"><button style="border-bottom:2px solid black;">마이페이지</button></a></div>
                	<div><a href="logout.do"><button>로그아웃</button></a></div>
                	<%
                } else {
                	%>
                	<div><a href="login_form.do"><button>로그인</button></a></div>
                	<div><a href="newmember.do"><button>회원가입</button></a></div>
                	<%
                }
                %> 
			</div>
	
		</header>
		 <nav class="nav-wrapper">
            <div class="logo-wrapper"><a href="main.do">
            	<img class="cgvLogo" src="${ pageContext.request.contextPath }/resources/images/cgv.png"></a>
            </div>
            <div class="nav-content">
                <div class="movieLogo-wrapper">
                	<img class="cgvMovie" src="${ pageContext.request.contextPath }/resources/images/h2_movie.png">
                </div>
                <div class="nav-inner">
                    <div><button style="border-bottom:4px solid black;"><a href="main.do">영화</a></button></div>
                    <div><button><a href="list.do">예매</a></button></div>
                    <div><button>극장</button></div>
                    <div><button>이벤트&컬쳐</button></div>
                    <div class="search-wrapper"><input><button class="searchButton">검색</button></div>
                </div>
            </div>
            <div></div>
            <div></div>
        </nav>
        </div>
        
        <div>
	        <div class="content-header-container">
	            <div class="content-header-wrapper">
	                <div class="content-header-title">무비 차트</div>
	                <div class="content-header-menu">
	                    <div class="chart"><button class="selectedMenu">무비차트</button></div>
	                    <div class="movie-notice"><button>상영예정작</button></div>
	                    <div class="movie-house"><button>CGV아트하우스</button></div>
	                </div>
	            </div>
	            <div class="movie-infomation-wrapper">
	            </div>
	      	</div>
        </div>
      
      	<div style=" text-align:center; background-color:gray; color:white" > 예약한 영화 목록 </div><br><br><br>
      
      
      	 <c:forEach var="value" items="${sessionScope.reservationlist}" varStatus="cnt">
			<div class="movie-informaion" style="border: 1px solid gray;">
				<div class="movie-rank">No.${cnt.index+1 }</div>
				<br>
				<div>
					<div class="moviedate">날짜 : ${reservationlist.get(cnt.index).getReserveDate()}</div>
					<div class="movietheater">영화관 장소 : ${reservationlist.get(cnt.index).getSelectedTheater()}</div>
					<div class="movietitle">영화이름 : ${reservationlist.get(cnt.index).getTitle()}</div>
					<div class="movietime">영화시간 : ${reservationlist.get(cnt.index).getRunningTime()}</div>
					<div class="movietime">영화좌석 : ${reservationlist.get(cnt.index).getSelectedSeat()}</div>
					
					<br>
	
				</div>
			</div>

		</c:forEach>

     	       
      
    
	
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