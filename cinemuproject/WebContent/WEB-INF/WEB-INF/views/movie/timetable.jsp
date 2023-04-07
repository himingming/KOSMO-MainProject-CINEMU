<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"
	value="${pageContext.request.contextPath}/resources/img" />

<body>

	<div class="container">
		<div class="timetable-wrap">
			<div class="whole-timetable ">
				<div class="page-tit">
					<hr>
					<h2>Cinemu Schedule</h2>
					<hr>
				</div>
				<!-- 극장-->


				<div class="mplist">
					<h5 class="theater-ul"><i class="fa-sharp fa-solid fa-projector"></i>
						극장별
					</h5>
					<button class="tplace-btn">
						<div>
							<c:forEach var="e" items="${splist}">
								<div class="theater-li">${e.theater_name}점</div>
							</c:forEach>
						</div>
					</button>
				</div>


				<div class="timetable-schedule">

					<!-- 가로달력-->

					<div class="date-list">

						<div class="year-area" style="margin-left: 20px;">
							<p class="year">${dayWeekList[1].year}.</p>
							<p id="monthval">${dayWeekList[1].month}</p>
						</div>

						<div class="date-area" id="formDeList">
						<hr>
							<div class="time-wrap">
								<c:forEach var="dto" items="${dayWeekList}">

									<c:if test="${status.index == 1}">
										<button class="on" type="button" id="day_${dto.day }"
											date-data="${dto.year }.${dto.month }.${dto.day }"
											onclick="dateClk(${dto.year },${dto.month },${dto.day });">
									</c:if>

									<button class="dayclick-btn" type="hidden">
										<em>${dto.day}</em> <span class="dayval"></span>일
										<div>
											<span class="day-kr"display:inline-block;">${dto.dayOfweek}요일</span>
										</div>
									</button>

								</c:forEach>
								<%--작은 미니 달력 --%>
								<input type="date" id="datevalue">
							</div>
							<hr>
						</div>
						<%-- 달력 끝 --%>

					</div>

				</div>



				<!-- xx점 상영시간 -->

				<div id="mCSB_1_container" class="mCSB_container" dir="ltr" style="">
					<span></span>
					<ul>

					</ul>
				</div>

			</div>
		</div>

	</div>
</body>

<script>
$('.theater-li').click(function() {
	$('.theater-li').removeClass('theater-li-on');
	$(this).addClass('theater-li-on');
});


let theater_name = null; // 클릭했던 지점명 값을 저장

//*****클릭 시 지점(ex_강남점) 출력 시작******
$('.tplace-btn').children('div').children('div').click(function() {
    theater_name = $(this).text().replace("점", "");
   if (theater_name === null) { 
      theater_name = $(this).text().replace("점", "");
   } else { // 클릭했던 지점명 값 유지
      theater_name = theater_name.replace("점", "");
   }
   console.log("theater_name==>"+theater_name);
   $('#mCSB_1_container').children('span').html(theater_name+"점");
});
//*****클릭 시 지점(ex_강남점) 출력 끝******


//*****************페이지 진입 시 실행되는 ajax 시작***********************
$.ajax({
    url : "${pageContext.request.contextPath}/moviebooking/moviedaya",

    error : function(e) {
        console.log("에이잭스 error");
     },
     success :  function(json) {
         let str = '';     
        $.each(json, function(k, v) {//k:배열의 인덱스
           console.log(v.mage+v.mname);
           str += "<hr><li id='listline'><img id='imgsize' src=${pageContext.request.contextPath}/resources/img/newaging/"+v.mage+".png>"+v.mname+"</li>";
           
           
           $.each(v.screenlist, function(k, v) {
              console.log(v.start_time+v.end_time);
              str +="<li id='mstarttime'>"+v.start_time+" ~ "+v.end_time+"</li>";
           });
        });
        $("#mCSB_1_container").children('ul').html(str);
     } 
   });
//*****************페이지 진입 시 실행되는 ajax 끝***********************

   
//*****************날짜 클릭 시 실행되는 ajax 시작***********************   
    $('.dayclick-btn').click(function() {
    	$('.dayclick-btn').children('div').children('span').removeClass('dayclick-btn-on');	
    
    	   if (theater_name === null) { 
               alert("지점을 먼저 선택해주세요.");
            }   
    
         let day = $(this).children('em').text().padStart(2, '0');
         let year = $('.year').text();
         let month = $('#monthval').text().trim();
         let getDt = year+"-"+month+"-"+day;
         $(this).children('div').children('span').addClass('dayclick-btn-on');
         
         console.log("theater_name 영역 밖=>"+theater_name);
         console.log("getDt =>"+getDt);
         console.log('day=>'+day);
         console.log(year+"-"+month+"-"+day);
         console.log(typeof(getDt));
         console.log(typeof(theater_name));
         
         
       //********달력 클릭 시 날짜를 받아서 출력 되는 영화 리스트 시작********
         $.ajax({//url에 꼭 테스트해보기
          url : "${pageContext.request.contextPath}/moviebooking/moviedaya?menddaya="+getDt+"&theater_name="+theater_name,

          error : function(e) {
              console.log("에이잭스 error");
           },
           success :  function(json) {
               let str = '';     
              $.each(json, function(k, v) {
                 console.log(v.mage+v.mname);
                 console.log('getDt=>'+getDt);
                 str += "<hr><li id='listline'><img id='imgsize' src=${pageContext.request.contextPath}/resources/img/newaging/"+v.mage+".png>"+v.mname+"</li>";
                 
                 
                 $.each(v.screenlist, function(k, v) {
                    console.log(v.start_time+v.end_time);
                    str +="<li id='mstarttime'>"+v.start_time+" ~ "+v.end_time+"</li>";
                 });
              });
              $("#mCSB_1_container").children('ul').html(str);
              if(json === null){
                 $("#mCSB_1_container").children('ul').html("<li>예매 가능한 영화가 없습니다.</li>");
                 console.log("if null 확인");   
              }
              }
         });
      });
   //*****************날짜 클릭 시 실행되는 ajax 끝***********************

   //작은 달력
    console.log("mumu");
    //미니 달력에 변화가 생겼을 경우 실행되는 함수
    $('#datevalue').change(function() {
       
          // 미니 달력으로 부터 받는 값 시작 (미니 달력에서 날짜부분의 값만 가져온다.)
          let testval = $(this).val();
          let changeval = testval.substr(-2);
          if(changeval[0] == '0') {
             changeval = changeval.substr(-1);
           }
          console.log('changeval=>'+changeval);
          // 미니 달력으로부터 받는 값 끝
          
          //가로 달력 영향미치는 부분 시작
          let testem = $('button.dayclick-btn').children('em').filter(function() {
             return $(this).text() == changeval;
          }); //클릭한 em 선택
          
          //css 색상 초기화 시작
          $('button.dayclick-btn').children('em').css("background-color","transparent"); // em css 적용 초기화.
          $('button.dayclick-btn').css("background-color","transparent"); // 선택한 버튼 영역 css 초기화
           //css 색상 초기화 끝
          
       
           
           $('button.dayclick-btn').children('em').filter(function() {
           return $(this).text() == changeval; 
           }).trigger('click'); //클릭 => 미니 달력 클릭 시 가로 달력 클릭한 효과를 주기 위해서
           $('button.dayclick-btn').children('em').filter(function() {
                return $(this).text() == changeval; 
                }).css("background-color","white"); //em에만 색깔 적용(날짜에만)
          testem.parent().css("background-color","white"); //전체에 색깔 적용
        //가로 달력 영향미치는 부분 끝     
       });


   </script>
