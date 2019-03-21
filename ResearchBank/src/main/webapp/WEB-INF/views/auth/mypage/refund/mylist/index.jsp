<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Refund List</title>
<style>
form {
	margin: 0 auto;
	width: 1000px
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
<h3 align="center">환전신청내역</h3>
<table style="border:1px solid #ccc" align="center">
    <colgroup>
        <col width="100px"/>
        <col width="300px"/>
        <col width="100px"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">환전금액</th>
            <th scope="col">신청일자</th>
            <th scope="col">상태</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list }" var="row">
                    <tr>
                        <td>${row.REFUND_PRICE }원</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${row.REGIST_DATE }" /></td>
                        <td><c:if test="${row.REFUND_STATE == 0}">신청</c:if>
							<c:if test="${row.REFUND_STATE == 1}">완료</c:if></td>
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
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>