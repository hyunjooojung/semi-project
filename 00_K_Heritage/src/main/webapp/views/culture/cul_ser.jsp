<%@page import="common.PageInfo"%>
<%@page import="culture.CultureDiVo"%>
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
	int cnt = 1;
	
	List<CultureDiVo> list = (List<CultureDiVo>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	String value1 = "";
	String value2 = "";
	String value3 = "";
	String value4 = "";
	
	String value1ParamValue = request.getParameter("value1");
	String value2ParamValue = request.getParameter("value2");
	String value3ParamValue = request.getParameter("value3");
	String value4ParamValue = request.getParameter("value4");
	
	if(value1ParamValue != null && value1ParamValue.length() > 0){
		
		value1 = request.getParameter("value1");
	}
	if(value2ParamValue != null && value2ParamValue.length() > 0){
		
		value2 = request.getParameter("value2");
	}
	if(value3ParamValue != null && value3ParamValue.length() > 0){
		
		value3 = request.getParameter("value3");
	}
	if(value4ParamValue != null && value4ParamValue.length() > 0){
		
		value4 = request.getParameter("value4");
	}
%>

<style>
/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; color: #f8f9fa;}
</style>


<!-- 필터박스 부분 -->
<form class="form-yj">

	<!-- 검색창 부분 -->
	<br>
	<br>
	<div class="search-yj">
		<i class="fas fa-search fa-search-yj"></i>
		<input type="text" id="value1" placeholder="문화재명 검색" name="value1" value="<%=value1%>">
	</div>
	

	<fieldset class="filter-yj">
	
		<div class="textleft mt-4 mb-4 ms-4">
		<b>지정 종목</b>&emsp;
		<label><input type="radio" id="value2" name="value2" value="국보" <%=value2.equals("국보") ? "checked":""%>> 
		국보&nbsp;&nbsp;</label>
		<label><input type="radio" id="value2" name="value2" value="보물" <%=value2.equals("보물") ? "checked":""%>> 
		보물&nbsp;&nbsp;</label>
		<label><input type="radio" id="value2" name="value2" value="사적" <%=value2.equals("사적") ? "checked":""%>> 
		사적&nbsp;&nbsp;</label>
		<label><input type="radio" id="value2" name="value2" value="천연기념물" <%=value2.equals("천연기념물") ? "checked":""%>> 
		천연기념물&nbsp;&nbsp;</label>
		</div>
		
		<hr class="hr-yj">
		
		<div class="textleft mt-4 mb-4 ms-4"> 
		<b>시대별</b>&emsp;&emsp; 		
		<label><input type="radio" id="value3" name="value3" value="선사"  <%=value3.equals("선사") ? "checked":""%>>
		선사시대 	&nbsp;&nbsp;</label> 
		<label><input type="radio" id="value3" name="value3" value="원삼국" <%=value3.equals("원삼국") ? "checked":""%>>
		원삼국시대&nbsp;&nbsp;</label> 
		<label><input type="radio" id="value3" name="value3" value="삼국" <%=value3.equals("삼국") ? "checked":""%>>
		삼국시대   &nbsp;&nbsp;</label> 
		<label><input type="radio" id="value3" name="value3" value="남북국" <%=value3.equals("남북국") ? "checked":""%>>
		남북국시대&nbsp;&nbsp;</label>
		<label><input type="radio" id="value3" name="value3" value="고려" <%=value3.equals("고려") ? "checked":""%>>
		고려시대&nbsp;&nbsp;</label>
		<br>
		&emsp;&emsp;&emsp;&emsp;&emsp;		 
		<label><input type="radio" id="value3" name="value3" value="조선" <%=value3.equals("조선") ? "checked":""%>>
		조선시대   &nbsp;&nbsp;</label>		
		<label><input type="radio" id="value3" name="value3" value="대한제국" <%=value3.equals("대한제국") ? "checked":""%>>
		대한제국시대 &nbsp;&nbsp;</label> 
		<label><input type="radio" id="value3" name="value3" value="신라" <%=value3.equals("신라") ? "checked":""%>>	
		신라시대    &nbsp;&nbsp;</label>
		<label><input type="radio" id="value3" name="value3" value="시대미상" <%=value3.equals("시대미상") ? "checked":""%>>	
		시대미상    &nbsp;&nbsp;</label>		
		</div>
		
		<hr class="hr-yj">
		
		<div class="textleft mt-4 mb-4 ms-4">
		<b>지역별</b>&emsp;&emsp; 		
		<!-- 여러분은 여기분 도를 권으로 수정하면 잘 될거에요! -->
		<label><input type="radio" id="value4" name="value4" value="수도권" <%=value4.equals("수도권") ? "checked":""%>>
		수도권&nbsp;&nbsp;</label>  
		<label><input type="radio" id="value4" name="value4" value="충청도" <%=value4.equals("충청도") ? "checked":""%>>
		충청권&nbsp;&nbsp;</label> 
		<label><input type="radio" id="value4" name="value4" value="강원도" <%=value4.equals("강원도") ? "checked":""%>>
		강원권&nbsp;&nbsp;</label>  
		<label><input type="radio" id="value4" name="value4" value="전라도" <%=value4.equals("전라도") ? "checked":""%>>
		전라권&nbsp;&nbsp;</label>
		<label><input type="radio" id="value4" name="value4" value="경상도" <%=value4.equals("경상도") ? "checked":""%>>
		경상권&nbsp;&nbsp;</label> 
		<label><input type="radio" id="value4" name="value4" value="제주도" <%=value4.equals("제주도") ? "checked":""%>>
		제주권&nbsp;&nbsp;</label> 
        </div>                                                                    
	</fieldset>
                                                                                                                                      
	<div class="btn-yj">                                                    
		<button type="submit" id="submit-btn-yj">적용</button>
		<button type="reset" id="reset-btn-yj">초기화</button>
	</div>
</form>

<hr>
<br>

<!-- 사진 부분 -->

<div class="box-parent-yj" style="text-align: center;">
<%for(CultureDiVo c : list){%>

	<%if(cnt == 5 || cnt == 9) {cnt++; %>
			<br>
	<%} else { cnt++;} %>
	
	<div class="box1-yj">	
		<%if(c.getImageUrl() == null) {%>
			<a href="<%=path%>/cul_di?CcbaMnm1=<%=c.getCcbaMnm1()%>">
			<img src="<%=path%>/resources/img/culture/culimg.jpg" alt="" class="img01-yj"></a>
		<%} else {%>
			<a href="<%=path%>/cul_di?CcbaMnm1=<%=c.getCcbaMnm1()%>">
			<img src="<%=c.getImageUrl() %>" alt="" class="img01-yj"></a>
		<%} %>
		
		<div class="mt-2">
		<%=c.getCcmaName() %>
		</div>
		<div class="mt-0">
		<a href="<%=path%>/cul_di?CcbaMnm1=<%=c.getCcbaMnm1()%>
		&CcbaAsno=<%=c.getCcbaAsno()%>&CcbaKdcd=<%=c.getCcbaKdcd()%>&CcbaCtcd=<%=c.getCcbaCtcd()%>">
		<b class="text-black"><%=c.getCcbaMnm1() %></b></a>
		</div>
	</div>
<%} %>
</div>

<%-- 페이지부 시작 --%>
<div class="mt-5 mb-4" id="pageBar">
	<%-- 처음으로 가기	 --%>
	<button onclick="movePage('<%=path%>/culList?page=<%=pageInfo.getStartPage()%>');" style="border: none; background-color: #fff">&lt;&lt;</button>
	<%-- 이전으로 가기	 --%>
	<button onclick="movePage('<%=path%>/culList?page=<%=pageInfo.getPrvePage()%>');" style="border: none; background-color: #fff">&lt;</button>

	<!-- 10개 목록 출력하기 -->
	<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
		<%if(i == pageInfo.getCurrentPage()){ %>
			<button disabled style="border: none; background-color: #fff"><%=i%></button>
		<%} else {%>
			<button onclick="movePage('<%=path%>/culList?page=<%=i%>');" style="border: none; background-color: #fff"><%=i%></button>
		<%} %>
	<%} %>
	
	<%-- 다음으로 가기	 --%>
	<button onclick="movePage('<%=path%>/culList?page=<%=pageInfo.getNextPage()%>');" style="border: none; background-color: #fff">&gt;</button>
	
	<%-- 마지막으로 가기	 --%>
	<button onclick="movePage('<%=path%>/culList?page=<%=pageInfo.getEndPage()%>');" style="border: none; background-color: #fff">&gt;&gt;</button>
<br>
<br>
<br>
<br>
</div>
<%-- 페이지부 종료 --%>


<script type="text/javascript">
function movePage(pageUrl){
		
		var value1  = document.getElementById("value1"); // 문화재명
 		var value2 = document.getElementsByName("value2"); // 종목명
 		var value3 = document.getElementsByName("value3"); // 시대명
 		var value4 = document.getElementsByName("value4"); // 지역명
		
		if(value1.value != null && value1.value.length > 0 ){
			pageUrl = pageUrl + '&value1='+ value1.value;
		}
		
		if(value2 != null && value2.length > 0 ){
			for(var i = 0; i < value2.length; i++){
				if(value2[i].checked == true){
					pageUrl = pageUrl + '&value2=' + value2[i].value;	
				}
			}
		}
		
		if(value3 != null && value3.length > 0 ){
			for(var i = 0; i < value3.length; i++){
				if(value3[i].checked == true){
					pageUrl = pageUrl + '&value3=' + value3[i].value;	
				}
			}
		}
		
		if(value4 != null && value4.length > 0 ){
			for(var i = 0; i < value4.length; i++){
				if(value4[i].checked == true){
					pageUrl = pageUrl + '&value4=' + value4[i].value;	
				}
			}
		}
		
// 		alert(pageUrl);
		location.href = encodeURI(pageUrl);
}


// document.getElementById('reset-btn-yj').onclick = function() {
// 	var radio1 = document.querySelector('input[type=text][name=value1]');
// 	radio1.checked = false;
	
// 	var radio2 = document.querySelector('input[type=radio][name=value2]:checked');
// 	radio2.value.checked = false;
// 	var radio3 = document.querySelector('input[type=radio][name=value3]:checked');
// 	radio3.value.checked = false;
// 	var radio4 = document.querySelector('input[type=radio][name=value4]:checked');
// 	radio4.value.checked = false;
// }

</script>

<%@ include file="/views/common/footer.jsp"%>
