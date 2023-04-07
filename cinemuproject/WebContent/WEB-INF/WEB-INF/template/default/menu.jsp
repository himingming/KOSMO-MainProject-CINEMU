<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
<body id="body">
	<div style="position: fixed; button: 1px; right: 35px; bottom: 20px;">
		<a href="#body"><img
			src="${pageContext.request.contextPath}/resources/img/t.png"
			title="위로가기"></a>
	</div>
	<%-- 메뉴바 시작 --%>
	<nav class="index_navbar">
		<ul class="index_navbar_menu_left">
			<li><a href="" id="menu_left_hover">극장</a>
				<ul>
					<li><a
				href="${pageContext.request.contextPath}/about/map">오시는 길</a></li>
					<li><a
				href="${pageContext.request.contextPath}/about/greeting">상영관 소개</a></li>

				</ul></li>

			<li><a href="${pageContext.request.contextPath}/ticket/movResv">예매</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/ticket/movResv">빠른 예매</a></li>
					<li><a href="${pageContext.request.contextPath}/ticket/timetable">상영시간표</a></li>
				</ul></li>
			<li><a
				href="${pageContext.request.contextPath}/movies/movielist">영화</a></li>
			<li><a href="${pageContext.request.contextPath}/snack/snackUplist">스낵</a></li>
			<li><a href="${pageContext.request.contextPath}/vip">멤버십</a></li>
		</ul>


		<div class="index_navbar_logo">
			<a href="${pageContext.request.contextPath}/main">cinemu</a>
		</div>



		<ul class="index_navbar_menu_right">
			<li class="nav-item dropdown">
				<form action="${pageContext.request.contextPath}/search/searchQueryPage" method="post">
					<input id="searchValue" name="searchValue" type="search"
						maxlength="255" placeholder="헤어질 결심">
						<i class="fa-solid fa-magnifying-glass"></i>
				</form>
			</li>
			<c:choose>
				<c:when test="${sessionScope.sessionID == null }">
					<li><a
						href="${pageContext.request.contextPath}/member/loginForm"><i
							class="fa-solid fa-right-to-bracket"></i><br>Login</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/member/mypage"><i
							class="fa-regular fa-address-card"></i><br>MyCinemu</a></li>
					<li><a href="${pageContext.request.contextPath}/member/logout"><i
							class="fa-solid fa-right-from-bracket"></i><br>Logout</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="${pageContext.request.contextPath}/qaboard/qalist"><i
					class="fa-regular fa-comments"></i><br>Q&A</a></li>

		</ul>

		<ul>
		</ul>
	</nav>
	<div id="index_item_bar"></div>
	<%-- 메뉴바 끝 --%>

</main>

<script>
$(function() {
	
	$('.index_navbar_menu_left > li').mouseover(function() {
		var index = $(this).index();

		if (index === 2) {
			$('#index_item_bar').css('display', 'none')
		} else if (index === 3) {
			$('#index_item_bar').css('display', 'none')
		} else if (index === 4) {
			$('#index_item_bar').css('display', 'none')
		} else {
			$('#index_item_bar').css('display', 'block')
		}

	});

	$('.index_navbar_menu_left > li').mouseout(function() {
		$('#index_item_bar').css('display', 'none');
	});
})


	

			
</script>
