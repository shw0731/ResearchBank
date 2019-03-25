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
<script src="<c:url value='/resources/common.js'/>" charset="utf-8"></script>
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
	<br />

	<div style="width: 50%; margin: 5% 37%; padding: 1px; text-align: center; ">
		<ul class="nav nav-pill">
			<li role="presentation"><a href="/admin/member">회원관리</a>
			</li>
			<li role="presentation" class="active"><a href="/admin/survey">설문관리</a></li>
			<li role="presentation"><a href="/admin/refund">환급관리</a></li>
		</ul>
	</div>

	<!-- -------------------설문지리스트----------------------------- -->
	<div role="tabpanel" class="tab-pane active" id="home2"
		style="width: 500; margin: 5% 5%; padding: 1px; text-align: center;"
		align="center">
		<h3 align="center">설문리스트</h3>
		<table class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			<thead>
				<tr class="info" align="center">
					<th width="5%">번호</th>
					<th width="10%">시작날짜</th>
					<th width="10%">종료날짜</th>
					<th width="5%">포인트</th>
					<th width="5%">최대참여</th>
					<th width="5%">현재참여</th>
					<th width="5%">답변</th>
					<th width="5%">활성화</th>
					<th width="15%">제목</th>
					<th width="5%">작성자</th>
				</tr>
			</thead>

			<tbody class="surveyList">

			</tbody>
		</table>

		<div id="PAGE_NAVI" class="paging" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
		<!-- -------------------검색기능-------------------- -->
	<div id="Search_Form" class="tab-pane active" align="center">
		<form name="form1" action="${path}/admin/survey">
			<select name="searchOption">
				<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
				<option value="all"
					<c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+작성자</option>
				<option value="SURVEY_SUBJECT"
					<c:out value="${map.searchOption == 'SURVEY_SUBJECT'?'selected':''}"/>>제목</option>
				<option value="MEMBER_ID"
					<c:out value="${map.searchOption == 'MEMBER_ID'?'selected':''}"/>>작성자</option>
			</select> 
			<input name="keyword" value="${map.keyword}"> 
			<input type="submit" value="검색">
		</form>
	</div>
	<!-- -------------------검색기능-------------------- -->
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			window.onload = function() {
				fn_selectSurveyList(1);
			};

		});

		function fn_selectSurveyList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/surveyPaging' />");
			comAjax.setCallback("fn_selectSurveyListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", "${map.searchOption}");
			comAjax.addParam("keyword", "${map.keyword}");
			comAjax.ajax();
		}

		function fn_selectSurveyListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody.surveyList");
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
					eventName : "fn_selectSurveyList"
				};
				gfn_renderPaging(params);

				var str = "";

				$.each(data.list, function(key, value) {
					str += "<tr>" 
							+ "<td>" + value.SURVEY_IDX + "</td>"
							+ "<td>" + value.REG_DATE + "</td>" + "<td>"
							+ value.DEADLINE_DATE + "</td>" + "<td>"
							+ value.SURVEY_POINT + "</td>" + "<td>"
							+ value.MAXIMUM_PART + "</td>" + "<td>"
							+ value.CURRENT_PART + "</td>" + "<td>"
							+ value.ISREPLY + "</td>" + "<td>" 
							+ value.ISOPEN + "</td>" 
							
							+ "<td>" 
							+ "<a href='/research/resultShow?survey_idx="+value.SURVEY_IDX+"'>"   
							+ value.SURVEY_SUBJECT 
							+ "</a>"
							+ "</td>" 
							
							+ "<td>" 
							+ value.MEMBER_ID 
							+ "</td>" 
							
							+ "</tr>";
				});
				body.append(str);

				/* $("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_showNotice($(this));
				}); */

			}
		}
	</script>


</body>
</html>