<%@page import="common.PageInfo"%>
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
List<Museum> list = (List<Museum>) request.getAttribute("list");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

int cnt = 1;

String name = "";
String area = "";
String sort = "";

String nameParamValue = request.getParameter("name");
String areaParamValue = request.getParameter("area");
String sortParamValue = request.getParameter("sort");

if (nameParamValue != null && nameParamValue.length() > 0) {
	name = request.getParameter("name");
}

if (areaParamValue != null && areaParamValue.length() > 0) {
	area = request.getParameter("area");
}

if (sortParamValue != null && sortParamValue.length() > 0) {
	sort = request.getParameter("sort");
}
%>

<style>
/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; color: #f8f9fa; background-color:  #f8f9fa;}
</style>

<section class="py-6 bg-gray-100 font1">
	<!-- 제목 타이틀  -->
	<div class="container py-sm-0 w-100">
		<div>
			<div class="col-xl-8">
				<h1 class="font1 display-4 text-black fw-bold">박물관 검색</h1>
				<p class="font1 text-lg text-orange mb-6">전국에 있는 다양한 박물관을 찾아보세요!</p>
			</div>
		</div>
	</div>
	<hr class="hr-jhj">

	<!-- 검색창 시작 -->
	<div class="container center style=">
		<form action="<%=path%>/museum" method="GET">
			<div class="d-flex align-items-center form-group mb-3-jh">

				<label class="jhj-1">박물관 명칭 검색</label>
				<div class="input-label-absolute input-label-absolute-right ">
					<input class="form-control-jhj border-1-jhj shadow-0" 
					id="name" name="name" value="<%=name%>" type="text" class="input_text" placeholder="이름">
				</div>


				<label class="jhj-2">지역별 검색</label> 
				
				<select class="selectpicker" title="선택" data-style="btn-form-control" name="area" id="area">
					
					<%if(area.equals("수도권")) {%>
						<option value="수도권" selected=selected>수도권</option>
					<%} else {%>
						<option value="수도권">수도권</option>
					<%} %>
					<%if(area.equals("충청권")) {%>
						<option value="충청권" selected=selected>충청권</option>
					<%} else {%>
						<option value="충청권">충청권</option>
					<%} %>
					<%if(area.equals("강원권")) {%>
						<option value="강원권" selected=selected>강원권</option>
					<%} else {%>
						<option value="강원권">강원권</option>
					<%} %>
					<%if(area.equals("전라권")) {%>
						<option value="전라권" selected=selected>전라권</option>
					<%} else {%>
						<option value="전라권">수도권</option>
					<%} %>
					<%if(area.equals("경상권")) {%>
						<option value="경상권" selected=selected>경상권</option>
					<%} else {%>
						<option value="경상권">경상권</option>
					<%} %>
					<%if(area.equals("제주권")) {%>
						<option value="제주권" selected=selected>제주권</option>
					<%} else {%>
						<option value="제주권">제주권</option>
					<%} %>
				</select> 
				
				<label class="jhj-3">정렬</label> 
				
				<select class="selectpicker" title="선택" data-style="btn-form-control" name="sort" id="sort">
					<%if(sort.equals("오름차순")) {%>
						<option value="오름차순" selected="selected">오름차순</option>
					<%} else {%>
						<option value="오름차순">오름차순</option>
					<%} %>
					
					<%if(sort.equals("내림차순")) {%>
						<option value="내림차순" selected="selected">내림차순</option>
					<%} else {%>
						<option value="내림차순">내림차순</option>
					<%} %>
				</select>


				<div class="col-lg-2 d-grid">
					<button class="btn btn-primary h-100 w-50 btn-primary-jh jhj-6 ms-4" type="submit">검색</button>
				</div>
			</div>
		</form>
		<!-- 검색창 끝 -->

		<!-- 박물관 사진 시작 -->
		
        <div class="box-parent-yj" style="text-align: center;">		
			<%for (Museum m : list) { %>
			
            <div class="box1-jhj">
                <!-- 1번째 -->
                <div class="card h-100 border-0 shadow">
                    <div class="card-img-top overflow-hidden gradient-overlay " >
                        <img class="img-full-main-jh" src="<%=path%>/resources/img/museum-<%=cnt++ %>.PNG" alt="" />
                       <%if(cnt == 9) { cnt = 1;%>
								<%} %>
                        <a class="tile-link" href="<%=path%>/museuminfo?MuseumCd=<%=m.getMuseumCd()%>"></a>
                        <div class="card-img-overlay-bottom z-index-40"></div>
                        <div class="card-img-overlay-top text-end">
                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> <svg class="svg-icon text-white">
                                    <use xlink:href="#heart-1"> </use>
                                    </svg>
                            </a>
                        </div>
                    </div>
                    <div class="card-body d-flex align-items-center">
                        <div class="w-100">
                            <h6 class="card-title">
										<a class="text-decoration-none text-dark h5"
											href="<%=path%>/museuminfo?MuseumCd=<%=m.getMuseumCd()%>">
											<%=m.getFcltyNm()%>
										</a>
                            </h6>
                            
                          	<div class="d-flex card-subtitle mb-3">
										<p class="flex-grow-1 mb-0 text-muted text-sm"><%=m.getAreadr()%></p>
										
										<p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
											<%if(m.getCnt() >= 0) {%>
											<i class="fa fa-star text-warning"></i>
											<%}%>
											<%if(m.getCnt() > 10){ %>
											<i class="fa fa-star text-warning"></i>
											<%}%>
											<%if(m.getCnt() > 20){ %>
											<i class="fa fa-star text-warning"></i>
											<%}%>
											<%if(m.getCnt() > 30){ %>
											<i class="fa fa-star text-warning"></i>
											<%}%>
											<%if(m.getCnt() > 40){ %>
											<i class="fa fa-star text-warning"></i>
											<%}%>
										</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		<%}%>
	</div>
</div>
	<!-- 박물관 사진 끝 -->

<%-- 페이지부 시작 --%>
<div id="pageBar">
	<%-- 처음으로 가기	 --%>
	<button onclick="movePage('<%=path%>/museum?page=<%=pageInfo.getStartPage()%>');" style="border: none; background-color: #f8f9fa">&lt;&lt;</button>
	<%-- 이전으로 가기	 --%>
	<button onclick="movePage('<%=path%>/museum?page=<%=pageInfo.getPrvePage()%>');" style="border: none; background-color: #f8f9fa">&lt;</button>

	<!-- 출력하기 -->
	<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
		<%if(i == pageInfo.getCurrentPage()){ %>
			<button disabled style="border: none"><%=i%></button>
		<%} else {%>
			<button onclick="movePage('<%=path%>/museum?page=<%=i%>');" style="border: none; background-color: #f8f9fa"><%=i%></button>
		<%} %>
	<%} %>
	
	<%-- 다음으로 가기	 --%>
	<button onclick="movePage('<%=path%>/museum?page=<%=pageInfo.getNextPage()%>');" style="border: none; background-color: #f8f9fa">&gt;</button>
	
	<%-- 마지막으로 가기	 --%>
	<button onclick="movePage('<%=path%>/museum?page=<%=pageInfo.getEndPage()%>');" style="border: none; background-color: #f8f9fa">&gt;&gt;</button>
</div>
<%-- 페이지부 종료 --%>

</section>

<script type="text/javascript">
function movePage(pageUrl){
		
		var name = document.getElementById("name");
		var area = $("#area option:selected").val();
		var sort = $("#sort option:selected").val(); 
 		
		if(name.value != null && name.value.length > 0 ){
			pageUrl = pageUrl + '&name='+ name.value;
		}
		if(area != null && area.length > 0 ){
			pageUrl = pageUrl + '&area='+ area;
		}
		if(sort != null && sort.length > 0 ){
			pageUrl = pageUrl + '&sort='+ sort;
		}
		
//  		alert(pageUrl);
		location.href = encodeURI(pageUrl);
}
</script>


<%@ include file="/views/common/footer.jsp"%>