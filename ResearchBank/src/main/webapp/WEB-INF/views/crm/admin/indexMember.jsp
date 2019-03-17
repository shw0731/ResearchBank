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
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br />
	<br />


	<div
		style="width: 50%; margin: 5% 20% 1% 42%; padding: 1px; text-align: center;">
		<ul class="nav nav-pill">
			<li role="presentation" class="active"><a href="/admin/member">회원관리</a>
			</li>
			<li role="presentation"><a href="/admin/survey">설문관리</a></li>
		</ul>
	</div>



	<!-- ------------------멤버리스트------------------------- -->
	<div role="tabpanel" class="tab-pane active" id="home1"
		style="width: 90%; margin: 5% 5%; padding: 1px; text-align: center;"
		align="center">
		<h3 align="center">멤버리스트</h3>
		<table class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			<thead>
				<tr class="info" align="center">
					<th width="5%">ID</th>
					<th width="5%">닉네임</th>
					<th width="5%">보유 Point</th>
					<th width="5%">성별</th>
					<th width="40%">주소</th>
					<th width="5%">결혼</th>
					<th width="5%">지역</th>
					<th width="5%">직업</th>
					<th width="5%">상태</th>
					<th width="5%">삭제</th>
				</tr>
			</thead>

			<tbody class="memberList">

			</tbody>
		</table>

		<div id="PAGE_NAVI" class="paging" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	<!-- -------------------검색기능-------------------- -->
	<div id="Search_Form" class="tab-pane active" align="center">
		<form name="form1" action="${path}/admin/member">
			<select name="searchOption">
				<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
				<option value="all"
					<c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+제목</option>
				<option value="MEMBER_ID"
					<c:out value="${map.searchOption == 'MEMBER_ID'?'selected':''}"/>>ID</option>
				<option value="MEMBER_NICKNAME"
					<c:out value="${map.searchOption == 'MEMBER_NICKNAME'?'selected':''}"/>>닉네임</option>
				<option value="MEMBER_POINT"
					<c:out value="${map.searchOption == 'MEMBER_POINT'?'selected':''}"/>>포인트</option>
			</select> 
			<input name="keyword" value="${map.keyword}"> 
			<input type="submit" value="조회">
		</form>
	</div>
	<!-- -------------------검색기능-------------------- -->
	

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
		
		function fn_delteMember(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/member/delete' />");
			comSubmit.addParam("MEMBER_ID", obj.parent().find("#MEMBER_ID")
					.val()); // 상위 노드에서 인덱스번호 가져오기.
			comSubmit.submit();
		}

		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/memberPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", "${map.searchOption}");
			comAjax.addParam("keyword", "${map.keyword}");
			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody.memberList");
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
												+ value.MEMBER_ID
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_NICKNAME
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_POINT
											+ "</td>"
											+ "<td>"
											+ value.MEMBER_GENDER
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_ADDRESS
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_MARRY
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_AREA
											+ "</td>"
											+ "<td>"
												+ value.MEMBER_JOB
											+ "</td>"
											+ "<td>"
												+ value.ROLE_ID
											+ "</td>"
											
											+ "<td class='delete'>"
											+ "<a href='#this' name='delete'>"
												+ "탈퇴"
											+ "</a>"
											+ "<input type='hidden' id='MEMBER_ID' name='delete' value="+value.MEMBER_ID+">"
											+ "</td>"
										
										+ "</tr>";
								});
				
				body.append(str);

				 $("a[name='delete']").on("click", function(e) { //탈퇴매앤
					e.preventDefault();
					fn_delteMember($(this));
				}); 

			}
		}
	</script>


</body>
</html>