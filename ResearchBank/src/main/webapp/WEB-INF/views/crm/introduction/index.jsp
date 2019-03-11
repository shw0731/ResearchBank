<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/intro.css" rel="stylesheet">
<link href="/resources/css/face.css" rel="stylesheet">
<link href="/resources/css/hello.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Research!</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrap">
		<div class="line1">
			<div class="line"></div>
		</div>
		<div class="line2">
			<div class="line"></div>
		</div>

		<div class="texts">
			<span>{</span> <span class="devtips">Research<br>Bank
			</span> <span>}</span>
		</div>
</div>
<%@ include file="/WEB-INF/views/crm/introduction/partial/face.jsp"%>
<%@ include file="/WEB-INF/views/crm/introduction/partial/hello.jsp"%>

</body>
<script src="/resources/js/introduce/intro.js"></script>
<script src="/resources/js/introduce/hello.js"></script>
</html>
