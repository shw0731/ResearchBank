<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
    <h2>게시판 목록</h2>
    <table>
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">조회수</th>
                <th scope="col">작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list }" var="row">
                        <tr>
                            <td>${row.IDX }</td>
                            <td class="title">
                                <a href="#this" name="title">${row.TITLE }</a>
                                <input type="hidden" id="IDX" value="${row.IDX }">
                            </td>
                            <td>${row.HIT_CNT }</td>
                            <td>${row.REGIST_DATE}</td>
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
    <br/>
    <a href="#this" class="btn" id="write">글쓰기</a>

<section class="left_section">

</section>

<section class="section_content">

</section>


<section class="right_section">

</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>