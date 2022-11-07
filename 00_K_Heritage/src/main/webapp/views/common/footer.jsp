<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Footer-->
<footer class="position-relative z-index-10 d-print-none">
	<!-- Main block - menus, subscribe form-->
	<div class="py-6 bg-gray-200 text-muted">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="fw-bold text-uppercase text-dark mb-3">고객센터 C/S Center</div>
					<p>Tel: 02.5555.5555</p>
					<p>Fax: 02.5555.0000</p>
					<p>Email: rlaqhtjd789@naver.com</p>
					<p>KakaoTalk ID: team5</p>
					<p>오전 9시부터 오후 6시까지 상담가능합니다.</p>
					<br>
					<ul class="list-inline">
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="twitter"><i class="fab fa-twitter"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="facebook"><i class="fab fa-facebook"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="instagram"><i class="fab fa-instagram"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="pinterest"><i class="fab fa-pinterest"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="vimeo"><i class="fab fa-vimeo"></i></a></li>
					</ul>
				</div>
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h6 class="fw-bold text-uppercase text-dark mb-3">회사정보</h6>
					<p>상호: 문화재청</p>
					<p>대표: 김경섭,김보성,노유정,신무균,정현주</p>
					<p>주소: 서울 강남구</p>
					<p>개인정보관리 책임자: 이해성 (dlgotjd@culture.com)</p>
					<p>사업자 등록번호: 2022.08.0716</p>
					
					<!-- 주석
					
					<ul class="list-unstyled">
						<li><a class="text-muted" href="index.html">상호: 문화재청</a></li>
						<li><a class="text-muted" href="category-rooms.html">로그인</a></li>
						<li><a class="text-muted" href="category-2-rooms.html">문화재검색</a></li>
						<li><a class="text-muted" href="category-3-rooms.html">박물관검색</a></li>
						<li><a class="text-muted" href="detail-rooms.html">게시판</a></li>
						<li><a class="text-muted" href="detail-rooms.html">퀴즈</a></li>
						<li><a class="text-muted" href="detail-rooms.html">나의 도감</a></li>
					</ul>
					
					-->
					
				</div>
				<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
					<h6 class="fw-bold text-uppercase text-dark mb-3">근무시간 정보</h6>
					<p>근무시간: 월 ~ 금 AM 9:00 ~ PM 7:00</p>
					<p>점심시간: PM12 :00 ~ PM 1 : 00</p>
					<p>고객센터: AM 10: 00 ~ PM6 : 00</p>
					
					<!-- 주석
	
					<ul class="list-unstyled">
						<li><a class="text-muted" href="compare.html">Comparison</a></li>
						<li><a class="text-muted" href="team.html">Team</a></li>
						<li><a class="text-muted" href="contact.html">Contact </a></li>
					</ul>
					
					-->					
				</div>
			</div>
		</div>
	</div>
	<!-- Copyright section of the footer-->
	<div class="py-4 fw-light bg-gray-800 text-gray-300">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 text-center text-md-start">
					<p class="text-sm mb-md-0">&copy; 2022, Your company. All
						rights reserved.</p>
				</div>
				<div class="col-md-6">
					<ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
						<li class="list-inline-item"><img class="w-2rem"
							src="<%=request.getContextPath() %>/resources/img/visa.svg" alt="..."></li>
						<li class="list-inline-item"><img class="w-2rem"
							src="<%=request.getContextPath() %>/resources/img/mastercard.svg" alt="..."></li>
						<li class="list-inline-item"><img class="w-2rem"
							src="<%=request.getContextPath() %>/resources/img/paypal.svg" alt="..."></li>
						<li class="list-inline-item"><img class="w-2rem"
							src="<%=request.getContextPath() %>/resources/img/western-union.svg" alt="..."></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- JavaScript files-->
<script>
	// ------------------------------------------------------- //
	//   Inject SVG Sprite - 
	//   see more here 
	//   https://css-tricks.com/ajaxing-svg-sprite/
	// ------------------------------------------------------ //
	function injectSvgSprite(path) {

		var ajax = new XMLHttpRequest();
		ajax.open("GET", path, true);
		ajax.send();
		ajax.onload = function(e) {
			var div = document.createElement("div");
			div.className = 'd-none';
			div.innerHTML = ajax.responseText;
			document.body.insertBefore(div, document.body.childNodes[0]);
		}
	}
	// to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
	// use your own URL in production, please :)
	// https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
	//- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
	injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
</script>
<!-- jQuery-->
<script
	src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
<script
	src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Magnific Popup - Lightbox for the gallery-->
<script
	src="<%=request.getContextPath()%>/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Smooth scroll-->
<script
	src="<%=request.getContextPath()%>/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Bootstrap Select-->
<script
	src="<%=request.getContextPath()%>/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script
	src="<%=request.getContextPath()%>/resources/vendor/object-fit-images/ofi.min.js"></script>
<!-- Swiper Carousel                       -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script>
	var basePath = ''
</script>
<!-- Main Theme JS file    -->
<script src="<%=request.getContextPath()%>/resources/js/theme.js"></script>
</body>

</html>