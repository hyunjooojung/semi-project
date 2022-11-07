<%@page import="Museum.Museum"%>
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
Museum m = (Museum)request.getAttribute("museum");
%>

<section>
	<!-- Slider main container-->
	<div class="swiper-container detail-slider slider-gallery">
		<!-- Additional required wrapper-->
		<div class="swiper-wrapper">
			<!-- Slides-->

			<!-- 사진수정 -->

			<div class="swiper-slide">
				<a href="<%=path%>/resources/img/photo/9.jpg" data-toggle="gallery-top" title="국립중앙박물관">
				<img class="img-fluid"src="<%=path%>/resources/img/photo/9.jpg" alt="국립중앙박물관"></a>
			</div>
			<div class="swiper-slide">
				<a href="<%=path%>/resources/img/photo/mu2.jpg" data-toggle="gallery-top" title="국립중앙박물관">
				<img class="img-fluid"src="<%=path%>/resources/img/photo/mu2.jpg" alt="국립중앙박물관"></a>
			</div>
			<div class="swiper-slide">
				<a href="<%=path%>/resources/img/photo/mu3.jpg" data-toggle="gallery-top" title="국립중앙박물관">
				<img class="img-fluid"src="<%=path%>/resources/img/photo/mu3.jpg" alt="국립중앙박물관"></a>
			</div>
			<div class="swiper-slide">
				<a href="<%=path%>/resources/img/photo/9.jpg" data-toggle="gallery-top" title="국립중앙박물관">
				<img class="img-fluid"src="<%=path%>/resources/img/photo/9.jpg" alt="국립중앙박물관"></a>
			</div>
			<div class="swiper-slide">
				<a href="<%=path%>/resources/img/photo/mu2.jpg" data-toggle="gallery-top" title="국립중앙박물관">
				<img class="img-fluid"src="<%=path%>/resources/img/photo/mu2.jpg" alt="국립중앙박물관"></a>
			</div>
			<div class="swiper-slide">
				<a href="<%=path%>/resources/img/photo/mu3.jpg" data-toggle="gallery-top" title="국립중앙박물관">
				<img class="img-fluid"src="<%=path%>/resources/img/photo/mu3.jpg" alt="국립중앙박물관"></a>
			</div>
		</div>
		<div class="swiper-pagination swiper-pagination-white"></div>
		<div class="swiper-button-prev swiper-button-white"></div>
		<div class="swiper-button-next swiper-button-white"></div>
	</div>
</section>

<div class="container py-5">
	<div class="row">
		<div class="col-lg-8">


		<div class="text-block">
				<h1 class="hero-heading mb-3"><%=m.getFcltyNm()%></h1>
				<img class="museumimg border-radius-bs"
					src="<%=path%>/resources/img/photo/mu1.jpg">
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>관람시간</h6>
						
						<p class=" text-sm mb-0"></p>
						<p class="text-muted">
						
						평일 : <%=m.getWeekdayOperOpenHhmm() %> ~ <%=m.getWeekdayOperColseHhmm() %>
						<br>
						공휴일 : <%=m.getHolidayOperOpenHhmm() %> ~ <%=m.getHolidayCloseOpenHhmm() %>
						</p>
					</div>
				</div>
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>휴관일 및 휴실일</h6>
						<p class=" text-sm mb-0"></p>
						<p class="text-muted">
							<%=m.getRstdeInfo() %>
						</p>
					</div>
				</div>
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>관람료</h6>

						<br>

						<p class="text-muted">
							<%=m.getEtcChrgeInfo() %>
						</p>

						<br>

					</div>
				</div>
			</div>

			<div class="text-block">
				<div class="row">
					<div class="col-sm">
						<h6>박물관 관람시 유의사항</h6>
						<p class="text-muted">
							마스크 착용 및 체온 측정 등 방역지침을 준수해주시기 바랍니다.<br> 박물관의 모든 공간은 금연구역입니다.<br>
							음식물 반입과 안내견 이외의 애완동물(또는 반려동물)의 출입은 금지되어 있습니다.<br> 전시실 입장 전에,
							휴대전화는 전원을 꺼주시거나 진동으로 전환하여 주십시오.<br> 전시관에서는 정숙해 주시고 뛰어다니는 행위는
							삼가시길 바랍니다.<br> 박물관내에서는 바퀴달린 신발을 신은 고객은 입장이 불가합니다.<br>
							전시물에 손을 대거나 손상을 입힐 수 있는 행위는 절대 삼가 주십시오.<br> 플래시/삼각대/셀카봉/짐벌
							등을 이용한 촬영과 상업적 용도를 위한 촬영은 금지되어 있습니다.<br> 야외 관람로에서는 자전거, 킥보드,
							인라인스케이트, 스케이트보드 등을 이용할 수 없습니다.<br> 슬리퍼 등 정숙한 관람을 해치는 복장은
							자제하여 주시기 바랍니다.
						</p>
					</div>
				</div>
			</div>

			<!-- /////////////////////////////////////////////////////////////// -->

		</div>
		<div class="col-lg-4">
			<div class="p-4 shadow ms-lg-4 rounded sticky-top"
				style="top: 100px;">
				<p class="text-muted">
					<span class="text-black h2">₩ 23,000 
				</p>

				<hr class="my-4">
				<form class="form" id="booking-form" method="get" action="#"
					autocomplete="off">
					<div class="mb-4">
						<label class="form-label" for="bookingDate">* 날짜</label>
						<div class="datepicker-container datepicker-container-right">
							<input class="form-control" type="text" name="bookingDate"
								id="bookingDate" placeholder="선택" required="required">
						</div>
					</div>



					<div class="mb-4">
						<label class="form-label" for="pnum">* 인원</label>
						<div>
							<table>
								<tr style="text-align: center;">
									<td>성 인</td>
									<td><input class="btn-mg" type="button"
										onclick='count("minus",1)' value="-" /></td>
									<td id="result1" name="result1">0</td>
									<td><input class="btn-mg" type="button"
										onclick='count("plus",1)' value="+" /></td>
								</tr>
								<tr style="text-align: center;">
									<td>청소년</td>
									<td><input class="btn-mg" type="button"
										onclick='count("minus",2)' value="-" /></td>
									<td id="result2" name="result2">0</td>
									<td><input class="btn-mg" type="button"
										onclick='count("plus",2)' value="+" /></td>
								</tr>

								<tr style="text-align: center;">
									<td>유 아</td>
									<td><input class="btn-mg" type="button"
										onclick='count("minus",3)' value="-" /></td>
									<td id="result3" name="result3">0</td>
									<td><input class="btn-mg" type="button"
										onclick='count("plus",3)' value="+" /></td>

								</tr>
							</table>
						</div>
					</div>
					<div class="d-grid mb-4">
						<button class="btn btn-primarybtnbs" type="submit">예약하기</button>
					</div>
				</form>

				<hr class="my-4">
				<div class="text-center">
					<p>
						<a class="text-orange text-sm" href="#"> <i
							class="fa fa-heart"></i> Bookmark This Listing
						</a>
					</p>
					<p class="text-muted text-sm">79 people bookmarked this place</p>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
	function count(type, cnt) {
		const result = document.getElementById('result' + cnt)

		let number = result.innerText;

		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else {
			if (number === '0') {
				number = 0;
			} else {
				number = parseInt(number) - 1;
			}
		}
		result.innerText = number;
	}
</script>