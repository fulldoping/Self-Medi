<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/ad/notice/list");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/ad/notice/update?boardNo=${viewNotice.boardNo }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if( confirm("게시글을 삭제하시겠습니까?") ) {
			$(location).attr("href", "/ad/notice/delete?boardNo=${viewNotice.boardNo }");
		}
	});

});
</script>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td colspan="3">${viewNotice.boardNo }</td>
</tr>

<tr>
<td class="info">제목</td><td colspan="3">${viewNotice.boardTitle }</td>
</tr>

<tr>
<td class="info">아이디</td><td>${viewNotice.userId }</td>
<td class="info">닉네임</td><td>${userNick }</td>
</tr>

<tr>
<td class="info">조회수</td><td>${viewNotice.hit }</td>
</tr>

<tr>
<td class="info">작성일</td><td colspan="3">${viewNotice.boardDate }</td>
</tr>

<tr><td class="info"  colspan="4">본문</td></tr>

<tr><td colspan="4">${viewNotice.boardContent }</td></tr>

</table>

<!-- 첨부파일 -->
<div>
<c:if test="${not empty noticeFile }">
	<img src="/upload/${noticeFile.storedName }" style="max-width:50%; height: auto"/>
</c:if>
</div>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
	<button id="btnUpdate" class="btn btn-primary" >수정</button>
	<button id="btnDelete"  class="btn btn-primary">삭제</button>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
