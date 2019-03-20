<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/resources/js/research/research.js"></script>
	<br />
	<br />
		<br />
	<div class="row">
		<div class="col-lg-8 mx-auto text-center">
			<h2 class="section-heading">Let's Get In Touch!</h2>
			<p class="mb-5">Ready for perfect service for you</p>
		</div>
	</div>
	<hr />
	<div class="wrap" style="margin: 10% 20% 10% 20%;">
		<table class="type04" id="dataTables-example">
			<thead>
				<tr class="info" align="center">
					<th width="15%">포인트</th>
					<th width="*">제목</th>
					<th width="15%">참여수</th>
					<th width="15%">마감일</th>
					<th width="15%">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list }" var="row">

							<tr  height="50px">
								<td align="center">${row.SURVEY_POINT}</td>
								<td class="odd gradeX">
								<a	href="/research/resultShow?survey_idx=${row.SURVEY_IDX }&member_id=${MEMBER_ID}" name="title">
									${row.SURVEY_SUBJECT }
								</a> 
								<input type="hidden" id="survey_idx" value="${row.SURVEY_IDX }"></td>
								<td align="center">${row.CURRENT_PART }/${row.MAXIMUM_PART }</td>
								<td align="center">${row.DEADLINE_DATE}</td>
								<td align="center">${row.MEMBER_NICKNAME}</td>
							</tr>

						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>


				</c:choose>
			</tbody>

		</table>
		<br />



		<form id="search">
			<select class="slcte" name="searchNum" id="searchNum">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select> <input class="txte" type="text" name="isSearch" id="isSearch" /> <span
				class="btn btnC_03 btnP_04 mr10">
				<button type="button" onclick="fn_search();">검색</button>
			</span>
		</form>


		<div class="paging">${pagingHtml}</div>

	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>