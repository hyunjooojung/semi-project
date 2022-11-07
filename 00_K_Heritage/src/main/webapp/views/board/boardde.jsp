<%@page import="board.B_Comment"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String caName = (String)request.getAttribute("category");
	BoardVo b = (BoardVo)request.getAttribute("board");
	List<B_Comment> list = (List<B_Comment>)request.getAttribute("list"); 
%>

<%@ include file="/views/common/header.jsp"%>
<section>
	<div class="container">
		<div class="py-7 font1 col-xl-8 mx-auto margin-bottom-ks">
			<div class="">
				<a class="text-orange display-7" href="<%=path%>/boardlist?cid=<%=b.getCid()%>">⠀
					<%=caName %>
				</a>
				<h1 class="display-4 mb-0text-black"><%=b.getTitle() %></h1>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-8 col-lg-10 mx-auto">
				<p class="py-2 mb-2 text-right-ks fw-light font1">
					<a href=""></a> 작성자 <a class="text-orange" href="#"><%=b.getId() %></a><span
						class="mx-1">|</span> <%=b.getBdate() %> <span class="mx-1">|</span>
						<%if(loginMember != null) {%>
							<%if(loginMember.getUCode() == b.getUcode() || loginMember.getId().equals("admin@naver.com"))  {%>
								<a class="text-orange mx-2" href="<%=path%>/boardUpdate.do?bnum=<%=b.getBnum()%>">
									<i class="fa fa-pen post-icon-ks"></i> 수정하기
								</a>
								<a class="text-orange mx-2" href="<%=path%>/boarddelete?bnum=<%=b.getBnum()%>">
									<i class="fa fa-pen post-icon-ks"></i> 삭제하기
								</a>
							<%} %>
						<%} %>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-8 col-lg-10 mx-auto">
				<!-- lg와 xl중에 choice-->
				<div class="text-content" id ="my_div">
					<p>
						<%=b.getContent() %>
					</p>	
				</div>
				<br>
				<hr class="hr2-ks">
				<!-- 댓글보기 컨테이너 -->
				<div class="mt-5">
					<div class="oneline-ks">
						<h6 class="text-uppercase text-muted mb-4"><%=list.size() %>개의 댓글</h6>
						<a class="px-xxl-3 h6 text-orange font1 fw-normal" href="#">새로고침</a>
					</div>
					
					
					<%for(B_Comment c : list) {%>
						<div class="d-flex mb-1">
							<div>
								<h5><%=c.getId() %></h5>
								<p class="text-uppercase text-sm text-muted">
									<i class="far fa-clock"></i> 
									<%=c.getCdate() %>
								</p>
								<p class="text-muted"><%=c.getContent() %></p>
								<%if(loginMember != null) {%>
									<%if(loginMember.getUCode() == c.getUcode() || loginMember.getId().equals("admin@naver.com"))  {%>
									<p>
										<a class="btn btn-link text-orange" 
										href="<%=path%>/boarddDelete?cnum=<%=c.getCnum()%>&bnum=<%=c.getBnum()%>">
											<i class="fa fa-trash"></i> 
											삭제
										</a>
									</p>
									<%} %>
								<%} %>
							</div>
						</div>
						<hr>
					<%} %>
				</div>
				<!-- 댓글보기 컨테이너 끝 -->
				<%if(loginMember != null) {%>
				<!-- 댓글작성 컨테이너 -->
				<div class="mb-5">
					<button class="btn btn-outline-primary" type="button"
						data-bs-toggle="collapse" data-bs-target="#leaveComment"
						aria-expanded="false" aria-controls="leaveComment">댓글달기</button>
					<div class="collapse" id="leaveComment">
						<div class="mt-4">
							<h5 class="mb-4">댓글 작성</h5>
							<form class="form" id="comment-form" method="post" action="<%=path%>/commentWrite">
								<div class="mb-4">
									<label class="form-label" for="comment">내용 <span
										class="required">*</span></label>
									<textarea class="form-control" id="comment" name="comment" rows="4"></textarea>
								</div>
									<input type="hidden" name="bnum" value="<%=b.getBnum() %>">
									<input type="hidden" name="ucode" value="<%=loginMember.getUCode() %>">
								<button class="btn btn-primary" type="submit">
									<i class="far fa-comment"></i> 제출하기
								</button>
							</form>
						</div>
					</div>
				</div>
				<!-- 댓글작성 컨테이너 끝 -->
				<%}	 %>
				
			</div>
		</div>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>