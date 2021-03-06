<%@page import="com.fulldoping.member.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Member member = (Member)request.getAttribute("member");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />    

<style type="text/css">
#container {
	padding: 0px 0px 120px;
}

.pageAticle {
    width: 300px;
    margin: 0 auto;
}

#form {
	width: 300px;
	margin: 0 auto;
}

div.typeForm memberfingId {
	padding-top:50px; 
}

.memberfingId {
    width: 300px;
    margin: 0 auto;
    
}

.memberfingId {
	padding-top: 50px;
    padding-bottom: 150px;
    
    font-size: 15px;
    color: #666;
    line-height: 17px;
}

.memberfingId td {
    display: table-cell;
    padding: 10px 0px 0px 0px;
}

h2.title {
	text-align: center;
    color: #333;
    font-weight: 700;
    font-size: 28px;
    padding: 10px 0px 10px 0px;
}

th.userId, th.userPw {
	font-size: 14px;
	text-align: left;
	padding-right: 20px;
}

.login th {
    width: 150px;
    padding: 20px 0 0 20px;
    font-weight: 700;
    font-size: 14px;
    color: #333;
    line-height: 20px;
    vertical-align: top;
    text-align: left;
}

.login th {
    width: 130px;
    padding: 20px 0 0 20px;
    font-weight: 700;
    font-size: 14px;
    color: #333;
    line-height: 20px;
    vertical-align: top;
    text-align: left;
}

.typeForm input[type=text] {
    height: 44px;
    padding: 0 14px;
    border: 1px solid #ccc;
    font-size: 14px;
    color: #333;
    line-height: 20px;
    border-radius: 3px;
    background: #fff;
    outline: none;
    vertical-align: top;
    width: 300px;
}

button.btnFindPw {
    border: 0px solid #345FF6;
    background-color: #345FF6;
    color: #fff;
    width: 300px;
    height: 50px;
    font-size: 16px;
    line-height: 54px;
    border-radius: 3px;
    font-weight: 700;
}

span.findId {
	font-size: 14px;
	text-align: center;
}
</style>

<section>

<div id="container">

<div class="pageAticle">
<div class="typeForm memberfingId">
<form action="/member/finduserpw" method="post" >

<div class="titPage">
	<h2 class="title">???????????? ??????</h2>
</div>

<table class="table" style="margin:0 auto; width:700px;">
	<tr>
		<td class="userId">?????????</td>
	</tr>
	<tr>
		<td><input type="text" name="userId" class="userId" placeholder="???????????? ???????????????"></td>
	</tr>
	<tr>
		<td class="userName">??????</td>
	</tr>
	<tr>
		<td><input type="text" name="userName" class="userName" placeholder="????????? ???????????????"></td>
	</tr>
	<tr>
		<td class="userEm">?????????</td>
	</tr>
	<tr>
		<td><input type="text" name="userEm" class="userEm" placeholder="???????????? ???????????????"></td>
	</tr>
	
	<tr>
		<td class="formFooter">
			<button type="submit" class="btnFindPw">??????</button><br>
			<span class="findId">?????? ???????????? ???????????????? <a href="/member/finduserid">???????????????</a></span>
		</td>
	</tr>
</table>
	
</form>

</div><!-- .typeForm memberfingId  -->
</div><!--.pageAticle  -->
</div><!-- .container -->

</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />
