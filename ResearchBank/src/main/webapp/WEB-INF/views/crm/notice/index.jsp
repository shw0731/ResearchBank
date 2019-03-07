<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrap">
		<h1>공지사항</h1>
		<hr />
		<section class="left_section"></section>

		<table style="border: 1px solid #ccc">
			<colgroup>
				<col width="10%" />
				<col width="50%" />
				<col width="100%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">내용</th>
				</tr>
			</thead>
			<tbody>
			<%-- 	<c:choose>
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

		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br /> 
		
		<a href="#this" class="btn" id="create">글쓰기</a>

		<section class="right_section"></section>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1);
			
			$("#create").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_createNotice();
			});

			$("a[name='title']").on("click", function(e) { //상세보기로
				e.preventDefault();
				fn_showNotice($(this));
			});
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
		function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />");
            comAjax.setCallback("fn_selectBoardListCallback");
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", 15);
            comAjax.ajax();
        }
         
        function fn_selectBoardListCallback(data){
            var total = data.TOTAL;
            var body = $("table>tbody");
            body.empty();
            if(total == 0){
                var str = "<tr>" +
                                "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                            "</tr>";
                body.append(str);
            }
            else{
                var params = {
                    divId : "PAGE_NAVI",
                    pageIndex : "PAGE_INDEX",
                    totalCount : total,
                    eventName : "fn_selectBoardList"
                };
                gfn_renderPaging(params);
                 
                var str = "";
                $.each(data.list, function(key, value){
                    str += "<tr>" +
                                "<td>" + value.NOTICE_IDX + "</td>" +
                                "<td class='title'>" +
                                    "<a href='#this' name='title'>" + value.NOTICE_SUBJECT + "</a>" +
                                    "<input type='hidden' name='title' value=" + value.NOTICE_IDX + ">" +
                                "</td>" +
                                "<td>"+value.CONTEXT+"</td>"+
                            "</tr>";
                });
                body.append(str);
                 
                $("a[name='title']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_showNotice($(this));
                });
            }
        }
        
		
	</script>


</body>
</html>