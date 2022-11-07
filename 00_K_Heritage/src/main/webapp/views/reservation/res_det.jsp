<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!-- Map-->
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>
<!-- Available tile layers-->
<script src="<%=path%>/resources/js/map-layers.js" > </script>

<script src="<%=path%>/resources/js/map-detail.js" ></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-7 col-xl-5 px-4 pb-4 ps-xl-5 pe-xl-5">
			<section class="mx-n4 mx-xl-n5 mb-4 mb-xl-5">
				<!-- Slider main container-->
				<div class="swiper-container booking-detail-slider">
					<!-- Additional required wrapper-->

					<div class="swiper-pagination swiper-pagination-white"></div>
					<div class="swiper-button-prev swiper-button-white"></div>
					<div class="swiper-button-next swiper-button-white"></div>
				</div>
			</section>
			<!-- Breadcrumbs -->
			<div class="text-block">
				<h1 class="hero-heading mb-3">국립중앙박물관</h1>
				<img class="museumimg border-radius-bs"
					src="<%=path%>/resources/img/photo/muimg.jpg">
			</div>


			<div class="text-block">
				<h6 class="mb-2">날짜 & 시간</h6>
				<div class="row mb-3">
					<div class="col-md-6 d-flex align-items-center mb-3 mb-md-0">
						<p class="text-muted">
							2022.08.22<br>PM 3:00 - PM 6:00
						</p>
					</div>
				</div>
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>주소</h6>
						<p class="text-muted">
							용산동6가 168-6 04383 서울시 용산구 서빙고로 137<br>(용산동6가 168-6)
						</p>
					</div>

				</div>
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>번호</h6>
						<p class="text-muted">
							02-2077-9000<br>(용산동6가 168-6)
						</p>
					</div>

				</div>
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>가격</h6>
						<p class="text-muted">₩ 25,000</p>
					</div>
				</div>
			</div>

			<div style="text-align: center;">
				<br>
				<button class="btn btn-outline-primary-ms2 mb-4" type="submit">예약
					취소</button>
			</div>

			<div class="text-blockbs">
				<div class="row">
					<div class="col-sm">
						<h6>교통 안내 정보</h6>
						<p class="text-muted">지하철</p>

						<img class="line4 mb-2"
							src="<%=path%>/resources/img/photo/fourline.jpg">
						<img class="lineC mb-2"
							src="<%=path%>/resources/img/photo/centerline.png">

						<p class="text-muted">
							이촌역 2번 출구 방향 '박물관 나들길’ &lt; - &gt; 박물관 서문<br> 이촌역 2번 출구 &lt;
							- &gt; 박물관 서문<br> ※ 엘리베이터 이용안내 : 이촌역 1번 출구,<br> 이촌역 2번출
							구 방향 '박물관 나들길' 에 위치
						</p>
						<h6 class="mb-1">기타노선</h6>
					</div>
				</div>
			</div>

			<div class="text-blockbs2">
				<div class="d-flex align-items-center justify-content-between">
					<div>
						<p class="text-muted mt-2 mb-0">
							<img class="line1"
								src="<%=path%>/resources/img/photo/oneline.jpg">
							용산역 하자 -> 경의중앙선 환승 -> 이촌역 하차
						</p>
					</div>
				</div>
			</div>

			<div class="text-blockbs2">
				<div class="row">
					<p class="text-muted mt-0 mb-0">
						<img class="line3"
							src="<%=path%>/resources/img/photo/threeline.jpg">
						옥수역 하차 -> 경의중앙선 환승 -> 이촌역 하차
					</p>
				</div>
			</div>

			<div class="text-blockbs2">
				<div class="row">
					<div class="col">
						<p class="text-muted mt-0 mb-0">
							<img class="line6"
								src="<%=path%>/resources/img/photo/sixline.jpg">
							삼각지역 환승 -> 이촌역 하차
						</p>
					</div>
				</div>
			</div>

			<div class="text-blockbs2">
				<div class="row">
					<div class="col">
						<p class="text-muted mt-0 mb-0">
							<img class="line7"
								src="<%=path%>/resources/img/photo/sevenline.jpg">
							총신대입구(이수)역 환승 -> 이촌역 하차
						</p>
					</div>
				</div>
			</div>

			<div class="text-blockbs2">
				<div class="row">
					<div class="col">
						<p class="text-muted mt-0 mb-0">
							<img class="line9"
								src="<%=path%>/resources/img/photo/nineline.png">
							동작역 환승 -> 이촌역 하차
						</p>
					</div>
				</div>
			</div>

			<!-- ///////////////////////////////////////////////////////////////////// -->

			<div class="text-block d-print-none">
				<button class="btn btn-link ps-0" onclick="window.print()">
					<i class="fa fa-print me-2"></i>Print
				</button>
			</div>
		</div>
		
		<div class="col-lg-5 col-xl-7 map-side-lg px-lg-0">
			<div  id="map" class="border-radius-bs" style="height: 1000px"></div>
			 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20ac2dfad3cd59b659261a28d8b4c104"></script>
    				<script>
						var container = document.getElementById('map');
						var options = {
		            	center: new kakao.maps.LatLng(37.52470233,126.9777412),
		            		level: 3
		    		   	};

				        var map = new kakao.maps.Map(container, options); // 지도 생성
					       
				   	    // 마커가 표시될 위치입니다 
				        var markerPosition  = new kakao.maps.LatLng(37.52470233,126.9777412); 
				       
				        // 마커 생성
					    var marker = new kakao.maps.Marker({
					    	position: markerPosition
					    });
				       
				  	    // 마커가 지도 위에 표시되도록 설정합니다
				     	marker.setMap(map);
					</script>
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>