<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/intro.css" rel="stylesheet">
<link href="/resources/css/face.css" rel="stylesheet">
<link href="/resources/css/hello.css" rel="stylesheet">
<link href="/resources/css/modal.css" rel="stylesheet">
<link href="/resources/css/medium-editor.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Research!</title>
</head>
<body style="background-color: #efa151;">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrap"></div>
	<%@ include file="/WEB-INF/views/crm/introduction/partial/hello.jsp"%>
	<%@ include file="/WEB-INF/views/crm/introduction/partial/face.jsp"%>
	<%@ include file="/WEB-INF/views/crm/introduction/partial/modal.jsp"%>

</body>
<script src="/resources/js/introduce/intro.js"></script>
<script src="/resources/js/introduce/hello.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/introduce/medium-editor.min.js"></script>
<script type="text/javascript">
	setInterval(function() {
		init('submit')
	}, 8000);
	</script>
</html>
