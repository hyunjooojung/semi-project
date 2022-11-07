<%@page import="main.MainVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!-- 이거 추가함 -->
<head>
   <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" type="text/css">
</head> 
<!--  -->

<%
int cnt = 9;
List<MainVO> todaylist = (List<MainVO>)request.getAttribute("todaylist");
List<MainVO> poplist = (List<MainVO>)request.getAttribute("poplist");
%>

<section class="hero-home">
	<div class="swiper-container hero-slider">
		<div class="swiper-wrapper">
			<div class="swiper-slide"
				style="background-image:url(<%=path%>/resources/img/photo/mainimg.PNG)"></div>
			<!-- <div class="swiper-slide" style="background-image:url(img/photo/photo-1519974719765-e6559eac2575.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(img/photo/photo-1490578474895-699cd4e2cf59.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(img/photo/photo-1534850336045-c6c6d287f89e.jpg)"></div> -->
		</div>
	</div>
	<div class="container py-6 py-md-7 text-black z-index-20">
		<div class="row">
			<div class="col-xl-10">
				<div class="text-center text-lg-start">
					<h1 class="display-3 fw-bold text-shadow text-orange">문화재</h1>
					<h1 class="display-3 fw-bold text-shadow">도감</h1>
					<p class="subtitle letter-spacing-4 mb-2 text-black text-shadow">전국
						곳곳에 숨겨진 우리 역사 찾기</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="py-4-bs1">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<p class="text-orange subtitle">다양한 문화재를 확인하세요</p>
				<h2>문화재</h2>
			</div>
			<div
				class="col-md-4 d-lg-flex align-items-center justify-content-end">
				<a class="text-muted text-sm" href="<%=path%>/culList"> 더 보기<i
					class="fas fa-angle-double-right ms-2"></i>
				</a>
			</div>
		</div>
		<div class="swiper-container guides-slider mx-n2 pt-3">
			<!-- Additional required wrapper-->
			<div class="swiper-wrapper pb-5">
				<!-- Slides-->
				
				<!-- 오늘의 문화재 -->
				<% for(MainVO m : todaylist) { %>
				<div class="swiper-slide h-auto px-2">
					<div
						class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
						<a class="tile-link" href="<%=path%>/cul_di?CcbaMnm1=<%=m.getCcbaMnm1()%>"></a>
						<img class="bg-image" src="<%=m.getImageUrl() %>" alt="Card image">
						<div class="card-body overlay-content">
							<h6 class="card-title text-shadow text-uppercase"><%=m.getCcbaMnm1() %></h6>
						</div>
					</div>
				</div>
				<%} %>
			</div>
			<div class="swiper-pagination d-md-none"></div>
		</div>
	</div>
</section>

<section class="py-4-bs2">
	<div class="container">
		<div class="row">
			<p class="subtitle text-orange">오늘의 소식을 확인하세요</p>
			<h2 class="mb-3">공지 사항</h2>
		</div>
		<div class="row">
			<div class="col-sm-6 col-lg-3 mb-3 mb-lg-0">
				<div class="px-0 pe-lg-3">
					<div class="icon-rounded mb-3 bg-secondary-light">
						<svg class="svg-icon w-2rem h-2rem text-secondary">
                    <use xlink:href="#checkmark-2"> </use>
                  </svg>
					</div>
					<h3 class="h6 text-uppercase">어린이날 고궁 무료입장</h3>
					<p class="text-muted text-sm">문화유산 확대를 위해 이번 어린이날에는 궁능 전면
						무료입장으로 …</p>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3 mb-3 mb-lg-0">
				<div class="px-0 pe-lg-3">
					<div class="icon-rounded mb-3 bg-primary-light">
						<svg class="svg-icon w-2rem h-2rem text-primary">
                    <use xlink:href="#checkmark-2"> </use>
                  </svg>
					</div>
					<h3 class="h6 text-uppercase">2022년 문화재 교육 프로그램 인증 공고</h3>
					<p class="text-muted text-sm">우수한 프로그램 인증을 통하여 문화재교육의 질적 수준을
						제고하고…</p>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3 mb-3 mb-lg-0">
				<div class="px-0 pe-lg-3">
					<div class="icon-rounded mb-3 bg-secondary-light">
						<svg class="svg-icon w-2rem h-2rem text-secondary">
                    <use xlink:href="#checkmark-2"> </use>
                  </svg>
					</div>
					<h3 class="h6 text-uppercase">청와대 국민 품으로 100만명 돌파</h3>
					<p class="text-muted text-sm">청와대 관람객이 개방 44일 만에 100만 명을 돌파했다…</p>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3 mb-3 mb-lg-0">
				<div class="px-0 pe-lg-3">
					<div class="icon-rounded mb-3 bg-primary-light">
						<svg class="svg-icon w-2rem h-2rem text-primary">
                    <use xlink:href="#checkmark-2"> </use>
                  </svg>
					</div>
					<h3 class="h6 text-uppercase">2021년 문화재지킴이 전국대회 행사 개최</h3>
					<p class="text-muted text-sm">‘문화재지킴이 운동’은 국민이 직접 문화재를 자발적으로
						가꾸고 지키고자…</p>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Divider Section-->
<section class="py-4-bs3 position-relative dark-overlay">
	<img class="bg-image"
		src="<%=path%>/resources/img/photo/6.jpg" alt="">
	<div class="container">
		<div class="overlay-content text-white py-lg-5">
			<h3 class="display-3 fw-bold text-serif text-shadow mb-5">The
				Korea Heritage</h3>
			<h3 class="display-3 fw-bold text-serif text-shadow mb-5">Night
				View.</h3>
			<a class="btn mg-btn-light" href="category-rooms.html">바로가기</a>
		</div>
	</div>
</section>

<%-- 인기박물관 소개 배너 --%>
<section class="py-4-bs1 bg-gray-100">
	<div class="container"><div class="row mb-4"><div class="col-md-8">
				<h2>박물관</h2><p class="subtitle text-orange">7월의 인기 박물관</p></div>
			<div class="col-md-4 d-md-flex align-items-center justify-content-end">
				<a class="text-muted text-sm" href="<%=path%>/museum"> 더 보기
				<i class="fas fa-angle-double-right ms-2"></i></a></div></div><div class="row">

			<%-- 인기박물관 소개 상세 / photo(9~10) --%>
			<% for(MainVO m : poplist) { %>
			<div class="col-lg-4 col-sm-6 mb-4 hover-animate">
				<div class="card shadow border-0 h-100">
						<a href="<%=path%>/museuminfo?MuseumCd=<%=m.getMuseumCd()%>">
							<img class="img-fluid card-img-top"	src="<%=path%>/resources/img/photo/<%=cnt++%>.jpg" alt="..." />
						</a>
					<div class="card-body">
						<h5 class="my-2">
							<a class="text-dark" href="<%=path%>/museuminfo?MuseumCd=<%=m.getMuseumCd()%>"><%=m.getFcltyNm() %></a>
						</h5>
						<p class="text-gray-500 text-sm my-3"><i class="far fa-map me-2"></i><%=m.getAreadr() %></p>
						<p class="my-2 text-muted text-sm">운영시간(평일) : <%=m.getWeekdayOperOpenHhmm() %> ~ <%=m.getWeekdayOperColseHhmm() %> </p>
						<p class="my-2 text-muted text-sm">운영시간(주말) : <%=m.getHolidayOperOpenHhmm() %> ~ <%=m.getHolidayCloseOpenHhmm() %></p>
						<a class="text-orange ps-0 btn" href="<%=path%>/museuminfo?MuseumCd=<%=m.getMuseumCd()%>">더 보기<i
							class="fa fa-long-arrow-alt-right ms-2"></i></a>
					</div>
				</div>
			</div>
			<% } %>

			<%-- 전체 데이터 소개 --%>
			<div class="col-lg-4 col-sm-6 mb-4 hover-animate">
				<div class="card shadow border-0 h-100">
					<div class="card-body">
						<h5 class="my-2">전국의 박물관∙미술관이 소장하고 있는</h5>
						<h5 class="my-2">다양한 문화유산을 만나보세요.</h5>
						<br>
						<br>
						<h1 class="text-orange">
							&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=path %>/resources/img/photo/7.png"></img>
							&nbsp;&nbsp;&nbsp;&nbsp; 331</h1>
						<p class="my-2 text-muted text-sm">소장품 보유 기관</p>
						<br>
						<h1 class="text-orange">
							&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=path %>/resources/img/photo/8.png"></img>
							&nbsp;&nbsp;&nbsp;&nbsp; 2,360,170</h1>
						<p class="my-2 text-muted text-sm">&nbsp;&nbsp;&nbsp;&nbsp;전체 소장품</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%-- footer 상단 이미지 --%>
<section class="">
	<div class="container-fluid px-0">
		<div class="swiper-container instagram-slider">
			<div class="swiper-wrapper">
			<% for(int i=0; i<20; i++) { %>
			 <% for(int insta=1; insta<7; insta++) { %>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="<%=path %>/resources/img/instagram/instagram_11 (<%=insta%>).png" alt=" "></a>
				</div>
				<% }%>
				<%} %>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>