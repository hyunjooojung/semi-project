<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String saveId = "";
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
				break;
			}
		}
	}
%>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Directory Theme by Bootstrapious</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Price Slider Stylesheets -->
<link rel="stylesheet"
	href="<%=path%>/resources/vendor/nouislider/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
<!-- Google fonts - Poppins-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
<!-- swiper-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!-- Magnigic Popup-->
<link rel="stylesheet"
	href="<%=path%>/resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="<%=path%>/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet"
	href="<%=path%>/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon"
	href="<%=path%>/resources/img/favicon.png">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
</head>

<body>
<%if(loginMember == null){ %>
	<div class="container-fluid px-3">
		<div class="row min-vh-100">
			<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
				<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">

					<h2>로그인</h2>

					<form class="form-validate" method="post" action="<%=path%>/login">
						<div class="mb-4">
							<label class="form-label" for="loginUsername">ID</label> 
							<input
								class="form-control" name="loginUsername" id="loginUsername"
								type="email" placeholder="name@Koreanculture.com"
								autocomplete="off" required data-msg="Please enter your email" value="<%=saveId %>">
						</div>
						<div class="mb-4">
							<div class="row">
								<div class="col">
									<label class="form-label" for="loginPassword"> Password</label>
								</div>
<!-- 								<div class="col-auto"> -->
<!-- 									<a class="form-text small text-primary" href="#">비밀번호 찾기</a> -->
<!-- 								</div> -->
							</div>
							<input class="form-control" name="loginPassword"
								id="loginPassword" placeholder="Password" type="password"
								required data-msg="Please enter your password">
						</div>
						<div class="mb-4">
							<div class="form-check">
								<input class="form-check-input" id="loginRemember"
									type="checkbox" name=saveId <%= saveId.length() == 0 ? "": "checked" %>/><label
									class="form-check-label text-muted" for="loginRemember">
									<span class="text-sm">아이디 저장</span>
								</label>
							</div>
						</div>
						<!-- Submit-->
						<div class="d-grid">
							<button class="btn btn-lg btn-block btn-primary-cu">로그인</button>
						</div>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
						<div class="d-grid gap-2">
							<button
								class="btn btn btn-outline-muted-na btn-block btn-social mb-3">
								<i class="btn-social-icon"><img class="trans2"
									src="<%=request.getContextPath()%>/resources/img/photo/naver.ico"></i>네이버로
								<span class="d-none d-sm-inline">로그인</span>
							</button>
							<button
								class="btn btn btn-outline-muted-ka btn-block btn-social mb-3">
								<i class="btn-social-icon"><img class="trans1"
									src="<%=request.getContextPath()%>/resources/img/photo/kakao-talk.png"></i>카카오로
								<span class="d-none d-sm-inline">로그인</span>
							</button>
						</div>
						<hr class="my-4">
						<p class="text-center">
							<small class="text-muted text-center">계정이 없으신가요? <a
								href="<%=request.getContextPath()%>/views/member/signup.jsp">회원가입</a></small>
						</p>
					</form>
					<a class="close-absolute me-md-5 me-xl-6 pt-5"
						href="<%=request.getContextPath()%>"> <svg
							class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"></use>
              </svg>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
				<!-- Image-->
				<div class="bg-cover h-100 me-n3"
					style="background-image: url(<%=request.getContextPath()%>/resources/img/photo/loginimg.jpg);"></div>
			</div>
		</div>
	</div>
	<%} %>
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