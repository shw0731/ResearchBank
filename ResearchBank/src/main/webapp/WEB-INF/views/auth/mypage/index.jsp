<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">
<!-- <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/face.css" rel="stylesheet">
<link href="/resources/css/hello.css" rel="stylesheet">
<link href="/resources/css/intro.css" rel="stylesheet">
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/css/bootstrap-theme.min.css" rel="stylesheet">  -->

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
<h1>마이페이지</h1>  
  <div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
       <br>
      </div>
         <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   			 <tbody>
                      <tr>
          <div class="panel panel-info"> 
            <div class="panel-heading">
              <h3 class="panel-title">${MEMBER_NICKNAME}님의 프로필 정보</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                   
                        <td>아이디:</td>
                        <td>${MEMBER_ID}</td>
                      </tr>
                      <tr>
                        <td>닉네임:</td>
                        <td>${MEMBER_NICKNAME}</td>
                      </tr> 
                      <tr>
                        <td>포인트:</td>
                        <td>${map.MEMBER_POINT}<a href="/refund.do" type="button" class="button button-orange"><span>환전하기</span> </a> </td>
                      </tr>                  
                      <tr>
                        <td>성별:</td>
                        <c:if test="${map.MEMBER_GENDER == 0}">
   						 <td>여성</td> 
						</c:if>
						<c:if test="${map.MEMBER_GENDER == 1}">
   						 <td>남성</td>  
						</c:if>
                      </tr>
                      <tr>
                        <td>생년월일:</td>
                        <td>${map.MEMBER_BIRTH}</td>
                      </tr>
         			 <%-- <tr>
                        <td>주소:</td>
                        <td>${map.MEMBER_ADDRESS}</td>
                      </tr> --%>
                      <tr>
                      	 <td>결혼 여부:</td>
						<c:if test="${map.MEMBER_MARRY == 0}">
   						 <td>미혼</td> 
						</c:if>
						<c:if test="${map.MEMBER_MARRY == 1}">
   						 <td>기혼</td> 
						</c:if>
					 </tr>
                      <tr>
                        <td>지역:</td>
                        <td>${map.MEMBER_AREA}</td>
                      </tr>      
                       <tr>
                        <td>직업:</td>
                        <td>${map.MEMBER_JOB}</td>    
                      </tr> 
                    </tbody>
                  </table> 
                  
                 <!--   <a href="#" class="btn btn-primary">My Sales Performance</a>
                  <a href="#" class="btn btn-primary">Team Sales Performance</a>-->
                  
                </div>
              </div>
            </div>
                 <div class="panel-footer">  
				<a href="updateMember" type="button" class="button button-orange">
					<span>수정하기</span>
				</a>
			</div>
			      
               </div>
            
          </div>
        </div>
      </div>
    </div>
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

<style>
.button {
  /* Fallback style */
  border: 1px solid rgba(0, 0, 0, 0.3);
  color: white;
  display: inline-block;
  font: bold 1.5em 'Trebuchet MS', Arial, Helvetica, NanumGothic, '나눔고딕', 'Nanum Gothic', Dotum, '돋음';
  margin: 10px;
  text-align: center;
  text-decoration: none;
  text-shadow: 0px 1px rgba(0, 0, 0, 0.4);
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
  border-radius: 0.3em;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  -webkit-box-shadow: 0px 0px 0.05em rgba(0, 0, 0, 0.4);
  -moz-box-shadow: 0px 0px 0.05em rgba(0, 0, 0, 0.4);
  box-shadow: 0px 0px 0.05em rgba(0, 0, 0, 0.4);
}
.button:hover {
  -webkit-box-shadow: 0px 0px 0.05em rgba(0, 0, 0, 0.4);
  -moz-box-shadow: 0px 0px 0.05em rgba(0, 0, 0, 0.4);
  box-shadow: 0px 0px 0.05em rgba(0, 0, 0, 0.4);
}
.button:active {
  /* When pressed, move it down 1px */
  position: relative;
  top: 1px;
}
.button span {
  padding: 0.1em 1em;
  display: block;
  border-top: 1px solid rgba(255, 255, 255, 0.5);
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
  border-radius: 0.3em;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  /* Pattern settings */
  -moz-background-size: 3px 3px;
  -webkit-background-size: 3px 3px;
  background-image: -webkit-gradient(linear, 0 0, 100% 100%, color-stop(0.25, rgba(0, 0, 0, 0.05)), color-stop(0.25, transparent), to(transparent)), -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(0, 0, 0, 0.05)), color-stop(0.25, transparent), to(transparent)), -webkit-gradient(linear, 0 0, 100% 100%, color-stop(0.75, transparent), color-stop(0.75, rgba(0, 0, 0, 0.05))), -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.75, transparent), color-stop(0.75, rgba(0, 0, 0, 0.05)));
  background-image: -moz-linear-gradient(45deg, rgba(0, 0, 0, 0.05) 25%, transparent 25%, transparent), -moz-linear-gradient(-45deg, rgba(0, 0, 0, 0.05) 25%, transparent 25%, transparent), -moz-linear-gradient(45deg, transparent 75%, rgba(0, 0, 0, 0.05) 75%), -moz-linear-gradient(-45deg, transparent 75%, rgba(0, 0, 0, 0.05) 75%);
  background-size: 3px 3px;
}
.button.button-khaki {
  background: #a2b598;
  background-image: -moz-linear-gradient(top, #bdd1b4, #a2b598);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#bdd1b4), to(#a2b598));
  background-image: -webkit-linear-gradient(top, #bdd1b4, #a2b598);
  background-image: -o-linear-gradient(top, #bdd1b4, #a2b598);
  background-image: linear-gradient(to bottom, #bdd1b4, #a2b598);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#bdd1b4', endColorstr='#a2b598');
}
.button.button-khaki:hover {
  background: #bdd1b4;
  background-image: -moz-linear-gradient(top, #a2b598, #bdd1b4);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#a2b598), to(#bdd1b4));
  background-image: -webkit-linear-gradient(top, #a2b598, #bdd1b4);
  background-image: -o-linear-gradient(top, #a2b598, #bdd1b4);
  background-image: linear-gradient(to bottom, #a2b598, #bdd1b4);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a2b598', endColorstr='#bdd1b4');
}
.button.button-khaki:active {
  background: #a2b598;
}
.button.button-blue {
  background: #4477a1;
  background-image: -moz-linear-gradient(top, #81a8cb, #4477a1);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#81a8cb), to(#4477a1));
  background-image: -webkit-linear-gradient(top, #81a8cb, #4477a1);
  background-image: -o-linear-gradient(top, #81a8cb, #4477a1);
  background-image: linear-gradient(to bottom, #81a8cb, #4477a1);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#81a8cb', endColorstr='#4477a1');
}
.button.button-blue:hover {
  background: #81a8cb;
  background-image: -moz-linear-gradient(top, #4477a1, #81a8cb);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#4477a1), to(#81a8cb));
  background-image: -webkit-linear-gradient(top, #4477a1, #81a8cb);
  background-image: -o-linear-gradient(top, #4477a1, #81a8cb);
  background-image: linear-gradient(to bottom, #4477a1, #81a8cb);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4477a1', endColorstr='#81a8cb');
}
.button.button-blue:active {
  background: #4477a1;
}
.button.button-brown {
  background: #8f3714;
  background-image: -moz-linear-gradient(top, #bf6f50, #8f3714);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#bf6f50), to(#8f3714));
  background-image: -webkit-linear-gradient(top, #bf6f50, #8f3714);
  background-image: -o-linear-gradient(top, #bf6f50, #8f3714);
  background-image: linear-gradient(to bottom, #bf6f50, #8f3714);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#bf6f50', endColorstr='#8f3714');
}
.button.button-brown:hover {
  background: #bf6f50;
  background-image: -moz-linear-gradient(top, #8f3714, #bf6f50);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#8f3714), to(#bf6f50));
  background-image: -webkit-linear-gradient(top, #8f3714, #bf6f50);
  background-image: -o-linear-gradient(top, #8f3714, #bf6f50);
  background-image: linear-gradient(to bottom, #8f3714, #bf6f50);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#8f3714', endColorstr='#bf6f50');
}
.button.button-brown:active {
  background: #8f3714;
}
.button.button-green {
  background: #428739;
  background-image: -moz-linear-gradient(top, #c8dd95, #428739);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#c8dd95), to(#428739));
  background-image: -webkit-linear-gradient(top, #c8dd95, #428739);
  background-image: -o-linear-gradient(top, #c8dd95, #428739);
  background-image: linear-gradient(to bottom, #c8dd95, #428739);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c8dd95', endColorstr='#428739');
}
.button.button-green:hover {
  background: #c8dd95;
  background-image: -moz-linear-gradient(top, #428739, #c8dd95);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#428739), to(#c8dd95));
  background-image: -webkit-linear-gradient(top, #428739, #c8dd95);
  background-image: -o-linear-gradient(top, #428739, #c8dd95);
  background-image: linear-gradient(to bottom, #428739, #c8dd95);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#428739', endColorstr='#c8dd95');
}
.button.button-green:active {
  background: #428739;
}
.button.button-red {
  background: #d82741;
  background-image: -moz-linear-gradient(top, #e84b6e, #d82741);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#e84b6e), to(#d82741));
  background-image: -webkit-linear-gradient(top, #e84b6e, #d82741);
  background-image: -o-linear-gradient(top, #e84b6e, #d82741);
  background-image: linear-gradient(to bottom, #e84b6e, #d82741);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e84b6e', endColorstr='#d82741');
}
.button.button-red:hover {
  background: #e84b6e;
  background-image: -moz-linear-gradient(top, #d82741, #e84b6e);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#d82741), to(#e84b6e));
  background-image: -webkit-linear-gradient(top, #d82741, #e84b6e);
  background-image: -o-linear-gradient(top, #d82741, #e84b6e);
  background-image: linear-gradient(to bottom, #d82741, #e84b6e);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#d82741', endColorstr='#e84b6e');
}
.button.button-red:active {
  background: #d82741;
}
.button.button-purple {
  background: #6f50e7;
  background-image: -moz-linear-gradient(top, #b8a9f3, #6f50e7);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#b8a9f3), to(#6f50e7));
  background-image: -webkit-linear-gradient(top, #b8a9f3, #6f50e7);
  background-image: -o-linear-gradient(top, #b8a9f3, #6f50e7);
  background-image: linear-gradient(to bottom, #b8a9f3, #6f50e7);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b8a9f3', endColorstr='#6f50e7');
}
.button.button-purple:hover {
  background: #b8a9f3;
  background-image: -moz-linear-gradient(top, #6f50e7, #b8a9f3);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6f50e7), to(#b8a9f3));
  background-image: -webkit-linear-gradient(top, #6f50e7, #b8a9f3);
  background-image: -o-linear-gradient(top, #6f50e7, #b8a9f3);
  background-image: linear-gradient(to bottom, #6f50e7, #b8a9f3);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6f50e7', endColorstr='#b8a9f3');
}
.button.button-purple:active {
  background: #6f50e7;
}
.button.button-black {
  background: #141414;
  background-image: -moz-linear-gradient(top, #656565, #141414);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#656565), to(#141414));
  background-image: -webkit-linear-gradient(top, #656565, #141414);
  background-image: -o-linear-gradient(top, #656565, #141414);
  background-image: linear-gradient(to bottom, #656565, #141414);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#656565', endColorstr='#141414');
}
.button.button-black:hover {
  background: #656565;
  background-image: -moz-linear-gradient(top, #141414, #656565);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#141414), to(#656565));
  background-image: -webkit-linear-gradient(top, #141414, #656565);
  background-image: -o-linear-gradient(top, #141414, #656565);
  background-image: linear-gradient(to bottom, #141414, #656565);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#141414', endColorstr='#656565');
}
.button.button-black:active {
  background: #141414;
}
.button.button-orange {
  background: #f09c15;
  background-image: -moz-linear-gradient(top, #f8c939, #f09c15);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f8c939), to(#f09c15));
  background-image: -webkit-linear-gradient(top, #f8c939, #f09c15);
  background-image: -o-linear-gradient(top, #f8c939, #f09c15);
  background-image: linear-gradient(to bottom, #f8c939, #f09c15);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f8c939', endColorstr='#f09c15');
}
.button.button-orange:hover {
  background: #f8c939;
  background-image: -moz-linear-gradient(top, #f09c15, #f8c939);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f09c15), to(#f8c939));
  background-image: -webkit-linear-gradient(top, #f09c15, #f8c939);
  background-image: -o-linear-gradient(top, #f09c15, #f8c939);
  background-image: linear-gradient(to bottom, #f09c15, #f8c939);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f09c15', endColorstr='#f8c939');
}
.button.button-orange:active {
  background: #f09c15;
}
.button.button-silver {
  background: #c5c5c5;
  background-image: -moz-linear-gradient(top, #eaeaea, #c5c5c5);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#eaeaea), to(#c5c5c5));
  background-image: -webkit-linear-gradient(top, #eaeaea, #c5c5c5);
  background-image: -o-linear-gradient(top, #eaeaea, #c5c5c5);
  background-image: linear-gradient(to bottom, #eaeaea, #c5c5c5);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#eaeaea', endColorstr='#c5c5c5');
}
.button.button-silver:hover {
  background: #eaeaea;
  background-image: -moz-linear-gradient(top, #c5c5c5, #eaeaea);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#c5c5c5), to(#eaeaea));
  background-image: -webkit-linear-gradient(top, #c5c5c5, #eaeaea);
  background-image: -o-linear-gradient(top, #c5c5c5, #eaeaea);
  background-image: linear-gradient(to bottom, #c5c5c5, #eaeaea);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c5c5c5', endColorstr='#eaeaea');
}
.button.button-silver:active {
  background: #c5c5c5;
}
/* .panel-heading {
    color: #f5f5f5;
    background-color: #f0ad4e; 
    border-color: #f0ad4e;   
}

.panel-info {
    color: #f5f5f5;
    background-color: #f0ad4e; 
    border-color: #f0ad4e;   
} */

.panel-info>.panel-heading {
    color: #f5f5f5;
    background-color: #d9edf7;
    border-color: #bce8f1;
}

.panel-info>.panel-heading {
    background-image: -webkit-linear-gradient(top,#d9edf7 0,#c4e3f3 100%);
    background-image: -o-linear-gradient(top,#d9edf7 0,#c4e3f3 100%);
    background-image: -webkit-gradient(linear,left top,left bottom,from(#d9edf7),to(#c4e3f3));
    background-image: linear-gradient(to bottom,#f0ad4e 0,#f0ad4e 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd9edf7', endColorstr='#ffc4e3f3', GradientType=0);
    background-repeat: repeat-x;
}

.panel-info {
    border-color: #f0ad4e;
}

.panel-info>.panel-heading {
    color: #f5f5f5;
    background-color: #f0ad4e;
    border-color: #f0ad4e;
}

</style>