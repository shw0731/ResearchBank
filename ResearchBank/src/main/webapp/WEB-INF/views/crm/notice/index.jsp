<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- <head>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/css/board.css" rel="stylesheet">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>

</head> --%>
<body>
	<br />
	<br />

<div class='left-box' style="font-family:a">Notice</div>
		 <table class="type04"
                        id="dataTables-example">
			<thead>
				<tr class="info" align="center">
					<th width="*">제목</th>
					<th width="15%">작성일</th>
				</tr>
			</thead>

			<tbody class="notice">
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
<div align="right">
 <a href="#this" class="btn" id="create">글쓰기</a>
 </div>
		<div id="PAGE_NAVI" class="paging" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br /><br /> 
			<strong
			class="haha"></strong>
			
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
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody.notice");
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

									/* 		+ "<td>"
											+ value.NOTICE_IDX
											+ "</td>" */
											
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