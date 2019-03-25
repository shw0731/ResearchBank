<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">

<body id="page-top">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <section class="p-0" id="portfolio">
    <div class="container-fluid p-0">
      <div class="row no-gutters popup-gallery">
      
        <div class="col-6">
         <c:choose>
         <c:when test="${MEMBER_NICKNAME != null }">
          <a class="portfolio-box" href="research/create?member_id=${MEMBER_ID}">
            <img class="img-fluid" src=<c:url value='resources/images/portfolio/thumbnails/main_making.jpg'/> alt="">
            <div class="portfolio-box-text">Make Research</div>
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Make Survey
                </div>
                <div class="project-name">
                  내 설문지 만들기
                </div>
              </div>
            </div>
          </a>
          </c:when>
          <c:otherwise>
          <a class="portfolio-box" href="login.do">
            <img class="img-fluid" src=<c:url value='resources/images/portfolio/thumbnails/main_making.jpg'/> alt="">
            <div class="portfolio-box-text">Make Research</div>
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Make Survey
                </div>
                <div class="project-name">
                  내 설문지 만들기
                </div>
              </div>
            </div>
          </a>
          
          
          </c:otherwise>
          </c:choose>
        </div>
        
        <div class="col-6">
          <a class="portfolio-box" href="/research/index">
            <img class="img-fluid" src=<c:url value='/resources/images/portfolio/thumbnails/main_surveying.jpg'/> alt="">
            <div class="portfolio-box-text">Earn Point</div>
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Participate
                </div>
                <div class="project-name">
                 	설문 참여하기
                </div>
              </div>
            </div>
          </a>
        </div>
        
       
        
      </div>
    </div>
  </section>



<!-- 




  <header class="masthead text-center text-white d-flex">
    <div class="container my-auto">
      <div class="row">
        <div class="col-lg-10 mx-auto">
          <h1 class="text-uppercase">
            <strong>Share Your IDEA</strong>
          </h1>
          <hr>
        </div>
        <div class="col-lg-8 mx-auto">
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="/research.do">Start Research</a>
        </div>
      </div>
    </div>
  </header>

  <section class="bg-primary" id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <h2 class="section-heading text-white">We've got what you need!</h2>
          <hr class="light my-4">
          <p class="text-faded mb-4">Take any survey or anything you want it in our Research Bank! we can help your creative thinks, huge idea, dynamic entertainment! Let's get it your IDEA in our ResearchBank!</p>
          <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">Get Started!</a>
        </div>
      </div>
    </div>
  </section>

  <section id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading">At Your Service</h2>
          <hr class="my-4">
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-6 text-center">
          <div class="service-box mt-5 mx-auto">
            <i class="fas fa-4x fa-gem text-primary mb-3 sr-icon-1"></i>
            <h3 class="mb-3">Sturdy Templates</h3>
            <p class="text-muted mb-0">Our templates are updated regularly so they don't break.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="service-box mt-5 mx-auto">
            <i class="fas fa-4x fa-paper-plane text-primary mb-3 sr-icon-2"></i>
            <h3 class="mb-3">Ready to Ship</h3>
            <p class="text-muted mb-0">You can use this theme as is, or you can make changes!</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="service-box mt-5 mx-auto">
            <i class="fas fa-4x fa-code text-primary mb-3 sr-icon-3"></i>
            <h3 class="mb-3">Up to Date</h3>
            <p class="text-muted mb-0">We update dependencies to keep things fresh.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="service-box mt-5 mx-auto">
            <i class="fas fa-4x fa-heart text-primary mb-3 sr-icon-4"></i>
            <h3 class="mb-3">Made with Love</h3>
            <p class="text-muted mb-0">You have to make your websites with love these days!</p>
          </div>
        </div>
      </div>
    </div>
  </section>


  <section class="bg-dark text-white">
    <div class="container text-center">
      <h2 class="mb-4">Free Research at Our Research Bank!</h2>
      <a class="btn btn-light btn-xl sr-button" href="http://startbootstrap.com/template-overviews/creative/">Research Now!</a>
    </div>
  </section> -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>

