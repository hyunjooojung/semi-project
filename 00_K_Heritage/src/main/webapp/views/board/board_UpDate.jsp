<%@page import="board.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardVo b = (BoardVo)request.getAttribute("board");
%>


<%@ include file="/views/common/header.jsp"%>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>


    <br><br><br>
    <div class="title-text-yj">
    	<%if(b.getCid() == 1){%>
    		<b>자유게시판</b>	
    	<%}else if(b.getCid() == 2){%>
    		<b>리뷰게시판</b>
    	<%}else if(b.getCid() == 3){%>
    		<b>문의게시판</b>
    	<%} %>		
    </div>
    <br>


    <!-- 글쓰기 폼 시작 -->
    <main role="main" class="container">
        <form name="form" method="get" action="<%=path%>/boardUpdate">
            <div class="pt-1"></div>
            <input type="text" name="title" style="border-radius:5px; width:100%; padding:5px;"
            	value="<%=b.getTitle() %>"
            >
            
            <div class="pt-1">
                <textarea id="summernote" name="contents"><%=b.getContent() %></textarea>
            </div>
            <script>
                $('#summernote').summernote({});
            </script>
            <br>
            <div class="pt-1 text-right">
           		<input type="hidden" name="bnum" value="<%=b.getBnum() %>"/>
                <button class="btn btn btn-yj2" type="submit" style="width:80px; height:30px; margin:5px; padding:2px; background-color: #F4B183; color: white;">완료</button>
                <button class="btn btn btn-yj3" type="reset" style="width:80px; height:30px; padding:2px; background-color: #AFABAB; color: white;">취소</button>
            </div>
        </form>
    </main>
    <br><br><br>
    <!-- 글쓰기 폼 끝 -->

<%@ include file="/views/common/footer.jsp"%>
