<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class='left-box' style="font-family:a">1:1 QnA</div>
				<!-- 	<colgroup >
			
						<col width="15%"  /> 글번호
						<col width="*" /> 제목
						<col width="15%" /> 조회수
						<col width="30%" /> 작성일
					</colgroup> -->
					<form id=frm>
					 <table class="type04"
                        id="dataTables-example">
                        
					<thead>
						<tr class="info" align="center" >
				<!-- 			<th scope="row" width="15%">글번호</th> -->
							<th scope="row" width="*">제목</th>
							<th scope="row" width="10%">조회수</th>
							<th scope="row" width="10%">직성자</th>
							<th scope="row" width="25%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list }" var="row">
							
									<tr>
										<%-- <td align="center">${row.IDX }</td> --%>
										<td class="odd gradeX">
										<c:if test="${row.RE_STEP == '1' }">
									<img src="/resources/images/inquiry/comment.gif">
										</c:if>
										<c:if test="${row.INQUIRY_STATE=='1'}">
                        <img src="/resources/images/icon_secret.gif">
									</c:if>
									
							
    						   <c:choose>
                                <c:when test="${row.INQUIRY_STATE == '0'}">
                               		 <a href="#this" name="Ititle">${row.TITLE }</a>
                                     <input type="hidden" id="IDX" value="${row.IDX }">
                                     <input type="hidden" id="MEMBER_ID" value="${row.MEMBER_ID}">
                                </c:when>
                                <c:when test="${MEMBER_ID == null}">
                                	${row.TITLE }
                                </c:when>
                                
                                <c:otherwise><!-- 비밀글이면 -->
									<c:choose>
                                		<c:when test="${row.MEMBER_ID == MEMBER_ID  || ROLE_ID == '1' || row.PARENTS_ID == MEMBER_ID}"> <!-- 비밀글인데 관리자거나 아이디 같으면 -->
                                		 <a href="#this" name="Ititle">${row.TITLE }</a>
                              	 	    <input type="hidden" id="IDX" value="${row.IDX }">
                             		     <input type="hidden" id="MEMBER_ID" value="${row.MEMBER_ID}">
                            	        <input type="hidden" id="INQUIRY_STATE" value="${row.INQUIRY_STATE}">
                                		</c:when>
                                		<c:otherwise> <!-- 비밀글인데 관리자도 아니고 아이디도 같지 않으면 -->
                                			 ${row.TITLE }
                                		</c:otherwise>
                                </c:choose>
                                		</c:otherwise>
                                		</c:choose>
		</td>					
										<td align="center">${row.HIT_CNT }</td>
										<td align="center">${row.MEMBER_NICKNAME}</td>
										<td align="center"><fmt:formatDate value="${row.REGIST_DATE}" pattern="yyyy.MM.dd"/></td>
									</tr>

								</c:forEach>
							</c:when>

							 <c:otherwise>
								<tr>
									<td colspan="5">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
							
							
						</c:choose>
					</tbody>
					
				</table>
				</form>
				 <c:if test="${MEMBER_ID != null }">
				<div align="right" >
				<a href="#this" class="btn" id="write">작성하기</a>
				</div>
				</c:if>
				<div class="paging" align="center">
               ${pagingHtml}
            </div>
<form id="commonForm" name="commonForm"></form>



</body>
</html>