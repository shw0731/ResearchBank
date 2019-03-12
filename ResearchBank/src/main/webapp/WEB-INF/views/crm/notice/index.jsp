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
	background-image: url("/images/inquiry/FAQ.jpg");
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

	<div role="tabpanel" class="tab-pane active" id="home"
		style="width: 50%; margin: 10% 25% 10% 25%; padding: 1px; text-align: center;"
		align="center">
		<img class="small1" src="/resources/images/notice/Title.jpg">
		<table class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			<thead>
				<tr class="info" align="center">
					<th width="15%">글번호</th>
					<th width="*">제목</th>
					<th width="15%">날짜</th>
				</tr>
			</thead>

			<tbody>
				<%-- <c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.NOTICE_IDX }</td>
								<td class="title">
									<a href="#this" name="title">${row.NOTICE_SUBJECT }</a>
									<input type="hidden" id="NOTICE_IDX" value="${row.NOTICE_IDX}">
								</td>
								<td>${row.NOTICE_CONTEXT }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">공지가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose> --%>



			</tbody>


		</table>

		<div id="PAGE_NAVI" class="paging" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br /> <a
			href="#this" class="btn" id="create">글쓰기</a><br /> 
			<strong
			class="haha"></strong>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			window.onload = function() {
				fn_selectBoardList(1);
			};

			$("#create").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_createNotice();
			});

			/* $("a[name='title']").on("click", function(e) { //상세보기로
				e.preventDefault();
				fn_showNotice($(this));
			});  */

		});

		function fn_createNotice() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/create' />");
			comSubmit.submit();
		}

		function fn_showNotice(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/show' />");
			comSubmit.addParam("NOTICE_IDX", obj.parent().find("#NOTICE_IDX")
					.val()); // 상위 노드에서 인덱스번호 가져오기.
			comSubmit.submit();
		}

		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/notice/paging' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
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
											/* + "<td>" + value.NOTICE_IDX + "</td>"
											+ "<td>" + "<a href='#value' name='trigger'>"
											+ value.NOTICE_SUBJECT 
											+ "</a>" 
											+ "</td>"
											+ "</tr>"
											+ "<tr name='article' class='hide'>"
											+ "<td colspan='3'>"
											+ "<a name='value' id='IDX'>" + "</a>"
											+ value.NOTICE_CONTEXT + "</td>" 
											+ "</tr>"; */
											/* $(".haha").append('<p>'+value.NOTICE_IDX+'</p>'); */

											+ "<td>"
											+ value.NOTICE_IDX
											+ "</td>"
											
											+ "<td class='title'>"
											+ "<a href='#this' name='title'>"
											+ value.NOTICE_SUBJECT
											+ "</a>"
											+ "<input type='hidden' id='NOTICE_IDX' name='title' value=" + value.NOTICE_IDX + ">"
											+ "</td>"
											
												+ "<td>" 
												+ value.NOTICE_DATE
												+ "</td>"

											+ "</tr>";
								});
				body.append(str);

				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_showNotice($(this));
				});

			}
		}
	</script>


</body>
</html>