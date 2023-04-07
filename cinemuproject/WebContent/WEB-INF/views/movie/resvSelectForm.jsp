<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"
   value="${pageContext.request.contextPath}/resources/img" />

<body>
<div class="inner-wrap" >
  <div class="quick-reserve" >
     <div class="tit-util">
               <h2 class="tit">빠른 예매</h2>
            </div>
    <div class="quick-reserve-biginner">
      <div class="time-schedule">
                        <div class="wrap">
                        <!--    <button type="button" title="이전 날짜 보기" class="btn-pre"
                              disabled="true">
                              <i class="iconset ico-cld-pre"></i> <em>이전</em>
                           </button>
                           -->
                           <div class="date-list">
                              <div class="year-area">
                                 <div class="year" style="display: none;  left: 30px; z-index: 1; opacity: 1;">${dayWeekList[1].year}</div>
                                 <span id="monthval" style="display: none;">${dayWeekList[1].month} </span>
                              </div>
                               
                              <div class="date-area" id="formDeList">
                                 <div class="wrap"
                                    style=" border: none;">
                                    <c:forEach var="dto" items="${dayWeekList}">
                                       
                                       <c:if test="${status.index == 1}">
                                       <button class="on" type="button" id="day_${dto.day }"
                                          date-data="${dto.year }.${dto.month }.${dto.day }"
                                          onclick="dateClk(${dto.year },${dto.month },${dto.day });">
                                       </c:if>
                                    <!--    
                                       <c:if test="${status.index != 1}">
                                       <button class="" type="button" id="day_${dto.day }"
                                          date-data="${dto.year }.${dto.month }.${dto.day }"
                                          onclick="dateClk(${dto.year },${dto.month },${dto.day });">
                                       </c:if>
                                        -->
                                           <button class="dayclick-btn" type="hidden" >
                                          <em style="pointer-events: none;">${dto.day}</em> <span
                                          style="pointer-events: none;" class="dayval"></span>일<span class="day-kr"
                                          style="pointer-events: none; display: inline-block;">${dto.dayOfweek}요일</span>
                                    </button>
                                  </button>
                                    </c:forEach>
                                 </div>
                              </div>
                               
                           </div>

                           <!-- 다음날짜 
                           <button type="button" title="다음 날짜 보기" class="btn-next"
                              disabled="true">
                              <i class="iconset ico-cld-next"></i> <em>다음</em>
                           </button> -->
                           <!--// 다음날짜 -->

                           <!-- 달력보기 
                           <div class="bg-line">
                              <input type="hidden" id="datePicker" value="2022.04.11"
                                 class="hasDatepicker">
                              <button type="button" id="calendar"
                                 onclick="$(&#39;#datePicker&#39;).datepicker(&#39;show&#39;)"
                                 class="btn-calendar-large" title="달력보기">달력보기</button>

                           </div>
                           -->
                           <!--// 달력보기 -->
                           
                        </div>
                  
      </div>
     
      <div class="quick-reserve-area">
      <!-- 영화 리스트 시작 -->
       <div class="movie-choice">
                           <p class="tit">영화</p>
                           <div class="list-area">
                              <div class="all-list">
                                 <div class="list">
                                    <div class="scroll m-scroll mCustomScrollbar _mCS_1"
                                       id="movieList" style="overflow-y: scroll;  height: 280px;">
                                       <div id="mCSB_1"
                                          class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
                                          style="max-height: none;" tabindex="0">
                                          <div id="mCSB_1_container" class="mCSB_container"
                                             style="position: relative; top: 0; left: 0;" dir="ltr">
                                             <ul>
                                                <!-- 에이젝스로 영화리스트 데이터 받을 공간 -->
                                             </ul>
                                          </div>

                                       </div>
                                    </div>
                                 </div>
                              </div>

                           </div>
                           <!--// list-area -->

                           <!-- view-area -->
                           <div class="view-area">
                              <!-- 영화 선택 하지 않았을 때 -->
                              <div class="choice-all" id="choiceMovieNone">
                                 <strong>모든영화</strong> <span>목록에서 영화를 선택하세요.</span>
                              </div>
                              <div class="choice-list" id="mimngres">
                                   <div class="bg" id="movieChoice"></div>
                              </div>
                           </div>
                           </div>
                        
                        <!-- 영화 리스트 끝 -->
                        <!-- 극장 리스트 시작 -->
                              <div class="theater-choice">
                           <div class="tit-area">
                              <p class="tit">극장</p>
                           </div>
                           <div class="list-area" id="brchTab">
                              <div class="all-list">
                                 <div class="list">
                                    <div class="scroll" id="brchList">
                                       <ul class="brchList-ul">   
                                             <li>
                                            <div class="button-container">
                                                <button class="place-btn" value="가산">가산점</button>
                                                <button class="place-btn" value="용산">용산점</button>
                                                <button class="place-btn" value="잠실">잠실점</button>
                                                 </div>
                                                            <ul class="region-ul">
                                                               <li id="regionDetailPos">
                                                               <div class="button-region">
                                                               
                                                               </div>
                                                               </li>
                                                            
                                                            </ul>
                                          
                                             </li>
                                             
                                          
                                       </ul>
                                    </div>
                                 </div>
                              </div>

                           </div>
                           <!--// list-area -->

                           <!-- view-area -->
                           <div class="view-area">

                              <!-- 영화관 선택 하지 않았을 때 -->
                              <div class="choice-all" id="choiceBrchNone">
                              <strong>전체극장</strong>
                                 <span>목록에서 극장을 선택하세요.</span>
                              </div>

                              <!-- 영화관을 한개라도 선택 했을때 -->
                              <div class="choice-list" id="res">
                                 <div class="bgbg" id="thChoice"></div>
                                
                              </div>
                           </div>
                        </div>
                        <!-- 극장 리스트 끝-->
        <div class="time-choice">
          <p class="tit">시간</p>
            <div class="time-list"></div>
          
           <!-- seatcontroller에 해당 메서드가 있다!! -->
        <form action="${pageContext.request.contextPath}/seat/seatclick" method="post" id="form-seat" accept-charset="UTF-8" > 
        <input type="hidden" name="mname" value="" />
        <input type="hidden" name="mage" value="" />
        <input type="hidden" name="mimg" value="" />
        <input type="hidden" name="theater_no" value="" /> 
        <input type="hidden" name="theater_name" value="" />  
        <input type="hidden" name="theater_id" value="" />  
        <input type="hidden" name="year" value="" />
        <input type="hidden" name="month" value="" />
        <input type="hidden" name="day" value="" />
        <input type="hidden" name="mno" value="" /> 
        <input type="hidden" name="start_time" value="" /> 
        <input type="hidden" name="end_time" value="" /> 
        <input type="hidden" name="dayOfweek" value="" />
        <input type="hidden" name="screening_id" value="" />  
        </form>
        </div>
      </div>
    </div>
    <!-- 팝업창 -->
   <div id="document-modal">
        <div class="document-modal">
            <div class="document-modal-header">
                <h5 class="tit">알림</h5>
            </div>
            <div class="document-modal-body">
                <p class="dot-list"></p>
                <button type="button" class="btn-document-modal">확인</button>
            </div>
        </div>
     </div>
     <!-- 팝업창 -->
  </div>
   
  </div>
        
</body>
<script>
//작은 달력
console.log("메인 화면");
//미니 달력에 변화가 생겼을 경우 실행되는 함수
$('#datevalue').change(function() {
   
      // 미니 달력으로 부터 받는 값 시작 (미니 달력에서 날짜부분의 값만 가져온다.)
      let testval = $(this).val();
      let changeval = testval.substr(-2)
      console.log('changeval=>'+changeval);
      // 미니 달력으로부터 받는 값 끝
      
      //가로 달력 영향미치는 부분 시작
      let testem = $('button.dayclick-btn').children('em:contains('+changeval+')'); //클릭한 em 선택
      
      //css 색상 초기화 시작
      $('button.dayclick-btn').children('em').css("background-color","transparent"); // em css 적용 초기화.
      $('button.dayclick-btn').css("background-color","transparent"); // 선택한 버튼 영역 css 초기화
       //css 색상 초기화 끝
      
      $('button.dayclick-btn').children('em:contains('+changeval+')').trigger("click"); //클릭 => 미니 달력 클릭 시 가로 달력 클릭한 효과를 주기 위해서
      $('button.dayclick-btn').children('em:contains('+changeval+')').css("background-color","red"); //em에만 색깔 적용(날짜에만)
      testem.parent().css("background-color","orange"); //전체에 색깔 적용
    //가로 달력 영향미치는 부분 끝
    
   });
//*********************************************
//페이지 진입 시 바로 실행되는 ajax

$.ajax({//url에 꼭 테스트해보기
 url : "${pageContext.request.contextPath}/moviebooking/movieday",

 error : function(e) {
     console.log("error");
  },
  success :  function(json) {
   let str = '';
   for(const e in json){
      str += '<li><input type="hidden" name="mno" id="movieMno" value="'+json[e]['mno']+'"><span style="display: none;">'+json[e]['mage']+'</span><button class="movie-btn"><span class="yimg"><img style="width:20px; height:20px; margin-right: 5px;" src=${pageContext.request.contextPath}/resources/img/newaging/'+json[e]['mage']+'.png ></span>'+json[e]['mname']+'</button><span style="display: none; class="imgclass">'+json[e]['mimg']+'</span></li>';  
   }
   $("#mCSB_1_container").children('ul').html(str);
   
   $('button.movie-btn').click(function() {
      let imgname = $(this).next('span').text(); //이미지 이름
      console.log("imgname"+imgname);
      let age = $(this).prev().text();
       let moviename = $(this).text(); // 무비 네임
       let pmimg = '<img id="imgid" style="width: 75px;"src=${pageContext.request.contextPath}/resources/img/semi_movie/'+imgname+'>';
       let htmlTag = "<span>" + moviename + "</span>";
       let mno = $(this).parent().find('[name="mno"]').val(); // 영화 번호
 
       // 데이터를 `movieChoice` 요소에 추가
       $('#movieChoice').html(pmimg + htmlTag );
       
       // `choiceMovieNone` 요소를 숨김
       $('#choiceMovieNone').hide();
  
       // 이미 선택된 상태인 경우 클릭시 선택 해제
       $('#movieChoice').on('click', function() {
         $(this).html('');
         $('input[name=mname]').attr('value', '');
         $('input[name=mage]').attr('value', '');
         $('input[name=mimg]').attr('value', '');
         $('input[name=mno]').attr('value', '');

         // 선택 안된 상태인 경우 보이기
         $('#choiceMovieNone').show();
       });
       // 영화 번호(mno) 값을 저장
       $('#movieMno').val(mno);
   })
   
   } 
});

//페이지 진입 시 바로 실행되는 ajax 끝
//*****************************************************


//*********************************************
// 날짜 클릭 시 실행되는 ajax
//버튼 함수
$(function() {  
   
     $('.dayclick-btn').on('click', function() {
        let isSelected = $(this).hasClass('selected'); // 해당 버튼이 선택되었는지 체크
        $('.dayclick-btn').removeClass('selected'); // 모든 버튼에서 선택 클래스 제거
      $(this).css('background-color', 'white');
       if (!isSelected) { // 해당 버튼이 선택되지 않았으면
      console.log('dayclick-btn');          
       
      let month = $('#monthval').text();
     // let day = $(this).children('em').text();
    let day = $(this).children('em').text().padStart(2, '0');
      let year = $('.year').text();
      let getDt = year+month+day;
      console.log('getDt'+getDt);
      console.log(typeof(getDt));
      let dayOfweek = $(this).find('.day-kr').text();
      console.log('dayOfWeek: '+ dayOfweek);
      $(this).addClass('selected'); // 해당 버튼에 선택 클래스 추가
      $(this).css('background-color', 'pink');
//ajax 시작
 $.ajax({//url에 꼭 테스트해보기
    
  url : "${pageContext.request.contextPath}/moviebooking/movieday?mendday="+getDt,
  error : function(e) {
      console.log("error");
   },
   success :  function(json) {
      
   $('#datevalue').val(year+'-'+month+'-'+day);
    let str = '';
   for(const e in json){
      str += '<li><input type="hidden" name="mno" id="movieMno" value="'+json[e]['mno']+'"><span style="display: none;">'+json[e]['mage']+'</span><button class="movie-btn"><span class="yimg"><img style="width:20px; height:20px; margin-right: 5px;" src=${pageContext.request.contextPath}/resources/img/newaging/'+json[e]['mage']+'.png ></span>'+json[e]['mname']+'</button><span style="display: none; class="imgclass">'+json[e]['mimg']+'</span></li>';  
   }
    $("#mCSB_1_container").children('ul').html(str);
    
    $('button.movie-btn').click(function() {
        // 영화 정보를 저장할 변수
        let imgname = $(this).next('span').text(); //이미지 이름
        console.log("imgname"+imgname);
        let age = $(this).prev().text();
        let moviename = $(this).text(); // 무비 네임
        console.log(moviename);
        let pmimg = '<img id="imgid" style="width: 75px;" src=${pageContext.request.contextPath}/resources/img/semi_movie/'+imgname+'>';
        let mno = $(this).siblings('[name="mno"]').val(); // 영화 번호
        console.log("mno =>"+mno);
        // 클릭한 영화 이미지 코드 변수에 넣는 부분 - 1  
        let htmlTag = "<span>" + moviename + "</span>";
 
        // 데이터를 `movieChoice` 요소에 추가
        $('#movieChoice').html(pmimg + htmlTag);
        
        // `choiceMovieNone` 요소를 숨김
        $('#choiceMovieNone').hide();
        
     // 이미 선택된 상태인 경우 클릭시 선택 해제
        $('#movieChoice').on('click', function() {
          $('input[name=mname]').val(''); // 영화 이름 초기화
          $('input[name=mage]').val(''); // 영화 연령 초기화
          $('input[name=mimg]').val(''); // 영화 포스터 초기화
          $('input[name=mno]').val(''); // 영화 번호 초기화
          $(this).html(''); // 영화 포스터 제거
          // 선택 안된 상태인 경우 보이기
          $('#choiceMovieNone').show();
        });
        // 영화 번호(mno) 값을 저장
        $('#movieMno').val(mno);
       console.log("Mnononono"+mno);
   
   //*********************************************

//*******************************function 시작********************************************
//가만히두기
 
  // let htmlTag = "<br>";
  
  // let testcount = $('#testid').children('div').length;
  // console.log('testcount=>>>'+testcount);
   
   $('button.place-btn').click(function() {
      console.log('place-btn 클릭');
      let place = $(this).val();
      console.log("place=>" + place);
      console.log(moviename);
   
      $.ajax({
        url: "${pageContext.request.contextPath}/theaterBooking/theaterNo",
        type: 'POST',
        data: { theater_name: place },
        success: function(data) {
          var options = '';
          if (data != null && data.length > 0) {
            for (var i = 0; i < data.length; i++) {
              options += '<button class="theaterNoBtn" value="' + data[i].theater_id + '">' + data[i].theater_no + '관</button>';
            }
            $('.button-region').html(options);
            console.log("제발 좀 =>"+options);
           
            
         // 영화관 선택창 보이기
            $('#choiceBrchNone').hide();
          
            $('#thChoice').html('<p>' + place + '</p>'); // place를 포함한 HTML 코드 설정

          } else {
            console.log("theaterNum is null or empty.");
          }
       
       
          $('.theaterNoBtn').click(function() {
             let theater_id = $(this).val();
             console.log("theater_id =>" + theater_id);
             let mno = $('#movieMno').val(); // 영화 번호를 변수에 저장
             console.log("mno =>"+mno);
             let str = $(this).text();
             let theater_no = parseInt(str);  // "1관"에서 "1"만 추출하여 저장합니다.
             console.log(theater_no);  // "1"이 출력됩니다.
             console.log(moviename);


             let $timeList = $('.time-choice .time-list');
             if ($timeList.is(':visible') && $timeList.data('theater_no') === theater_no) {
                 // 이미 일정표가 보여지고 있는 경우, 숨깁니다.
                 $timeList.hide();
             } else {
                 // 일정표가 보여지지 않는 경우, ajax 요청을 보내어 일정표를 가져옵니다.
                 $.ajax({
                     url: "${pageContext.request.contextPath}/theaterBooking/screening-times",
                     type: 'GET',
                     dataType: 'json',
                     data: { theater_id: theater_id, mno:mno },
                     success: function(data) {
                          console.log("screeningTimes=>" + JSON.stringify(data));
                          $timeList.empty();
                          $.each(data, function(index, value) {
                             let screening_id = value.screening_id;
                             console.log("screening_id"+screening_id);
                             
                             // 예약 가능한 좌석 정보 가져오기
                             $.ajax({
                                url:"${pageContext.request.contextPath}/theaterBooking/seatInfo",
                                type: "POST",
                                 data: { theater_id: theater_id, screening_id: screening_id},
                                 success: function(seatData) {
                                    console.log("seatData=>" + seatData);
                                    
                              // 좌석 정보 표시하기
                               let btn = $('<button>').addClass('time-btn').html('<span class="start-time">' + value.start_time + '</span><span class="divider">~</span><span class="end-time">' + value.end_time + '</span><span class="movie-name">' + moviename + '</span><span class="seat-info">' + seatData.remaining_seats + '/' + seatData.total_seats + '</span>');
                               $timeList.append(btn);
                               
                               
                               // 좌석으로 데이터 넘기기 위해서 정보저장하기
                               $('div.time-list').on('click','button.time-btn',function(e){
                                  let start_time = $(this).find('.start-time').text();
                                   let end_time = $(this).find('.end-time').text();
                                  
                                  $('input[name=year]').attr('value',year);
                                   $('input[name=month]').attr('value',month);
                                   $('input[name=day]').attr('value',day);
                                   $('input[name=mname]').attr('value', moviename); // 영화 이름 데이터 보내기
                                   $('input[name=mage]').attr('value', age); // 영화 연령 데이터
                                    $('input[name=mimg]').attr('value', imgname); // 영화 포스터 데이터
                                    $('input[name=mno]').attr('value', mno); // 영화 번호 데이터 보내기
                                    $('input[name=theater_name]').attr('value', place);
                                   $('input[name=theater_id]').attr('value', theater_id);
                                   $('input[name=theater_no]').attr('value',theater_no);
                                   $('input[name="start_time"]').val(start_time);
                                   $('input[name="end_time"]').val(end_time);
                                   $('input[name="dayOfweek"]').val(dayOfweek);
                                $('input[name="screening_id"]').val(screening_id);
                                   $('#form-seat').submit();
                               })
                               // 좌석으로 데이터 넘기기 위해서 정보저장하기 끝
                             },
                               error: function() {
                                    console.log('Error loading seat info');
                               }
                           });
                       });
                       

                          $timeList.data('theater_no', theater_no).show();

                          $timeList.on('click', '.time-btn', function() {
                              $(this).addClass('active').siblings().removeClass('active');
                          });    
               
               
      }, // success
      error: function() {
          console.log('Error loading screening times');
      }
      }); // theaterNoBtn ajax
       } // else
      }); //theaterNoBtn 
   
        }, // place success
        error: function(xhr, textStatus, errorThrown) {
             console.error('서버 요청에 실패했습니다:2', textStatus, errorThrown);
           }
         }); // place-btn ajax
       }); // place-btn function

    }); // moive-btn
    
   } // dayclick-btn ajax success
 }); // dayclick-btn ajax
     } // dayclick-btn ajax
 }); // dayclick-btn function

   
    // 팝업창 확인 누르면 사라지게 만들기
   $('.btn-document-modal').click(function(){
       $('#document-modal').css('display','none');
      })
}); // 전체 function

     
     
</script>

