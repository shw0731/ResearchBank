<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>ResearchBank</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/creative.css" rel="stylesheet">

</head>

<style>
/* The subnavigation menu */
.subnav {
  float: left;
  overflow: hidden;
  transition: 1s;
  display:block;
  
}
/* Subnav button */
.subnav .subnavbtn {
  font-size: 16px; 
  border: none;
  outline: none;
  color: white;
  padding: 50px 50px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
  transition: 1s;
}
/* Style the subnav content - positioned absolute */
.subnav-content {
  display: none;
  position: absolute;
  background-color: #2e3436;
  margin-top : 0px;
  margin-left: 15px;
  width: 100%;
  height: 50px;
  z-index: 1;
  transition: 1s;
}
/* .subnav:before {
	content: '';
    width: 100%;
    height: 40px;
    position: absolute;
    top: 57px;
    left: 0;
    background: #2e3436;
    opacity:0;
} */
/* Style the subnav links */
.subnav-content a {
  
  left:1;
  color: white;
  text-decoration: none;
  transition: 1s;
}
/* Add a grey background color on hover */
.subnav-content a:hover {
  background-color: #eee;
  color: black;
}
/* When you move the mouse over the subnav container, open the subnav content */
.subnav:hover .subnav-content {
  
  display: block;
  
}

.subnav:hover:before {
	opacity: 1;
}
</style>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
    <span style="color:orange"><i class="fa fa-circle-o-notch fa-spin fa-fw"></i></span>
      <a class="navbar-brand js-scroll-trigger" href="/">Research Bank</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/introduction.do">About</a>
          </li>
          <li class="nav-item subnav">
            <a class="nav-link js-scroll-trigger subnavbtn" href="#services">Research</a>
            <div class="subnav-content">
		      <a href="/research/index">최근 설문</a>
		      <a href="/research/deadline">마감일 임박 설문</a>
		      <a href="/research/rank">조회수 RANKing </a>
		      <a href="/research/rankpoint">포인트 RANKing</a>
		    </div>
          </li>
          <li class="nav-item subnav">
            <a class="nav-link js-scroll-trigger subnavbtn" href="#portfolio">My Bank</a>
            <div class="subnav-content">
		      <a href="/mylist">내 설문조사</a>  
		      <a href="#">참여한설문조사</a>
		      <a href="/research/create?member_id=${MEMBER_ID }">설문조사등록</a>
		     </div>
          </li>
          <li class="nav-item subnav">
            <a class="nav-link js-scroll-trigger subnavbtn" href="#contact">Services</a>
            <div class="subnav-content">
		      <a href="/inquiry">1:1문의</a>
		      
		      <c:choose>	
			      <c:when test="${MEMBER_NICKNAME != null }">
			      <c:choose>	
			      	<c:when test="${ROLE_ID == 1 }">
			      		<a href="/admin/member">관리자페이지</a>
			      	</c:when>
			      	<c:otherwise>
			      		<a href="/mypage">마이페이지</a>
			      	</c:otherwise>
			      </c:choose>
			      </c:when>
			      <c:otherwise>
			       <a href="/login.do">마이페이지</a>
			      </c:otherwise>
		      </c:choose>
		     </div>
          </li>
          <c:if test="${MEMBER_NICKNAME == null }">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/login.do">Login</a>
          </li>
   		  </c:if>	
   		  <c:if test="${MEMBER_NICKNAME != null }">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/logout" onclick="kout()">Logout</a>
          </li>
   		  </c:if>    	
        </ul>
      </div>
    </div>
  </nav>
  <script type="text/javascript">
  function kout(){
	  		Kakao.init('2781e3026435a73d6cb50a6d5f3d32ab');
			Kakao.Auth.logout(function(data){
				  if(data==true){
					  alert("성공");
				  }else{
				 	 alert("로그아웃 실패!");
			  }
		  });
	  }
  </script>
  
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="/resources/vendor/scrollreveal/scrollreveal.min.js"></script>
  <script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/creative.min.js"></script>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/common.js'/>" charset="utf-8"></script>