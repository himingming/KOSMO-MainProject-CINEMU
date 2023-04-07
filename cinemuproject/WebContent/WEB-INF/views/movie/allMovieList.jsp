<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="container">
	<div class="page-tit">
	<hr>
		<h2><strong>Movie</strong></h2>
<hr>
		<div class="allmovie">
			<div id="boxid" class="tabcontent">
				<div class="chart_cont1">

					<c:forEach var="e" items="${list}" varStatus="status">
						<div class="chart_list">
							<div class="poster">

								<figure class="wrap">
									 <a href="${pageContext.request.contextPath}/movies/moviedetail?no=${e.mno }"> 
									<img class="mimg"
										src="${pageContext.request.contextPath}/resources/img/semi_movie/${e.mimg}">
									
										<div class="mvinfor">
									<p class="mstory">${e.mstory }</p>
									
								</div>
								</a>
								</figure>


							</div>
							<div class="infor">
								<h3>
							<img src="${pageContext.request.contextPath}/resources/img/newaging/${e.mage}.png">
									<strong>${e.mname}</strong>
								</h3>
								  <div class="score">
                            <strong class="percent"><a>예매율</a><span>${ratio[status.index]}%</span></strong>
                            <strong class="startday"><a>개봉일</a><span>${e.mstartday}</span></strong>
                        </div>
								<p class="infor_btn">
									<a href="${pageContext.request.contextPath}/ticket/movResv">예매하기</a>
								</p>
								

							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<div>
	</div>
	</div>
</body>

<script>
let text = ${e.mname}
max_len = 10
if len(text) > max_len:
    text = text[:max_len] + "..."
</script>
