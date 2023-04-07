<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<div class="container">
		<div class="row">
		<div class="greeting" id="greetingid">
				<h2>
					<em>About cinemu</em>
				</h2>
				<figure class="greeting_left">
					<img
						src="${pageContext.request.contextPath}/resources/img/theater_img.jpg"
						srcset="${pageContext.request.contextPath}/resources/img/theater_img.jpg"
						alt="Seats">
					<p>
						Sound <a>｜ Dolby Surround 7.1 / Dolby Atmos</a>
					</p>
					<br>
					<p>편안하고 쾌적한 프리미엄급 좌석</p>
				</figure>

				<figure class="greeting_right">
					<img
						src="${pageContext.request.contextPath}/resources/img/theater_img2.jpg"
						srcset="${pageContext.request.contextPath}/resources/img/theater_img2.jpg"
						alt="Seats">
					<p>
						Seats <a>｜ HS-SMART SEATS</a>
					</p>
					<br>
					<p>온전히 영화에 몰입되는 입체적인 사운드</p>
				</figure>
			</div>
</div>
</div>
</body>
