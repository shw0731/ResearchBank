<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
<h1>마이페이지</h1>
<hr />
  <div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${member_nickname}님의 프로필 정보</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>아이디:</td>
                        <td>${member_id}</td>
                      </tr>
                      <tr>
                        <td>닉네임:</td>
                        <td>${member_nickname}</td>
                      </tr> 
                      <tr>
                        <td>포인트:</td>
                        <td>${member_point}</td>
                      </tr>                  
                      <tr>
                        <td>성별:</td>
                        <td>${member_gender}</td>
                      </tr>
                      <tr>
                        <td>생년월일:</td>
                        <td>${member_birth}</td>
                      </tr>
                      <tr>
                        <td>주소:</td>
                        <td>${member_address}</td>
                      </tr>
                      <tr>
                        <td>결혼 여부:</td>
                        <td>${member_marry}</td>
                      </tr>
                      <tr>
                        <td>지역:</td>
                        <td>${member_area}</td>
                      </tr>      
                       <tr>
                        <td>직업:</td>
                        <td>${member_job}</td>
                      </tr> 
                    </tbody>
                  </table>
                  
                 <!--   <a href="#" class="btn btn-primary">My Sales Performance</a>
                  <a href="#" class="btn btn-primary">Team Sales Performance</a>-->
                  
                </div>
              </div>
            </div>
                 <div class="panel-footer">  
				<a href="updateMember" class="btn btnC_03 btnF_02 mr10">
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