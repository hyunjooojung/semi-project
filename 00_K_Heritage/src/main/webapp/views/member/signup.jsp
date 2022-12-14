<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
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
	href="<%=request.getContextPath()%>/resources/vendor/nouislider/nouislider.css">
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
	href="<%=request.getContextPath()%>/resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/favicon.png">

<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="<%=path%>/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
</head>


<body>
	<div class="container-fluid px-3">
		<div class="row min-vh-100">
			<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
				<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
					<div class="mb-4">
						<h2>????????????</h2>
					</div>
					<form class="form-validate" action="<%=path%>/enroll" method="post">
						<div class="mb-4">
							<label class="form-label" for="loginID"> ID</label> 
								<input class="form-control"
									name="loginID" id="loginID" type="text" required
									data-msg="???????????? ??????????????????"
									placeholder="????????????????????? ???????????????(aaaa@naver.com)">
								<input class="mt-2"type="button" id="checkDuplicate2" value="????????????"/> 

						</div>
						<div class="mb-4">
							<label class="form-label" for="loginPassword"> Password</label> <input
								class="form-control" name="loginPassword" id="loginPassword"
								type="password" required data-msg="??????????????? ??????????????????" onchange="check_pw()">
						</div>
						<div class="mb-4">
							<label class="form-label" for="loginPassword2"> Confirm
								your password</label> <input class="form-control" name="loginPassword2"
								id="loginPassword2" placeholder="PASSWORD" type="password"
								required data-msg="Please enter your password" onchange="check_pw()">
								<span id="check"></span>
						</div>
						<div class="mb-4">
							<label class="form-label" for="fullname"> FULL NAME</label> <input
								class="form-control" name="fullname" id="fullname" type="text"
								required data-msg="????????? ??????????????????">
						</div>
						<div class="mb-4">
							<label class="form-label" for="gender"> GENDER</label> <br>
							<select class="form-select" name="gender">
								<option selected>GENDER</option>
								<option value="??????">??????</option>
								<option value="??????">??????</option>
								<option value="??????">??????</option>
							</select>
						</div>
						<div class="mb-4">
							<label class="form-label" for="emailaddress">
								IDENTIFICATION EMAIL</label> <input class="form-control"
								name="emailaddress" id="emailaddress" placeholder="EMAIL INSERT"
								type="email" autocomplete="off" required data-msg="???????????? ??????????????????">
						</div>
						<div class="mb-4">
							<label class="form-label" for="phonenumber"> PHONE NUMBER</label>
							<input class="form-control" name="phonenumber" id="phonenumber"
								placeholder="NUMBER INSERT" type="text" autocomplete="off"
								required data-msg="??????????????? ??????????????????">
						</div>
						<div class="d-grid gap-2">
							<button class="btn btn-lg-yj btn-primary" type="submit">????????????</button>
						</div>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
						<div class="d-grid gap-2">
							<button
								class="btn btn btn-outline-muted-ka btn-block btn-social mb-3">
								<i class="btn-social-icon"><img class="trans1"
									src="<%=request.getContextPath()%>/resources/img/photo/kakao-talk.png"></i>????????????
								<span class="d-none d-sm-inline">?????????</span>
							</button>
							<button
								class="btn btn btn-outline-muted-na btn-block btn-social mb-3">
								<i class="btn-social-icon"><img class="trans2"
									src="<%=request.getContextPath()%>/resources/img/photo/naver.ico"></i>????????????
								<span class="d-none d-sm-inline">?????????</span>
							</button>
						</div>
						<hr class="my-4">
					</form>
				</div>
			</div>
			<div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block ">
				<!-- Image-->
				<div class="bg-cover h-100 me-n3 "
					style="background-image: url(<%=request.getContextPath()%>/resources/img/photo/loginimg.jpg); "></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		// ????????? ????????????
		$('#checkDuplicate2').click(()=>{
			let id = $('#loginID').val().trim();
			
			if(id.length < 4){
				alert('???????????? ?????? 4?????? ?????????.');
				return;
			}
			
			// ???????????? ?????? - AJAX
			const xhr = new XMLHttpRequest();
			xhr.open('get','${pageContext.request.contextPath}/checkId2?userId=' + id);
			
			// Callback ?????? ?????? = ????????? ??????, ?????????, ?????????
			xhr.onreadystatechange = ()=>{
				if(xhr.readyState == 4 && xhr.status == 200){
					if(xhr.responseText == 'used'){
						alert('????????? ????????? ?????????.');
						// html??? ???????????? ????????? ???????????? -> ?????????????????? ??????!!
					}else{
						alert('???????????? ???????????? ?????? ???????????????.');					
						// html??? ???????????? ????????? ???????????? -> ?????????????????? ??????!!
					}
				}
			};
			xhr.send();
		});	
		
		// ???????????? ????????????
        function check_pw(){
            var pw = document.getElementById('loginPassword').value;
         
            if(pw.length < 4 || pw.length>16){
                window.alert('??????????????? 4?????? ??????, 16?????? ????????? ?????? ???????????????.');
                document.getElementById('pw').value='';
            }
           
            if(document.getElementById('loginPassword').value !='' && document.getElementById('loginPassword2').value!=''){
                if(document.getElementById('loginPassword').value==document.getElementById('loginPassword2').value){
                    document.getElementById('check').innerHTML='??????????????? ???????????????.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='??????????????? ???????????? ????????????.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
    </script>

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