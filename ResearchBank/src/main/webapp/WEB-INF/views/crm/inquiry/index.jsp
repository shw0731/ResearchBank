
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Research!</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br />
	<br />
	<br />
	<h2>고객지원실</h2>
	<div role="tabpanel">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">

			<li role="presentation" class="active"><a href="#home"
				aria-controls="home" role="tab" data-toggle="tab">FAQ</a></li>
			<li role="presentation"><a href="#oneone" aria-controls="oneone"
				role="tab" data-toggle="tab">1:1문의</a></li>
			<li role="presentation"><a href="#profile"
				aria-controls="profile" role="tab" data-toggle="tab">마일리지 프로그램</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">


			<div role="tabpanel" class="tab-pane active" id="home">

				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">

					자주묻는 질문과 답변

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">



							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> 로그인 및 회원가입은 어떻게 하나요? </a>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> 비밀번호를
									잊어버렸어요! </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree"> 마일리지
									교환은 어디서 하나요? </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour"> 포인트
									결제/환불방법을 알고싶어요 </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>

					<div></div>

				</div>
			</div>



			<div role="tabpanel" class="tab-pane" id="profile">
				RESEARCH BANK 마일리지 프로그램<br /> 1. 포인트 전환 신청 시기: 매월 1일부터 25일까지<br />
				2. 현금 입금 시기: 포인트 전환 신청을 한 다음 달 영업일 초<br /> 3. 포인트 전환 가능 금액:
				10,000원부터 10,000원 단위로 전환 가능 <br /> 4. 포인트 전환 계좌 이체 수수료: 500원<br />
				(참고: 60,000원 이상 전환 시부터 세금이 붙으므로, 포인트 전환은 1회 50,000원 이하로 시도하시는 편이
				좋습니다)<br /> 5. 계좌오류 등으로 포인트 전환 실패 시, 가입 시 등록한 메일로 '안내 메일'이 발송됩니다.<br />


			</div>

			<div role="tabpanel" class="tab-pane" id="oneone">
		<table>
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="20%" />
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
										<td class="title"><a href="#this" name="title">${row.TITLE }</a>
											<input type="hidden" id="IDX" value="${row.IDX }"></td>
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
				<a href="/inquiry/storeInquiryWrite" class="btn" id="write">글쓰기</a>



			</div>


		</div>
		<!-- 탭컨텐츠ㅡ누르면 토글하는거 -->

	</div>
	<!-- 탭판넬 ㅡ아코디언-->
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1);
			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});

		});

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/showInquiryDetail' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
 </script>

</body>
</html>