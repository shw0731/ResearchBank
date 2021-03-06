<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>
<style>
.small1 {
	width: 250px;
}

.small2 {
	height: 100px;
}

.box2-1 {
	width: 100px;
	height: 100px;
}

thead>tr>th {
	text-align: center;
}

tbody>tr>td:nth-child(1) {
	width: 80px;
	text-align: center;
}

tbody>tr>td:nth-child(3) {
	width: 110px;
	text-align: center;
}

tbody>tr>td:nth-child(4) {
	width: 130px;
	text-align: center;
}

tbody>tr>td:nth-child(5) {
	width: 70px;
	text-align: center;
}

tbody>tr:HOVER {
	color: #da8c92;
	cursor: pointer;
}

.menu-wrap {
	text-align: right;
}

.form-wrap {
	text-align: center;
}

#wrap .box {
	width: 300px;
	height: 300px;
	margin: 0 auto;
}
</style>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br />
	<br />
	<br />

	<div style="width: 50%; margin: 5% 37%; padding: 1px; text-align: center; ">
		<ul class="nav nav-pill">
			<li role="presentation"><a href="/admin/member">회원관리</a>
			</li>
			<li role="presentation"><a href="/admin/survey">설문관리</a></li>
			<li role="presentation" class="active"><a href="/admin/refund">환급관리</a></li>
		</ul>
	</div>


	<!-- ------------------refund리스트------------------------- -->
	<div role="tabpanel" class="tab-pane active" id="home1"
		style="width: 90%; margin: 5% 5%; padding: 1px; text-align: center;"
		align="center">
		<h3 align="center">환급관리</h3>
		<table class="type04"
			id="dataTables-example">
			<thead>
				<tr class="info" align="center">
					<th width="5%">번호</th>
					<th width="5%">환전금액</th>
					<th width="5%">신청자</th>
					<th width="5%">신청일자</th>
					<th width="5%">상태</th>
					<th width="5%">입금하기</th>
				</tr>
			</thead>

			<tbody class="refundList">

			</tbody>
		</table>

		<div id="PAGE_NAVI" class="paging" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			window.onload = function() {
				fn_selectBoardList(1);
			};

			/* $("a[name='title']").on("click", function(e) { //상세보기로
				e.preventDefault();
				fn_showNotice($(this));
			});  */

		});

		/* function fn_showNotice(obj) { // 상세보기
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/show' />");
			comSubmit.addParam("NOTICE_IDX", obj.parent().find("#NOTICE_IDX")
					.val()); // 상위 노드에서 인덱스번호 가져오기.
			comSubmit.submit();
		} */
		
		function fn_refundMember(obj) {
			console.log(obj.parent().find("#REFUND_STATE").val());
			if((obj.parent().find("#REFUND_STATE").val())=='지급완료')
			{
				alert("이미 송금한 대상입니다.");
			}
			else{
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/admin/member/refunding' />");
				comSubmit.addParam("MEMBER_ID", obj.parent().find("#MEMBER_ID").val()); // 상위 노드에서 인덱스번호 가져오기.
				comSubmit.addParam("REFUND_NO", obj.parent().find("#REFUND_NO").val()); // 상위 노드에서 인덱스번호 가져오기.
				comSubmit.submit();
			}
		} 

		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/refundPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody.refundList");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);

				var str = "";

				$
						.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
												+ value.REFUND_NO
											+ "</td>"
									
											+ "<td>"
												+ value.REFUND_PRICE + " 원"
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_ID
											+ "</td>"
											+ "<td>"
												+ value.REGIST_DATE
											+ "</td>"
											+ "<td>"
												+ value.REFUND_STATE
											+ "</td>"
										
											+ "<td class='refunding'>"
											+ "<a href='#this' name='refunding'>"
												+ "환전"
											+ "</a>"
											+ "<input type='hidden' id='MEMBER_ID' name='MEMBER_ID' value="+value.MEMBER_ID+">"
											+ "<input type='hidden' id='REFUND_NO' name='REFUND_NO' value="+value.REFUND_NO+">"
											+ "<input type='hidden' id='REFUND_STATE' name='REFUND_STATE' value="+value.REFUND_STATE+">"
											+ "</td>"
										
										+ "</tr>";
								});
				
				body.append(str);

				$("a[name='refunding']").on("click", function(e) { //환전
					
						var message = confirm("송금 하시겠습니까?");
						if(message ==true){
							e.preventDefault();
							fn_refundMember($(this));
						}
					
				});  

			}
		}
	</script>


</body>
</html>