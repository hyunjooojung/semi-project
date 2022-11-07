<%@page import="Museum.Museum"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/views/common/header.jsp"%>

<br>
<br>
<br>
<br>
<br>

<!-- 페이지 소개 텍스트 -->
<div class="main-text">
	<b>문화재 퀴즈</b>
</div>
<div class="sub-text">다양한 퀴즈에 도전해보세요!</div>
<br>
<br>
<br>

<div class="board-type fw-light font1">
	<a class="text-black" href="#">전체 문제</a><span class="mx-1">|</span> <a
		class="text-black" href="#">맞춘 문제</a><span class="mx-1">|</span> <a
		class="text-black" href="#">틀린 문제</a>
</div>

<!-- 테이블 부분 -->
<!-- 107줄 분류 앞부분, 4번째 정답자수 td 앞부분 2자리 공백 이모티콘입니다. 2자리 뒤에 코드블럭 부탁드려요 -->
<table class="table" style="width: 80%">
	<thead>
		<tr>
			<th class="w40">NO</th>
			<th class="w40">⠀분류</th>
			<th class="expand text-align-ks">퀴즈명</th>
			<th class="w40">정답자수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>10</td>
			<td>조선시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">조선전기 건축물 문화재 퀴즈</a></td>
			<td>⠀⠀5명</td>
		</tr>

		<tr>
			<td>9</td>
			<td>조선시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">조선후기 건축물 문화재 퀴즈</a></td>
			<td>⠀⠀7명</td>
		</tr>

		<tr>
			<td>8</td>
			<td>조선시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">국보 1번 퀴즈</a></td>
			<td>⠀⠀5명</td>
		</tr>

		<tr>
			<td>7</td>
			<td>고려시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">고려시대 문화재 퀴즈</a></td>
			<td>⠀⠀8명</td>
		</tr>

		<tr>
			<td>6</td>
			<td>삼국시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">삼국시대 문화재 퀴즈</a></td>
			<td>⠀⠀7명</td>
		</tr>

		<tr>
			<td>5</td>
			<td>고려시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">고려시대 불교 문화재 퀴즈</a></td>
			<td>⠀⠀5명</td>
		</tr>

		<tr>
			<td>4</td>
			<td>삼국시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">삼국시대 국보 문화재 퀴즈</a></td>
			<td>⠀⠀8명</td>
		</tr>

		<tr>
			<td>3</td>
			<td>석기시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">석기시대 문화재 퀴즈</a></td>
			<td>⠀⠀4명</td>
		</tr>

		<tr>
			<td>2</td>
			<td>조선시대</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">조선시대 역사 기록물 퀴즈</a></td>
			<td>⠀⠀6명</td>
		</tr>

		<tr>
			<td>1</td>
			<td>기타</td>
			<td class="title indent text-align-ks"><a class="text-black"
				href="<%=path%>/views/quiz/quiz.jsp">자연 문화재 퀴즈</a></td>
			<td>⠀⠀5명</td>
		</tr>
	</tbody>
</table>
<!-- 게시판 아래쪽 게시글수 및 검색창 부분 -->
<div id="board-sum" style="padding-top: 15px;">
	<span class="board-sum-text" style="margin-left: 10px;"><a>총
			10개의 글이 있습니다</a></span>
	<button type="submit" class="myButton-ks">검색</button>
	<input type="text"
		style="float: right; padding: auto; margin-right: 5px; border: 1px solid #787878;">
</div>

<br>
<br>
<br>
<br>
<%@ include file="/views/common/footer.jsp"%>