<%@page import="common.PageInfo"%>
<%@page import="board.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<% 
	int cid = (int)request.getAttribute("cid");
	List<BoardVo> list = (List<BoardVo>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	String searchValue = request.getParameter("searchValue");
%>
<!-- 페이지 소개 텍스트 -->
<br><br>
<div class="main-text">
    	<%if(cid == 1){%>
    		<b>자유게시판</b>	
    	<%}else if(cid == 2){%>
    		<b>리뷰게시판</b>
    	<%}else if(cid == 3){%>
    		<b>문의게시판</b>
    	<%} %>		
</div>

<div class="sub-text">문화재 도감의 가장 빠르고 정확한 소식을 전달합니다.</div>
<br>
<br>
<br>

<div class="board-type fw-light font1" style="width:80%">
	<a class="text-black" href="<%=path%>/boardlist?cid=1">자유게시판</a><span class="mx-1">|</span> 
	<a class="text-black" href="<%=path%>/boardlist?cid=2">리뷰게시판</a><span class="mx-1">|</span> 
	<a class="text-black" href="<%=path%>/boardlist?cid=3">문의게시판</a>
	<%if(loginMember != null) {%>
	<a style="float: right" class="text-orange mx-2" href="<%=path%>/boardwrite.do?cid=<%=cid%>">
		<i class="fa fa-pen post-icon-ks"></i>&nbsp;&nbsp;&nbsp;글쓰기</a>	
	<%} %>
</div>

<!-- 테이블 부분 -->
<form action="<%=path%>/boardlist?cid" method="get">
	<table class="table" style="width:80%;">
		<thead>
			<tr>
				<th class="w40">NO</th>
				<th class="expand">제목</th>
				<th class="w80">작성자</th>
				<th class="w80">작성일</th>
				<th class="w40">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<%for(BoardVo b : list) {%>
			<tr>
				<td><%=b.getRnum() %></td>
				<td class="title indent text-align-left">
					<a href="<%=path%>/boardDEtail?bnum=<%=b.getBnum() %>" class="text-black">
						<%=b.getTitle() %>
					</a>
				</td>
				<td><%=b.getId() %></td>
				<td><%=b.getBdate() %></td>
				<td><%=b.getReadcount() %></td>
			</tr>
			<%} %>
		</tbody>
		
	</table>
	
	<!-- 게시판 아래쪽 게시글수 및 검색창 부분 -->
	<div id="board-sum" style="padding-top: 15px;">
		<span class="board-sum-text" style="margin-left: 10px;">
			<a>총 <%=list.size() %>개의 글이 있습니다</a>
		</span>
		
		<button type="submit" class="myButton-ks">검색</button>
		<%if(searchValue != null && searchValue.length() > 0) {%>
		<input type="text" name="searchValue" id = "searchValue"
			style="float: right; padding: auto; margin-right: 5px; border: 1px solid #787878;" value="<%=searchValue%>">
		<%} else {%>
		<input type="text" name="searchValue" id = "searchValue"
			style="float: right; padding: auto; margin-right: 5px; border: 1px solid #787878;">
		<%} %>
		<input type="hidden" name="cid" value="<%=cid%>">
	</div>
</form>
<%-- 페이지부 시작 --%>
<div class="mt-5 mb-4" id="pageBar" style="text-align: center;">
	<%-- 처음으로 가기	 --%>
	<button onclick="movePage('<%=path%>/boardlist?page=<%=pageInfo.getStartPage()%>&cid=<%=cid%>');" style="border: none; background-color: #fff">&lt;&lt;</button>
	<%-- 이전으로 가기	 --%>
	<button onclick="movePage('<%=path%>/boardlist?page=<%=pageInfo.getPrvePage()%>&cid=<%=cid%>');" style="border: none; background-color: #fff">&lt;</button>

	<!-- 10개 목록 출력하기 -->
	<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
		<%if(i == pageInfo.getCurrentPage()){ %>
			<button disabled style="border: none; background-color: #fff"><%=i%></button>
		<%} else {%>
			<button onclick="movePage('<%=path%>/boardlist?page=<%=i%>&cid=<%=cid%>');" style="border: none; background-color: #fff"><%=i%></button>
		<%} %>
	<%} %>
	
	<%-- 다음으로 가기	 --%>
	<button onclick="movePage('<%=path%>/boardlist?page=<%=pageInfo.getNextPage()%>&cid=<%=cid%>');" style="border: none; background-color: #fff">&gt;</button>
	
	<%-- 마지막으로 가기	 --%>
	<button onclick="movePage('<%=path%>/boardlist?page=<%=pageInfo.getEndPage()%>&cid=<%=cid%>');" style="border: none; background-color: #fff">&gt;&gt;</button>

</div>
<%-- 페이지부 종료 --%>

<script type="text/javascript">
function movePage(pageUrl){
		
		var searchValue = document.getElementById("searchValue");
		
// 		alert(searchValue.value)
		
		if(searchValue.value != null && searchValue.value.length > 0 ){
			pageUrl = pageUrl + '&searchValue='+ searchValue.value;
		}
			
// 		alert(pageUrl);
		location.href = encodeURI(pageUrl);
}
</script>

<%@ include file="/views/common/footer.jsp"%>