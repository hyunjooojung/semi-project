<%@page import="Museum.Museum"%>
<%@page import="culture.CultureImgVo"%>
<%@page import="java.util.List"%>
<%@page import="culture.CultureDiVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<!-- 이거 추가함 -->
<head>
   <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" type="text/css">
</head> 
<!--  -->

<%
	List<CultureImgVo> list = (List<CultureImgVo>)request.getAttribute("img");
	List<CultureDiVo> list2 = (List<CultureDiVo>)request.getAttribute("surroundlist");
	List<Museum> mlist = (List<Museum>)request.getAttribute("surroundmlist");
	CultureDiVo c = (CultureDiVo)request.getAttribute("culture");
	int cnt = 1;
	int sCnt = 1;
	int mCnt = 0;
%>

<section class="py-5">
	<div class="container">
		<!-- Breadcrumbs -->

		<h1 class="hero-heading mb-3"><%=c.getCcbaMnm1() %></h1>
		<hr>

		<div class="mt-5 mb-3" style="text-align: center;">
		<%for(CultureImgVo img : list) {
			if(cnt++ == 4){
				cnt = 1;
				break;
			}
		%>
			<img class="shimg border-radius-bs" src=<%=img.getImageUrl() %>>
		<%} %>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-7 mb-5 mb-lg-0">
					<div class="text-block">
						<div class="row mb-3">


							<div class="text-block-cpd line-height-bs mt-2 mb-1">
								<div class="row">
									<div class="col-sm">
										<h6>Info</h6>
										<hr>
										<strong>명 칭</strong>				<%=c.getCcbaMnm1()%><br> 
										<strong>종 목</strong>				<%=c.getCcmaName() %><br>
										<strong>분 류</strong>				<%=c.getGcodeName() %> / 
																			<%=c.getBcodeName() %> / 
																			<%=c.getMcodeName() %><br>
																			 
										<strong>시대</strong>					<%=c.getCcceName() %><br> 
										<strong>수 량 / 면 적</strong> 		<%=c.getCcbaQuan() %><br>
										<strong>지정(등록)일</strong> 			<%=c.getCcbaAsdt() %><br> 
										<strong>소 재 지 (소유단체)</strong> 	<%=c.getCcbaLcad() %><br> 
										<strong>관 리 자 (관리단체)</strong> 	<%=c.getCcbaAdmin() %><br> 
										
										<br>

										<h6>
											<u>상세설명</u>
										</h6>
										<p class=" text-sm mb-0"></p>
										<p class="text-muted"><%=c.getContent() %></p>
									</div>
								</div>
							</div>

							<div class="text-block-cpd">
								<div class="row">
									<div class="col-sm">
										<h6>
											<u>+Image</u>
										</h6>
										<div class="row gallery ms-n1 me-n1">
										<%for(CultureImgVo img : list)  {
											if(cnt++ == 7){
												cnt = 1;
												break;
											}
										%>
											<div class="col-lg-4 col-6 px-1 mb-2">
												<a href="<%=img.getImageUrl()%>">
													<img class="img-fluid border-radius-bs" src="<%=img.getImageUrl()%>" alt="<%=img.getCcimDesc()%>">
												</a>
											</div>
										<%} %>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>

				<!-- 여기에 망고플레이트 바 넣기 -->

				<div class="col-md-10 col-lg-4 ms-lg-auto mt-5">
					<div class="border-1 shadow">

						<div class="cpd">

							<div class="tac">
								 <div id="map" class="border-radius-bs" style="height: 350px"></div>
  								 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20ac2dfad3cd59b659261a28d8b4c104"></script>
    							 <script>
        							var container = document.getElementById('map');
        							var options = {
						            	center: new kakao.maps.LatLng(<%=c.getLatitude()%>, <%=c.getLongitude()%>),
						            	level: 3
						    		   };
 
 							       var map = new kakao.maps.Map(container, options); // 지도 생성
 							       
 							   	  // 마커가 표시될 위치입니다 
 							      var markerPosition  = new kakao.maps.LatLng(<%=c.getLatitude()%>, <%=c.getLongitude()%>); 
 							       
 							      // 마커 생성
 							      var marker = new kakao.maps.Marker({
 							    	    position: markerPosition
 							    	});
 							       
 							  	// 마커가 지도 위에 표시되도록 설정합니다
 							     	marker.setMap(map);
    							</script>
							</div>

							<div class="mt-5">
								<h6 class="h6-bs tal">주변 문화재</h6>
							</div>
							<br>
							<%if(list2 == null || list2.size() == 1) {%>
								<div>
									<h3>주변 문화재가 없습니다.</h3>
								</div>
							<%}else{ %>
								<%for(int i = 1; i < list2.size(); i++) {%>
									<%if(sCnt == 4){ 
										sCnt = 1;
										break;
									} else {sCnt++;}%>
									<div>
										<img class="cpdnimg1 border-radius-bs"src="<%=list2.get(i).getImageUrl()%>">
										<p class="mt-2 mb-2">
										분 류 : <%=list2.get(i).getGcodeName()%> / <%=list2.get(i).getBcodeName()%><br>
										명 칭 : <%=list2.get(i).getCcbaMnm1()%><br>
										시 대 : <%=list2.get(i).getCcceName()%><br>
										</p>
									</div>								
									<%if(sCnt == 2 || sCnt == 3){ %>
										<hr>
									<%} %>
								<%} %>
							<%} %>
							<div class="mt-5">
								<h6 class="h6-bs tal">주변 박물관</h6>
							</div>

							<div style="text-align: center;">
							<%if(mlist == null) {%>
									<h3>주변 박물관이 없습니다.</h3>
								<%}else{ %>
									<%for(int i = 0; i < mlist.size(); i++) {%>	
										<%if(mCnt == 4){ 
											mCnt = 0;
											break;
										} else {mCnt++;}%>
										<a class="tag-item" href="<%=path%>/museuminfo?MuseumCd=<%=mlist.get(i).getMuseumCd()%>">
											<%=mlist.get(i).getFcltyNm() %>
										</a>
									<%} %>
								<%} %>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>
