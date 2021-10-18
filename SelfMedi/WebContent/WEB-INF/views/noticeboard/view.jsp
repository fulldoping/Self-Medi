<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/notice/list");
	});
});

//댓글 관련
$(document).ready(function() {
	$(document.body).on("click", ".commentDelete", function() {
		var th = $(this);
		console.log("--",th.parent().children(".newComment").val())
		//----- 전달 파라미터 구성 -----
		var boardNo = ${viewNotice.boardNo};
		var commentNo = th.parent().attr("data-commentNo")
		var params = "&boardNo=" + boardNo + "&commentNo=" + commentNo;

		console.log(params)
		
		//----- URL 구성 ----
		var url = "/notice/comment/delelte";

		//----- AJAX 요청 전송 -----
		sendRequest("GET", url, params, callback);
	});
	
	$(document.body).on("click", ".commentUpdate", function() {
//		console.log($(this).parent().attr('data-commentNo'))
		
		$(this).parent().children(".oldComment").toggle()
		
		$(this).parent().children(".newComment").toggle()
		$(this).parent().children(".btnCommentUpdate").toggle()
		$(this).parent().children(".btnCommentUpdateCancel").toggle()
	});
	
	$(document.body).on("click", ".btnCommentUpdate", function() {
		
		var th = $(this);
		console.log("--",th.parent().children(".newComment").val())
		
		//----- 전달 파라미터 구성 -----
		var boardNo = ${viewNotice.boardNo};
		var commentNo = th.parent().attr("data-commentNo")
		var commentContent = th.parent().children(".newComment").val()
		var params = "&boardNo=" + boardNo + "&commentNo=" + commentNo + "&commentContent=" + commentContent;

		console.log(params)
		
		//----- URL 구성 ----
		var url = "/notice/comment/update";

		//----- AJAX 요청 전송 -----
		sendRequest("GET", url, params, callback);
	})
	
	$(document.body).on("click", ".btnCommentUpdateCancel", function() {
		$(this).parent().children(".oldComment").toggle()
		
		$(this).parent().children("[name='newComment']").toggle()
		$(this).parent().children(".btnCommentUpdate").toggle()
		$(this).parent().children(".btnCommentUpdateCancel").toggle()
		
	})
	
});

//AJAX 요청 보내는 메소드, 댓글

function send() {	
	//----- 전달 파라미터 구성 -----
	var boardNo = ${viewNotice.boardNo};
	var c = content.value;
	var params = "&boardNo=" + boardNo + "&content=" + c;

	//----- URL 구성 ----
	var url = "/notice/comment/write";

	//----- AJAX 요청 전송 -----
	sendRequest("POST", url, params, callbacksend);
	
}

//AJAX 응답 처리하는 콜백함수
function callback() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("AJAX 정상 응답")

			//정상응답 처리 함수
			appendResult();

		} else {
			console.log("AJAX 요청/응답 에러")
		}
	}
}

//AJAX 응답 처리하는 콜백함수
function callbacksend() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("AJAX 정상 응답")

			//정상응답 처리 함수
			appendsendResult();

		} else {
			console.log("AJAX 요청/응답 에러")
		}
	}
}

//정상 응답 후 응답데이터 처리하는 함수
function appendResult() {
	commentList.innerHTML = httpRequest.responseText;
}

//정상 응답 후 응답데이터 처리하는 함수
function appendsendResult() {
	commentList.innerHTML = httpRequest.responseText;
	content.value = "";
}

//url복사
function copy(val) {
 		var dummy = document.createElement("textarea");
		 document.body.appendChild(dummy);
	  dummy.value = val;
	  dummy.select();
 		document.execCommand("copy");
 		document.body.removeChild(dummy);
}
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
			<td class="url"><button onclick="copy('http://localhost:8088/notice/view?boardNo='+${viewNotice.boardNo })">url 복사</button></td>
			<td class="declare"><button>신고</button></td>
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
</div>
</div>

<h4>댓글</h4>
	<hr>

	<div id="commentList">
		<c:forEach items="${commentList }" var="comment">
		<div data-commentNo="${comment.commentNo }">
			<label>${comment.userNick }</label><br>
			<label class="oldComment">${comment.commentContent }</label>
			<input type="text" class="newComment" name="newComment" style="display:none;" value="${comment.commentContent }" />
			<button class="btnCommentUpdate" style="display:none;">확인</button>
			<button class="btnCommentUpdateCancel" style="display:none;">취소</button><br>
			<label>${comment.commentDate }</label><br>
			
			<c:if test="${comment.userNo eq userNo}">
				<span class="commentDelete">삭제</span>
				<span class="commentUpdate">수정</span>
			</c:if>
			
			<hr>
		</div>
		</c:forEach>
	</div>

	<div>
		<c:if test="${not empty userNo }">
			<label>${nick }<br> <textarea id="content"></textarea>
			</label>
			<br>
			<button onclick="send();">댓글 달기</button>
		</c:if>
	</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
