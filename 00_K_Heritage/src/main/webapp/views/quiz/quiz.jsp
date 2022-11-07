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


<!-- 퀴즈 메뉴 시작 -->
<nav id="quiz-menu">
	<ul>
		<li><a class="menuLink" href="#">전체 문제 보기</a></li>
		<li><a class="menuLink" href="#">맞춘 문제 보기</a></li>
		<li><a class="menuLink" href="#">틀린 문제 보기</a></li>
	</ul>
</nav>
<!-- 퀴즈 메뉴 끝 -->
<br>
<br>


<!-- 퀴즈 보여주기 -->
<div class="quiz-maintext">
	<b>문화재 퀴즈</b>
</div>

<div class="hr-yj1">
	<hr color="black" width="40%">
</div>

<div class="quiz-question">1. 다음 문화재의 이름은?</div>
<br>

<div class="quiz-image"
	style="text-align: center; width: 400px; height: 450px;">
	<img src="<%=path%>/resources/img/tree.jpg" class="quiz-image" style="text-align: center;"><br>
</div>

<div class="quiz-select">
	<br> ① 강진 사당리 푸조나무<br> ② 부산 양정동 배롱나무<br> ③ 남양주 양자리 향나무<br>
	④ 순천 평중리 이팝나무
</div>
<br>
<br>

<div>
	<p>
		<a
			class="text-orange quiz-icon-left quiz-icon-size font1"
			href="#"><i class="fa fa-question-circle"></i><br>힌트보기</a> <a
			class="text-orange quiz-icon-right quiz-icon-size font1"
			href="#"><i class="fa fa-arrow-circle-right"></i><br>다음 문제로</a>
	</p>
</div>
<!-- 퀴즈 끝 -->
<br>
<br>
<br>
<br>
<br>
<%@ include file="/views/common/footer.jsp"%>