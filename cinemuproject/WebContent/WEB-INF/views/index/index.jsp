<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content영역 -->


<section id="movie">
	<div class="container">
<!-- 
<aside>
<div id="moviewheather"></div>
</aside>
	 -->
		<div class="row">
			<div class="movie">

				<div class="movie_title">
					<ul class="clearfix">
						<%--javascript:void(0); 클릭 시 상단 이동 기능 미작동 --%>
						<li class="active"><a href="javascript:void(0);">BoxOffice</a></li>

					</ul>
				</div>

				<div class="movie_chart">
					<!-- 박스오피스 시작 영화8개 -->
					<div class="swiper-container" id="my-swiper">

						<div class="chart_cont1 swiper-wrapper">
							<!-- 박스오피스 시작 영화8개 -->
							<c:forEach var="e" items="${boxlist}">
								<div class="swiper-slide">
									<div class="poster">
										<figure>
									<a href="${pageContext.request.contextPath}/movies/moviedetail?no=${e.mno}">
										
											<img
												src="${pageContext.request.contextPath}/resources/img/semi_movie/${e.mimg }">
										</a>
										</figure>
									</div>
									<div class="infor">
										<h3>
											<strong>${e.mname }</strong>
										</h3>
										<div class="score">
											<strong class="percent"><a>예매율&nbsp;&nbsp;</a><span>${e.ratio}%</span></strong>
										</div>
										
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<!-- 상영예정작 시작 영화6개 -->

				</div>





			</div>
		</div>
	</div>
</section>
<!-- //movie -->

<!-- //movie -->
<section id="new">
	<div class="container">
		<div class="row">
			<div class="new">
				<h2>
					<em>이 달의 추천영화</em>
				</h2>
				<div class="new_left">
					<div class="play" id="showTrailer" data-youtube="F1239ZePXfM">
						<iframe width="850px;" height="499px;"
							src="https://www.youtube.com/embed/i50tT8n9fp8?autoplay=1&mute=1"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</div>
				</div>
				<div class="new_right">
					<h3 class="title">헤어질 결심</h3>
					<span class="release">2022년 06월 29일 개봉</span>
					<div class="star">

						<span class="icon star0"></span> <strong>8.96/10</strong>
					</div>
					<ul class="summary">
						<li class="genre"><span class="bar">멜로/로맨스</span><span>한국</span></li>
						<li class="age"><span class="bar">138분</span><span>15세
								이상 관람가</span></li>
						<li class="desc">산 정상에서 추락한 한 남자의 변사 사건. 담당 형사 '해준'(박해일)은
							사망자의 아내 '서래'(탕웨이)와 마주하게 된다. "산에 가서 안 오면 걱정했어요, 마침내 죽을까 봐." 남편의 죽음
							앞에서 특별한 동요를 보이지 않는 '서래'. 경찰은 보통의 유가족과는 다른 '서래'를 용의선상에 올린다. '해준'은
							사건 당일의 알리바이 탐문과 신문, 잠복수사를 통해 '서래'를 알아가면서 그녀에 대한 관심이 점점 커져가는 것을
							느낀다. 한편, 좀처럼 속을 짐작하기 어려운 '서래'는 상대가 자신을 의심한다는 것을 알면서도 조금의 망설임도 없이
							'해준'을 대하는데…. 진심을 숨기는 용의자 용의자에게 의심과 관심을 동시에 느끼는 형사 그들의 <헤어질 결심>
						</li>
					</ul>

					<button class="btn">
						<a href=${pageContext.request.contextPath}/movies/movielist
							class="purple">예매하기</a>
					</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- // 개봉예정작 동영상 끝-->
<!-- 상영관소개, 지도 -->
<section id="about_mu">
	<div class="container">
		<div class="row">
			<div class="greeting" id="greetingid">
				<h2>
					<em>상영관 소개</em>
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

			<div class="map">
				<h2>
					<div id="mapid"></div>
					<em>오시는 길</em>
				</h2>
				<figure class="map_left" style="width:">
					<article>
						<h6>지하철 이용시</h6>
						<p>가산디지털단지 5번출구 기준 도보 이용시 약 10분 소요</p>
						<br>
						<h6>버스 이용시</h6>
						<p>
							[지선] 5536, 5616, 5712, 5714<br> [간선] 503, 504, 571, 652
						</p>

						<h6>주차정보</h6>
						<p>건물 내 지하 주차장(지하2F ~ 지하4F) 또는 인근 주차장 이용</p>

						<h6>주차요금</h6>
						<p>cinemu 영화 관람시 주차 3시간 6,000원</p>
					</article>
				</figure>

				<div id="map" style="width: 70%; height: 400px; float: right;"></div>


				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76d9747761892c06621ff7e0fc700272&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.477001, 126.879982), // 지도의 중심좌표
						level : 4
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					var imageSrc = 'https://ifh.cc/g/Y11tB4.jpg', // 마커이미지의 주소입니다    
					imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
					imageOption = {
						offset : new kakao.maps.Point(10, 10)
					}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize, imageOption), markerPosition = new kakao.maps.LatLng(
							37.477001, 126.879982); // 마커가 표시될 위치입니다

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : markerPosition,
						image : markerImage
					// 마커이미지 설정 
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
				</script>

			</div>
		</div>
	</div>
</section>
<!-- // 멤버십 소개, 상영관소개 등 -->






<style>
.swiper-container {
	display: none;
}
</style>
<script>
//aside
  /*
$(document).ready(function(){
  var currentPosition = parseInt($("#moviewheather").css("top"));
  $(window).scroll(function() {
    var position = $(window).scrollTop(); 
    $("#moviewheather").stop().animate({"top":position+currentPosition+"px"});
  });
});
 */
       
// 좋아요 버튼을 클릭하면 실행 되는 ajax
$('#likebtn').click(function() {

   $.ajax({
         url : "../like/addlike?mno=${vo.mno}&lid=${sessionScope.sessionID}",
         success : function(jsondata){
            console.log("=======uid======"+uid);
            console.log(typeof(uid));
            console.log(isNaN(uid));
            const modalc = $('#modal-wrapper').attr('class');
            console.log('modalc===>'+modalc)
            
            /*
            if(isNaN(uid) !== true){
               console.log("======성공======="+uid);
                  $('.modal-wrapper').toggleClass('open');
                   $('.page-wrapper').toggleClass('blur-it');
                    return false;
            }
            */
       
            
            if(jsondata.cnt2===0){
               $('#heart').html('♡');
            }else{
               $('#heart').html('♥');
            }
            $('#likecnt').html(jsondata.likecnt);
            
         }
        
         
   });
}) ;
	$(function() {
		$('.swiper-container').eq(0).css('display', 'block');

		//영화차트 이미지 슬라이드
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 4,
			spaceBetween : 24,
			//            mousewheel: {
			//                invert: true,
			//            },
			keyboard : {
				enabled : true,
				onlyInViewport : false,
			},
			autoplay : {
				delay : 6000,
			},
			breakpoints : {
				600 : {
					slidesPerView : 1.4,
					spaceBetween : 24
				},
				768 : {
					slidesPerView : 2,
					spaceBetween : 24
				},
				960 : {
					slidesPerView : 3,
					spaceBetween : 24
				}
			}
		});
		/*
		const swiper = new Swiper('.swiper-container', {
		    loop: true,
		    pagination: {
		        el: '.swiper-pagination'
		    },
		    navigation: {
		        nextEl: '.swiper-next',
		        prevEl: '.swiper-prev'
		    }
		});
		 */
		$.ajax({
	          type: "GET",
	          url: "http://192.168.0.199:9000/recomend/weatherJP",
	          dataType: "jsonp",
	          success: function(response) {
	              // 성공적으로 응답을 받은 경우 처리할 코드
	              console.log(response.city);  // 예시: 'Seoul'
	              console.log(response.temp);  // 예시: 12.3
	              console.log(response.humidity);  // 예시: 45
	              console.log(response.description);  // 예시: 'clear sky'
	              console.log(response.icon);  // 예시: '01d.png'
	              
	              let tr ="";
	              tr +="<p>오늘의 날씨</p>";
	              tr +="<p>도시: "+response.city+"</p>";
	              tr +="<p>온도: "+response.temp+"</p>";
	              tr +="<p>습도: "+response.humidity+"</p>";
	              tr +="<p><img src=${pageContext.request.contextPath}/resources/img/"+response.icon+"></p>";
	              
	              
	              $('#moviewheather').html(tr);
	              
	          },
	          error: function(xhr, status, error) {
	              // 응답에 실패한 경우 처리할 코드
	              console.log("Error: " + error);
	          }
	      });
	});
</script>
</html>