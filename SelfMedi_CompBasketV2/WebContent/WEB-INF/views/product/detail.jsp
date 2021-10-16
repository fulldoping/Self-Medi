<%@page import="com.fulldoping.product.dto.NutrientInfo"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">

	window.onload = function() {
		$("button[data-btn]").click(function() {
			$("#" + $(this).attr("data-btn")).toggle();
		});		
 			
		$("[name='addbasket']").click(function() {
			
			$.ajax({
				type: "post"
				, url: "/add/basket"
				, data: {
					productId: '${param.productId }'
				}
				, dataType: "json"
				, success: function(res) {
					if( confirm("비교함으로 이동하시겠습니까?") ) {
						location.href = "/basket/view";
					}
					
					console.log( res.result )
				}
				, error: function() {
					console.log("ajax error")
				}
			})
			
 		    if(confirm("비교함에 추가 하시겠습니까 ?") == true){
 		        alert("추가 되었습니다");
// 				local.href="/add/basket?productId=${productInfo.productId }";
 		    }else{
 		        return ;
 		    }
		});
		/* 
		$("[name='addbasket']").click(function() {
			if( confirm("비교함에 추가 하시겠습니까 ?") == true ) {
				$.ajax({
					//보관함 상품 확인 URL로
					//상품번호 전달
				url:"/add/basket",
				data:{ proid: "${productInfo.productId }" },
				type:"GET",
					dataType:"json"
				})
				.done(function(json) {
				})
			}else{
 		       	return false;
			}
		});
		 */
	}; //window.onload end

	// window.onload = function() {
	// 	//이벤트리스너 등록 - addEventListener
	// 	//이벤트리스너 해제 - removeEventListener
	// 	//--------------------------------------------------------
	// 	<c:forEach items="${nikList }" var="nik">
	// 	btn${nik.ni.nutId }.addEventListener("click", togleDetail${nik.ni.nutId })
	// 	</c:forEach>
	// 	//--------------------------------------------------------

	// } //window.onload end

	// <c:forEach items="${nikList }" var="nik">
	// function togleDetail${nik.ni.nutId }() {
	// 	if (detail${nik.ni.nutId }.style.display == "none"){
	// 	detail${nik.ni.nutId }.style.display = "table-row-group";
	// 	}else{
	// 		detail${nik.ni.nutId }.style.display = "none";
	// 	}

	// }
	// </c:forEach>
	
</script>


<h1>디테일 페이지</h1>

<hr>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-zv4m {
	border-color: #ffffff;
	text-align: left;
	vertical-align: top
}

.tg .tg-baqh {
	text-align: center;
	vertical-align: top
}

.tg .tg-8jgo {
	border-color: #ffffff;
	text-align: center;
	vertical-align: top
}

.tg .tg-lqy6 {
	text-align: right;
	vertical-align: top
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

table {
	margin: auto
}

meter {
    -webkit-writing-mode: horizontal-tb !important;
    appearance: auto;
    box-sizing: border-box;
    display: inline-block;
    height: 3em;
    width: 25em;
    vertical-align: -0.2em;
    -webkit-user-modify: read-only !important;
}

.detail{
	display: none;
}
</style>

<table class="tg" style="table-layout: fixed; width: 960px">
	<colgroup>
		<col style="width: 480px">
		<col style="width: 240px">
		<col style="width: 240px">
	</colgroup>
	<thead>
		<tr>
			<td class="tg-0lax" rowspan="3"><img src="${productInfo.image }"
				width="470" height="300"></td>
			<td class="tg-baqh">${productInfo.productName }</td>
			<td class="tg-lqy6">별점 : ${productInfo.starScore }점</td>
		</tr>
		<tr>
			<td class="tg-baqh">제조사 : ${productInfo.manuCom }</td>
			<td class="tg-baqh">타입 : ${productInfo.type }</td>
		</tr>
		<tr>
			<td class="tg-baqh"><a href="${productInfo.purchaseLink }">구매하러가기</a></td>
			<td class="tg-baqh"><button name="addbasket">
				비교함추가
					<%-- <a href="/add/basket?productId=${productInfo.productId }">비교함추가</a> --%>
				</button></td>
		</tr>
	</thead>
</table>




<hr>


<table class="tg" style="table-layout: fixed; width: 960px">
	<colgroup>
		<col style="width: 120px">
		<col style="width: 310px">
		<col style="width: 90px">
		<col style="width: 170px">
		<col style="width: 170px">
		<col style="width: 100px">
	</colgroup>
	<c:forEach items="${nikList }" var="nik">
		<thead>
			<tr>
				<th class="tg-baqh">${nik.nk.nutKind }</th>
				<%--     <th class="tg-baqh" colspan="2">${nik.ni.nutContent }/ ${nik.nk.rcmAdult }</th> --%>

				<%--     <% pageContext.setAttribute("nutContentValue", ((NutrientInfo)((Map)pageContext.getAttribute("nik")).get("ni")).getNutContent().replaceAll("[^0-9]", "") ); %> --%>
				<%--     <th class="tg-baqh" colspan="2">${nutContentValue }/ ${nik.nk.rcmAdult }</th> --%>

				<%--     <th class="tg-baqh" colspan="2">${nik.ni.nutContent.replaceAll("[^0-9]", "") /${nik.nk.rcmAdult.replaceAll("[^0-9]", "") }</th>--%>
				<th class="tg-baqh" colspan="2"><meter
						low='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*0.85 }'
						high='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.15 }' min='0'
						max='${nik.nk.rcmAdult.replaceAll("[^0-9]", "")*1.3 }'
						optimum='${nik.nk.rcmAdult.replaceAll("[^0-9]", "") }'
						value='${nik.ni.nutContent.replaceAll("[^0-9]", "") }'> </meter></th>

				<th class="tg-baqh">${nik.ni.nutContent }</th>
				<th class="tg-baqh">${nik.nk.rcmAdult }</th>
				<%--     <th class="tg-8jgo"><button id = "btn${nik.ni.nutId }">상세</button></th> --%>
				<th class="tg-8jgo"><button data-btn="detail${nik.ni.nutId }">상세</button></th>
			</tr>
		</thead>
		<tbody id="detail${nik.ni.nutId }" class="detail">
			<tr>
				<td class="tg-baqh" colspan="5" style="width: 860px">${nik.nk.effect }</td>
				<td class="tg-zv4m"></td>
			</tr>
			<tr>
				<td class="tg-baqh" colspan="2">${nik.nk.deficiency }</td>
				<td class="tg-baqh" colspan="3">${nik.nk.hyperact }</td>
				<td class="tg-zv4m"></td>
			</tr>
		</tbody>
	</c:forEach>
</table>


<c:import url="/WEB-INF/views/layout/footer.jsp" />