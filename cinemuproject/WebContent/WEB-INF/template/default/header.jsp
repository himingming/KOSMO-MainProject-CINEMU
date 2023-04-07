<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

</head>



	<%-- ***********************************여기부터 header**************************************** --%>
	<%-- 캐러셀 영역 시작 --%>
	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="${pageContext.request.contextPath}/resources/img/semi_movie/10.falling_main.jpg"
					class="d-block w-100" alt="폴링스노우중에서">
				<div class="carousel-caption d-none d-md-block">
					<p>
						<폴링스노우> 중에서 
					</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/resources/img/semi_movie/19.eternal_main.jpg"
					class="d-block w-100" alt="이터널선샤인중에서">

				<div class="carousel-caption d-none d-md-block">
					<p>
						<이터널선샤인> 중에서 
					</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/resources/img/semi_movie/22.syk_main.jpg"
					class="d-block w-100" alt="해시태그 시그네중에서">
				<div class="carousel-caption d-none d-md-block">
					<p>
						<해시태그 시그네> 중에서 
					</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<%-- 캐러셀 영역 끝 --%>
	
	
	<%-- ***********************************여기까지 header**************************************** --%>