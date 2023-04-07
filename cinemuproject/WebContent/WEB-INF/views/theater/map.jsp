<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<div style="height:100px;">
</div>
<div class="container">
<div class="map">
				<h2>
					<div id="mapid"></div>
					<em>Contact us</em>
					<h3>가산점</h3>
				</h2>
				<figure class="map_left">
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


				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76d9747761892c06621ff7e0fc700272&libraries=services"></script>

			</div>
</div>
<div style="height:100px;">
</div>

</body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.477001, 126.879982), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = 'https://ifh.cc/g/Y11tB4.jpg', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(10, 10)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.477001, 126.879982); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
</script>

