<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>문화재사이트</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- 폰트설정 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kirang+Haerang&display=swap" rel="stylesheet">
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
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="<%=path%>/resources/css/custom.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="<%=path%>/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Favicon-->
<link rel="shortcut icon" href="<%=path%>/resources/img/favicon.png">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="<%=path%>/resources/js/jquery-3.6.0.min.js"></script>
</head>

<body style="padding-top: 72px;">
	<header class="header">
		<nav
			class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<a class="navbar-brand py-1" href="<%=path%>"> <img
						src="<%=path%>/resources/img/photo/chalogo.png"
						alt="Directory logo">
					</a>
				</div>

				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarCollapse" >
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown"><a class="nav-link active"
							id="homeDropdownMenuLink" href="<%=path%>/index.do" aria-haspopup="true"
							aria-expanded="false"> <i class="fa fa-home" style="font-size: 2.0rem"></i>
						</a></li>
						<%if(loginMember == null){ %>
						<li class="nav-item"><a class="nav-link" style="font-size: 1.5rem"
							href="<%=path%>/login.do">로그인</a></li>
						<%} else { %>
						<li class="nav-item"><a class="nav-link" style="font-size: 1.5rem"
							href="<%=path%>/logOut.do">로그아웃</a></li>
						<%} %>
						
						<%if(loginMember != null){ %>
						<li class="nav-item"><a class="nav-link" style="font-size: 1.5rem"
							href="<%=path%>/mypage.do">마이페이지</a></li>
							<%} %>
						<li class="nav-item"><a class="nav-link" style="font-size: 1.5rem"
							href="<%=path%>/culList">문화재검색</a></li>
						<li class="nav-item"><a class="nav-link" style="font-size: 1.5rem"
							href="<%=path%>/museum">박물관검색</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=path%>/boardlist?cid=1" style="font-size: 1.5rem" >게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=path%>/views/quiz/quizlist.jsp" style="font-size: 1.5rem" >퀴즈</a></li>
						<li class="nav-item"><a class="nav-link" style="font-size: 1.5rem"
							href="<%=path%>/views/dokam/dokam.jsp">나의 도감</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>