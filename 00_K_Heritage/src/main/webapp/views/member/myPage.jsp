<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/common/header.jsp"%>

<!-- 이거 추가함 -->
<head>
   <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" type="text/css">
</head> 
<!--  -->

<section class="py-5">
	<div class="container">
		<!-- Breadcrumbs -->

		<h1 class="hero-heading mb-0">마이페이지</h1>
		<p class="text-muted mb-5">여기서 개인 정보 및 설정을 관리합니다.</p>
		<div class="row">
			<div class="col-lg-7 mb-5 mb-lg-0">
				<div class="text-block">
					<div class="row mb-3">
						<div class="col-sm-9">
							<h4>회원 등급</h4>

							<div>
							
							<%if(loginMember.getMembershipClass().equals("1")){ %>
								<img class="p2img" src="<%=path%>/resources/img/photo/Personal2img.jpg"> 
								<img class="p1img" src="<%=path%>/resources/img/photo/Personal1img.jpg"style="opacity: 0.5;"> 
								<img class="p3img" src="<%=path%>/resources/img/photo/Personal3img.jpg" style="opacity: 0.5;">
								<%} else if(loginMember.getMembershipClass().equals("2")){ %>
								<img class="p2img" src="<%=path%>/resources/img/photo/Personal2img.jpg"style="opacity: 0.5;"> 
								<img class="p1img" src="<%=path%>/resources/img/photo/Personal1img.jpg" > 
								<img class="p3img" src="<%=path%>/resources/img/photo/Personal3img.jpg" style="opacity: 0.5;">
								<%} else{%>
								<img class="p2img" src="<%=path%>/resources/img/photo/Personal2img.jpg" style="opacity: 0.5;"> 
								<img class="p1img" src="<%=path%>/resources/img/photo/Personal1img.jpg" style="opacity: 0.5;"> 
								<img class="p3img" src="<%=path%>/resources/img/photo/Personal3img.jpg">
								<%} %>
							</div>

							<br>

						</div>
						<br>
						<div>
						
						<% if(loginMember.getMembershipClass().equals("1")){%>
						<p class="text-muted mb-5"><%=loginMember.getUName()%>님의 회원 등급은 평민 입니다.</p>
						<% } %>
						
						<% if(loginMember.getMembershipClass().equals("2")){%>
						<p class="text-muted mb-5"><%=loginMember.getUName()%>님의 회원 등급은 상인 입니다.</p>
						<% } %>	
						
						<% if(loginMember.getMembershipClass().equals("3")){%>
						<p class="text-muted mb-5"><%=loginMember.getUName()%>님의 회원 등급은 양반 입니다.</p>
						<% } %>						
						
						</div>
						<br>
						<div class="col-sm-9">
							<h4>회원 세부정보</h4>
						</div>
						<br>
						<div class="col-sm-3 text-end">
							<button class="btn btn-link ps-0 text-primary-bs collapsed"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#personalDetails" aria-expanded="false"
								aria-controls="personalDetails"
								style="color: rgba(245, 185, 144);">정보 수정하기</button>
						</div>
					</div>
					<p class="text-sm text-muted">
						<i class="fa fa-id-card fa-fw me-2"></i><%=loginMember.getUName()%><span
							class="mx-2"> | </span><i class="fa fa-thin fa-venus-mars me-2"></i><%=loginMember.getGender()%><br>
						<i class="fa fa-envelope-open fa-fw me-2"></i><%=loginMember.getUEmail()%>
						<span class="mx-2"> | </span> <i class="fa fa-phone fa-fw me-2"></i><%=loginMember.getUTel()%>
					</p>
					<div class="collapse" id="personalDetails">
						<form name="memberupdate" action="<%=path%>/memberUpdate.do" method="POST">
							<div class="row pt-4">
								<div class="mb-4 col-md-6">
									<label class="form-label" for="name">FULL NAME</label> 
									<input class="form-control" type="text" name="UName" id="name" value="<%=loginMember.getUName()%>">
								</div>
								<div class="mb-4 col-md-6">
									<label class="form-label" for="gender">GENDER</label> <select
										class="selectpicker form-control" name="gender" id="gender"
										data-style="btn-selectpicker">
										<option value="">성별</option>
										<option value="남성">남자</option>
										<option value="여성">여자</option>
									</select>
									<!-- <input class="form-control" type="text" name="name" id="name" value="김경섭"> -->
								</div>
								<div class="mb-4 col-md-6">
									<label class="form-label" for="password">PASSWORD</label> <input
										class="form-control" type="password" name="UPw" id="password"
										value="<%=loginMember.getUPw()%>">
								</div>
								<div class="mb-4 col-md-6">
									<label class="form-label" for="phone">PHONE NUMBER</label> <input
										class="form-control" type="text" name="UTel" id="phone"
										value="<%=loginMember.getUTel()%>">
								</div>
								<div class="mb-4 col-md-6">
									<label class="form-label" for="cpassword">CONFIRM YOUR
										PASSWORD</label> <input class="form-control" type="password"
										name="UPw" id="cpassword" value="<%=loginMember.getUPw()%>">
								</div>
								<div class="mb-4 col-md-6">
									<label class="form-label" for="email">IDENTIFICATION
										EMAIL</label> <input class="form-control" type="email" name="UEmail"
										id="email" value="<%=loginMember.getUEmail()%>">
								</div>
								<div style="text-align: center;">
									<button class="btn btn-outline-primary-bs1 mb-4" type="submit">회원정보 저장하기</button>
									<button class="btn btn-outline-primary-bs2 mb-4" type="submit">회원탈퇴</button>
									<hr>
								</div>
							</div>
						</form>						
					</div>
				</div>

			</div>
			<div class="col-md-8 col-lg-4 ms-lg-auto">
				<div class="card border-0 shadow">
					<div class="card-header bg-primary-light1 py-4 border-0">
						<div class="d-flex align-items-center">
							<div>
								<h4 class="h6 subtitle text-smm text-primarym textcenter">나의 박물관 조회</h4>

								<!-- <i class="fa fa-thin fa-landmark"></i> -->

							</div>
							<svg
								class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-primarycm2 flex-shrink-0">
                    <use xlink:href="#identity-1"> </use>
                  </svg>
						</div>
					</div>
					<div class="card-body p-4">
						<div style="text-align: center;">
							<button class="btn btn-outline-primary-mi mb-4" type="button" onClick="location.href='<%=path%>/views/reservation/mu_favorite_reservation.jsp'">박물관 즐겨찾기 & 예약내역&nbsp;></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	$(document).ready(() => {
		$("#deleteMember").on("click", (e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('<%= request.getContextPath() %>/delete');
			}
		});
	});
</script>

<%@ include file="/views/common/footer.jsp"%>