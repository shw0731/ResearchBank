<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Refund Your Point</title>
<style>
form {
	margin: 0 auto;
	width: 1000px
}
</style>
<script type="text/javascript">
	function refundpoint(){
		var nowPoint=$("#member_point").val();
		var refundPoint=$("#refund_price").val();
		var memberId=$("#member_id").val();
		refundPoint = Math.floor(refundPoint/10000) * 10000;
		$("#refund_price").val(refundPoint);
		var refundPoint=$("#refund_price").val();
		n= refundPoint;
		n += "이 환전 됩니다. (만원이하내림)";
		alert(n);
		resultPoint = nowPoint-refundPoint;
		$("#result_point").val(resultPoint);
		var remain=$("#result_point").val();

		
		if(refundPoint.length == '0'){
			alert("환전받을 포인트를 입력해주세요");
			return;
		}					
		if(nowPoint < refundPoint){
			alert("포인트가 부족합니다.");
			return;
		} else if(refundPoint < 10000){
			alert("10000원 이상부터 환전가능합니다.");
			return;
		} else{
			$.ajax({
				type : "post",
				url : "refund.do",
				data : JSON.stringify({
					member_id : memberId,
					refund_price : refundPoint,
					}),
				headers : {
					/* "Accept" : "application/json", */
					"Content-Type" : "application/json"
				},
				success : function(success){
					var memberId=$("#member_id").val();
					$.ajax({
						type : "post",
						url : "remainpoint.do",
						data : JSON.stringify({
							member_id : memberId,
							member_point : remain,
							}),
						headers : {
							/* "Accept" : "application/json", */
							"Content-Type" : "application/json"
						},
						success : function(success){
							alert("포인트 환전 신청이 완료되었습니다.");
							location.href= "/mypage";
						}
					})
				}
			})
		}
	}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section id="about" style="padding: 21.5rem 0;">
	<!-- <div style="background:#777777; filter:alpha(opacity:''80'');"> -->
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<br/><h2 class="section-heading text-black">포인트 환전</h2><br/><br/>
					<tr>
						<table class="table table-user-information">
						<th scope="row">
						<font color=black>나의 포인트</font></th>&nbsp;&nbsp;
						<td>
						<input type="text" id="member_point" name="member_point" value = ${map.MEMBER_POINT } readonly>
						<th scope="row">
						<font color=black>환전 포인트</font></th>&nbsp;&nbsp;
						<td><input type="number" id="refund_price" name="refund_price" step="10000" placeholder="10000포인트부터 환전가능">
						</td></table>
						<input type="hidden" id="member_id" name="member_id" value=${MEMBER_ID }>
						<input type="hidden" id="result_point" name="result_point">
						
						<button class="btn" onclick="refundpoint();">환전 신청하기</button><br/><br/>
					</tr>
				</div>
			</div>
		</div>
		<!-- </div> -->
	</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>