<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<style type="text/css">

.tg  {border-collapse:collapse;
	border-spacing:0;}

.tg td{ border-color:black;
	border-style:solid;
	border-width:1px;
	font-family:Arial,
	sans-serif;
	font-size:14px;
  	overflow:hidden;
  	padding:10px 20px;
  	word-break:normal;}
  
.tg th{border-color:black;
	border-style:solid;
	border-width:1px;
	font-family:Arial, sans-serif;
	font-size:14px;
  	font-weight:normal;
  	overflow:hidden;
  	padding:10px 20px;
  	word-break:normal;}
  
.tg .tg-18bt{background-color:#dae8fc;
	border-color:#dae8fc;
	text-align:left;
	vertical-align:top;
	font-style: fon
		border-left: none;
	border-right: none;}

.tg .tg-xphl{border-color:#dae8fc;
	text-align:left;
	vertical-align:top;
	color: steelblue;
		border-left: none;
	border-right: none;}

.btnBox {
	background-color:#7892c2;
	border-radius:10px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Trebuchet MS;
	font-size:15px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
}
.btnBox {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.btnBox:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.btnBox:active {
	position:relative;
	top:1px;
}
.btn{
	position : relative;
	left: 880px;
}

</style>



<div class="container">

<div class="boardtitle">
<h1 style= "text-align :center; color: cornflowerblue;" >QnA 관리자</h1>
<hr>
</div>

<table class="tg" style="undefined;table-layout: fixed; width: 700px; margin:0 auto;">
<colgroup>
	<col style="width: 83px">
	<col style="width: 400px">
	<col style="width: 83px">
	<col style="width: 83px">
	<col style="width: 160px">
</colgroup>
<thead>
  <tr>
    <th class="tg-18bt">글번호</th>
    <th class="tg-18bt">제목</th>
    <th class="tg-18bt">작성자</th>
    <th class="tg-18bt">조회수</th>
    <th class="tg-18bt">작성일</th>
  </tr>
</thead>
<tbody>
<c:forEach items="${adQnaList }" var="adQna">
  <tr>
    <td class="tg-xphl" style= "text-align: center;">${adQna.boardNo }</td>
    <td class="tg-xphl" ><a href="/ad/qna/view?boardNo=${adQna.boardNo }">
		${adQna.boardTitle }
		</a></td>
<%--     <td class="tg-xphl">${free.userId }</td> --%>
    <td class="tg-xphl" style= "text-align: center;">${adQna.userNick }</td>
    <td class="tg-xphl" style= "text-align: center;">${adQna.hit }</td>
    <td class="tg-xphl" style= "text-align: center;">${adQna.boardDate }</td>
  </tr>
</c:forEach>
</tbody>
</table>

<div id="btnBox" class="btn">
	<button id="btnWrite" class="btnBox" style="margin-right: 50%;">글작성</button>
</div>

<!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/pagingadqna.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />