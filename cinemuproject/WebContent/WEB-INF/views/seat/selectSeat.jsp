<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
/* 빠른 예매 창을 감싸는 큰 틀*/
.inner-wrap{
width: 1250px;
margin: auto;
height: 600px;
}

/* 빠른 예매 타이틀 공간 */ 
.quick-reserve{
  margin-top: 10px;
  height: 500px;
}
.quick-reserve h2{
    margin-left: 0;
    width: 100%;
    border-bottom: 1px solid black; /* 없애면 안됨!*/
    padding-bottom: 10px;
}
/* 빠른 예매 타이틀 공간 끝 */

/* 왼쪽 컨테이너 시작 */
.left-container{
  height: 500px;
  width: 930px;
  
  margin-right: 20px;
  float: left;
}
.seat-section{
  display: inline-block;
  width: 930px;
  height: 400px;
}
.title-small-utill {
 padding: 8px 0 9px 0;
  
}
.title-small-utill > h3{
    text-align: left;
    height: 2px;
  display: inline-block;
   margin-top: 10px;
 
}
/*초기화 버튼*/
.button-reset{ 
    text-align: right;
    float: right;
    width: 70px;
    height: 30px;
    border: 1px solid rgb(197, 196, 196);
    background-color: white;
    text-align: right;
    border-radius:7px;
    font-size: small;
    font-weight: 550;
    color: rgb(12, 9, 22);
    position: sticky;
  margin: 8px 7px 7px 0 ;
}
/* 인원 수 버튼 시작 */
.check-people-box{
   display: inline-block;
   border: 1px solid rgb(197, 196, 196);
  width: 928px;
  
}
.check-people{
  margin-left: 20%
}
.down,.now,.up{
    float: left;
    border: 1px solid rgb(197, 196, 196);
    background-color: white;
    margin-top: 5px;
}
.txt{
    float: left;
    text-align: center;
    font-size: middle;
    margin-right: 20px;
    margin-top: 10px;
    margin-left: 20px;
  font-size: 1.0em;
  line-height: 32px;
}
.down,.up{
    width: 32px;
    height: 30px;
    border-radius: 3px;
    margin-top: 10px;
    position: sticky;
    font-size: 1.3em;
}

.now{
    width: 32px;
    height: 30px;
    margin-top: 10px;
    position: sticky;
}
/* 인원 수 버튼 끝 */

/* 좌석 선택 공간 시작*/
.seat-area{
  height: 500px;
   width: 928px;
 border: 1px solid rgb(180, 179, 179);
}
.seat-wrapper{
    border: 1px solid rgb(180, 179, 179);
    border-top: 1px solid white;
    width: 60%;
    margin-left: 10%;
    height: 300px;
    float:left;
}

.screen-seat{
  border-left: 1px solid rgb(180, 179, 179);
  border-right: 1px solid rgb(180, 179, 179) ;
  width: 70%;
  margin-left: 15%;
  display: block;
}
#tableSeat{
 margin: auto;
  margin-top: 100px ;
} 
.seatalpha{
 border: 1px solid white;
 background-color: white;
   height: 50px;
   width: 40px;
}

.seatBtn{
  border: 1px solid;
  border-radius: 10px;
   height: 50px;
   width: 60px;
   background-color: white;
}
/* 좌석 선택 공간 끝*/
/* 왼쪽 컨테이너 끝 */

/* 영화 정보 페이지 이동 버튼 오른쪽 컨테이너 시작*/
.right-container{
  height: 419px;
  width: 300px;
  float: left;
  border-radius: 6px;
}
.movie-container{
  display: inline-block;  
  width: 300px;
    height: 700px;
    border-radius: 6px;
    background-color:  #263343;
    padding: 8px;
    position: relative;
}
/* 영화 제목, 연령아이콘, 2D 공간 시작 */
.title-area{
    height: 60px;
    border-bottom: 1px solid rgb(180, 179, 179);
    padding: 3px;
}
.img-age{ /* 연령 아이콘*/
    float: left;
    display: inline;
    width: 20px;
    height: 20px;
    margin: 5px;
}
.title{ /* 영화 제목 */
    width: 200px;
    color: white;
    font-size: 15px;
    margin: 5px 0 0 35px;
}
.cate{ /* 2D*/
    color: rgb(180, 179, 179);
    float: left;
    margin: 10px 0 0 5px;
    font-size: 15px;
}
/* 영화 제목, 연령아이콘, 2D 공간 끝 */

/* 상영관, 날짜, 포스터 공간 시작 */
.movie-detail-area{ 
  border-bottom: 1px solid rgb(180, 179, 179);
  position: relative;
  min-height: 121px;
  color: white;
  padding: 0 30px 0 0;
  font-size: 0;
  width: 300px;
   display: flex;
  align-items: center;
  justify-content: space-between;
}
.text-wrapper {
  display: flex;
  flex-direction: column;
}

.img-wrapper {
  width: 80px;
  height: 150px;
}

/* 좌석 영화 포스터 시작 */
.img-card2{
  float: right;
  width: 80px;
  height: 150px;
  position: relative;
}

.movie-detail-area > * {
  display: inline-block;
  vertical-align: top;
  margin: 0 10px;
  font-size: 16px; /* 각 요소의 font-size를 원래대로 복구합니다. */
}
/* 좌석 영화 포스터 끝 */
/* 상영관, 날짜, 포스터 공간 끝 */

/* 좌석 아이콘, 선택좌석 공간 시작 */
.choice-seat-area{
    overflow: hidden;
    height: 230px;
    width: 280px; 
    margin: 5px 0 0 1px;
    border-radius: 5px;
    /* border: 1px solid #434343; */
    display: inline-block;
}
.kind-seat{
    font-size: 10px;
    color: white;
    position: sticky;
    float: left;
    width: 125px;
    border: 1px solid white;
    height: 230px;
   
    
}
.seat-em{
    margin-top: 20px;
    margin-left: 20px;
    
    width: 50px;
    height: 10px;
    float: right;
    text-decoration: none;
    font-style: normal;
}
.choise-seat{
    float: none;
    margin: 0 auto;
    text-align: center;
    color: white;
    width: 140px;
    height: 230px;
}
.wrap{ /* 선택좌석 감싸는 클래스의 이름*/
  display: flex;
  flex-wrap: wrap;
  
  width: 70%;
  margin-left: 30px;
  margin-bottom: 30px;
}
 /* 좌석 아이콘, 선택좌석 공간 끝 */ 
 
 /* 가격 표시되는 공간 시작 */
.pay-area{
    display: block;
    height: 20px;
    float: left;
    width: 100%;
}
.pay{
    height: 20px;
    width: 50%;
    float: left;
}
.seat-position{
    float: left;
    border: 1px solid white;
    width: 35px;
    height: 35px;
    margin-left: 3px;
    text-align: center;
}
.count{
    font-size: 10px;
    color: rgb(160, 160, 160);
    text-align: left;
}
.tit-pay{
    font-size: 11px;
    color: white;
    text-align: left;
}
.money>em{
    color: #06b0b3;
    font-size: large;
    text-align: right;
    font-style: normal;
}
.money>span{
    color: white;
    font-size: 11px;
    text-align: right;
}
.money{
    float: right;
}
.btn-group{
    padding-top: 70px;
    height: 10px;
    width: 110%;
    padding-right: 13px;
}
 /* 가격 표시되는 공간 끝 */
 
/* 영화 정보 페이지 이동 버튼 오른쪽 컨테이너 끝*/

/* 팝업창 시작*/
#document-modal{
    background-color:rgba(0, 0, 0, 0.8); 
    justify-content:center; 
    align-items:center;     
    position:fixed;      
    top:-100px;
    left:0;
    right:0;
    bottom:0;             
    display:none; 
}
.document-modal{
    width:400px;            
    border-radius:5px;       
    overflow:hidden;        
    height: 430px;
    position: absolute;
    top: calc(50vh - 210px); left: calc(50vw - 200px);
}
.document-modal-header{
  width:100%;
  height:30px;  
  display:flex; 
  align-items:left;
  justify-content:left;
  color: white;
  font-size: 5px;
  padding-left: 10px;
  background-color: #263343;
}
.document-modal-body{
    width: 400px;
    padding: 1px;
    background-color: white;
    word-break:break-word; 
    overflow-y:auto;  
    color: black;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.dot-list{
   color: black;
   font-size: 20px;
   text-align: center;
   margin-bottom: 20px;
}

.btn-document-modal{
    background-color:#263343;
    align-items:left;
    justify-content:left;
    color: white;
    border: 1px solid #263343;
    width: 100px;
    height: 30px;
    margin-top: 20px;
}
/* 팝업창 끝*/

#pagePrevious,
#pageNext {
  width: 130px; 
  display: inline-block;
  padding: 10px 20px;
  background-color: #263343;
  color: white;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
#pagePrevious:hover,
#pageNext:hover{
  background-color: #34495e;
}
</style>

<body>
  <div class="inner-wrap">
    <div class="quick-reserve" >
      <h2>빠른 예매</h2>
      <div class="left-container">
        <div class="seat-section">
          <div class="title-small-utill" >
            <h3>관람인원선택</h3>
             <button type=button class="button-reset">
                        <img
                            src="${pageContext.request.contextPath}/resources/img/resetbutton.png"
                            class="btn-reset-icon" />초기화
                    </button>
          </div>
           <div class="check-people-box">
                     <div class="check-people">
                            <p class="txt">성인</p>
                            <div class="count">
                                <button type="button" class="down" title="성인 좌석 선택 감소">-</button>
                                <div class="number">
                                    <button type="button" class="now" title="성인 현재 좌석 선택 수">0</button>
                                </div>
                                <button type="button" class="up" title="성인 좌석 선택 증가">+</button>
                            </div>
                        </div>
                      
                        <div class="check-people">
                            <p class="txt">청소년</p>
                            <div class="count">
                                <button type="button" class="down" title="청소년 좌석 선택 감소">-</button>
                                <div class="number">
                                    <button type="button" class="now" title="청소년 현재 좌석 선택 수">0</button>
                                </div>
                                <button type="button" class="up" title="청소년 좌석 선택 증가">+</button>
                            </div>
                        </div>
                      
                        <div class="check-people">
                            <p class="txt">우대</p>
                            <div class="count">
                                <button type="button" class="down" title="우대 좌석 선택 감소">-</button>
                                <div class="number">
                                    <button type="button" class="now" title="우대 현재 좌석 선택 수">0</button>
                                </div>
                                <button type="button" class="up" title="우대 좌석 선택 증가">+</button>
                            </div>
                        </div>

                    </div>
          
           <div class="seat-area">
                    <div id="seat-wrapper">
                    <div class="img-card">
                            <img
                                src="${pageContext.request.contextPath}/resources/img/img-theater-screen.png"
                                alt="screen-seat" class="screen-seat">
                        </div>
                      
                        <table id="tableSeat" ></table>
                    </div>
</div> <!-- 좌석 끝 -->
        
        </div>
        </div>
      <div class="right-container">
        <div class="movie-container" >
            <div class="title-area">
            <span class="yimg"> <img src="${pageContext.request.contextPath}/resources/img/newaging/${svokey.mage}.png" class="img-age"> </span>
            <p class="title">${svokey.mname }</p>
            <p class="cate">2D</p>
            </div>
            <div class="movie-detail-area">
            <div class="text-wrapper">
             <p class="theaterName">${svokey.theater_name }점</p>
            <p class="theaterNo">${svokey.theater_no}관</p> 
            <p class="date">
            <span>${svokey.year}.${svokey.month}.${svokey.day}</span>
            <em>(${svokey.dayOfweek})</em>
            </p>
            <div class="other-time">
       <!--      <button type="button" class="now-time" style="background-color: none; border: none;">
            <span>13:45 ~ 15:00 </span>  -->
            <p class="now-time">${svokey.start_time} ~ ${svokey.end_time}</p>
            </button>
         <!--   <ul style="list-style:none;">
            <li class="time-show" style="visibility: visible;">
                    버튼클릭시 li의 visibility :visible 으로 설정 
            </li>
            </ul>
            -->
            </div>
            </div>
            <div class="img-wrapper">
            <div class="img-card2">
            <img id="imgid2"  src="${pageContext.request.contextPath}/resources/img/semi_movie/${svokey.mimg }" style="width: 75px;">;
            </div>
            </div>
            </div>
           <div class="choice-seat-area">
                                <div class="choise-seat">
                                    <p class="tit-seat">선택좌석</p>
                                    <!-- 좌석선택시 class가 choice로 바뀌고 title과 내용이 변경-->
                                    <div class="wrap">
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                        <div class="seat-position" title="구매가능좌석">-</div>
                                    </div>
                                </div>
                          </div>
                    <div class="pay-area">
                                <p class="count">
                                    <!--좌석선택시 span과 em의 내용이 바뀐다. <em></em> -->
                                    <span></span> 
                                </p>
                                <div class="pay">
                                    <p class="tit-pay">최종결제금액</p>
                                </div>  
                                <div class="money">
                                    <em>0</em>
                                    <span>원</span>
                                </div>
                            </div> 
                            <div class="btn-group">
                                <a href="javascript:history.back();" class="button" id="pagePrevious" title="이전">이전</a>
                                    <button class="button" id="pageNext" title="다음" >다음</button>
                                  
                                  
                            </div>      
            </div>
             
            <!-- 좌석 컨테이너 오른쪽에 영화 정보 컨테이너 공간 끝  -->
        
      </div>
        <!-- 결제창으로 넘어갈 때 함께 넘어갈 데이터들~ 추후에 다시 점검하기!!!-->
          <form action = "${pageContext.request.contextPath}/successticket/addTicket" method="post" id="form-seat-ticket" accept-charset="UTF-8">
         <input type="hidden" name="mbdate" value="">
        <input type="hidden" name="totalPrice" value="" />
        <input type="hidden" name="seatno" value="" />
        <input type="hidden" name="adultCount" value="" />
        <input type="hidden" name="teenCount" value="" />
        <input type="hidden" name="discountCount" value="" />
        
        <input type="hidden" name="mname" value="${svokey.mname}" />
        <input type="hidden" name="mage" value="${svokey.mage}" />
        <input type="hidden" name="mimg" value="${svokey.mimg }" />
        <input type="hidden" name="theater_no" value="${svokey.theater_no}" /> 
        <input type="hidden" name="theater_name" value="${svokey.theater_name}" />  
        <input type="hidden" name="theater_id" value="${svokey.theater_id}" />  
        <input type="hidden" name="dayOfweek" value="${svokey.dayOfweek}" /> 
        <input type="hidden" name="mno" value="${svokey.mno}" /> 
        <input type="hidden" name="start_time" value="${svokey.start_time}" /> 
        <input type="hidden" name="end_time" value="${svokey.end_time}" />
        <input type="hidden" name="screening_id" value="${svokey.screening_id}" />   
   
    </form>
         <!-- 결제창으로 넘어갈 때 함께 넘어갈 데이터들~끝 -->
         <!-- alert를 대신 할 팝업 창!! 경고창  -->
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
          <!-- alert를 대신 할 팝업 창!! 경고창 끝  -->
        </div>
      </div>
    </div>
    
</body>

<script>
$(function() {
      let maxCount = 8; // 선택 가능한 최대 인원 수
    let selectedCount = 0;  // 현재 선택된 인원 수
      let selectedSeats = []; // 현재 선택된 좌석 번호를 저장할 배열
   
    
      let adultPrice = 15000; // 성인 가격
      let teenPrice = 10000; // 청소년 가격
      let discountPrice = 5000; // 우대 가격
   
      // 연령에 맞게 화면에 띄워지게 하는 함수
      function peopleCount() {
      let adultCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("성인")')
            .siblings('.count').children('.number').children(".now").text());
         let teenCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("청소년")')
               .siblings('.count').children('.number').children(".now").text());
         let discountCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("우대")')
               .siblings('.count').children('.number').children(".now").text());
      
         let adultText = "성인 " + adultCount + "명";
         let teenText = "청소년 " + teenCount + "명";
         let discountText = "우대 " + discountCount + "명";  
         let result = "";
         if (adultCount > 0) {
           result += adultText;
         }if (teenCount > 0) {
           if (result !== "") {
             result += ", ";
           }result += teenText;
         }if (discountCount > 0) {
             let oldDocument = '우대요금으로 예매하신 고객님께서는 상영관입장시 증빙서류를 제시해 주시기 바랍니다.(미 지참시 입장제한)';
             if ($('p.dot-list').text() !== oldDocument) {
                 $('p.dot-list').text(oldDocument);
                 $('#document-modal').css('display', 'flex');
               } if (result !== "") {
             result += ", ";
           } result += discountText;
         }$("p.count span").text(result);
       }

     // 인원 수에 따라 가격을 계산하는 함수
      function calculatePrice() {
         let adultCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("성인")')
               .siblings('.count').children('.number').children(".now").text());
          console.log("성인 요금"+adultCount);
          let teenCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("청소년")')
                .siblings('.count').children('.number').children(".now").text());
        console.log("청소년 요금"+teenCount);
          let discountCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("우대")')
                .siblings('.count').children('.number').children(".now").text());
       console.log("우대 요금"+discountCount)
        // 연령 별 금액
      //  let test = $('.count') 
       let totalPrice = (adultCount * adultPrice) + (teenCount * teenPrice) + (discountCount * discountPrice); 
     //  let totalPrice = ((adultCount || 0) * (adultPrice || 0)) + ((teenCount || 0) * (teenPrice || 0)) + ((discountCount || 0) * (discountPrice || 0));

        $(".money em").text(totalPrice); // 가격을 화면에 표시
      
        return totalPrice;
      }
    
      // 연령에 따른 관람수 버튼
      $(".up").click(function() {
        let currentCount = getTotalCount(); // 현재 선택된 인원 수
        if (currentCount < maxCount) {
          let numBox = $(this).siblings(".number").children(".now").text();
          let upNum = parseInt(numBox) + 1;
          $(this).siblings(".number").children(".now").text(upNum);
          let totalPrice = calculatePrice();
         $(".total-price").text(totalPrice);
           console.log("가격이잉"+totalPrice);
        
        peopleCount();
        } else {
             $('p.dot-list').text("인원선택은 총 8명까지 가능합니다");
             $('#document-modal').css('display','flex');
        }
      
      });
      

$('.down').click(function() {
      if (selectedCount > 0) {
        if (confirm("선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?")) {
          $('.seatBtn').removeClass('selected');
          selectedCount = 0;
          selectedSeats = [];
          $('.seatBtn').css('background-color', 'white');
          $('.seatBtn').css('color', 'black');
          $('.number').children('.now').text('0'); // 인원 수 초기화
          $(".total-price").text('0');
          $('.money em').text('0'); // 가격을 0으로 초기화
          $('.wrap').children('.seat-position').css("background-color","#263343");
          // 선택좌석 
          $('div.seat-position').text('-');
        } else {
          return;
        }
      }
      let current = parseInt($(this).siblings('.number').children('.now').text());
      if (current > 0) {
        $(this).siblings('.number').children('.now').text(current - 1);
       let totalPrice = calculatePrice();
       $(".total-price").text(totalPrice);
     console.log("가격2"+totalPrice);
      }
      peopleCount();
    });
    
      // 현재 선택된 인원 수 반환
      function getTotalCount() {
        let totalCount = 0;
        $(".now").each(function() {
          totalCount += parseInt($(this).text());
        });
        return totalCount;
      }
    
      
    // 인원 수에 따라 선택 가능한 좌석 업데이트
      function updateSelectableSeats() {
      let totalCount = getTotalCount(); // 현재 선택된 인원 수
    
      // 좌석 버튼 비활성화 &활성화
      $('.seatBtn').each(function() {
      let seatval = $(this).val();
      let seatno = $(this).data('seatno');
      
      if ($(this).hasClass('booked')) {
      $(this).prop('disabled', true); // 예약된 좌석은 선택 불가능하게 설정
      } else {
      if (totalCount <= maxCount) {
      $(this).prop('disabled', false); // 선택 가능한 좌석
      } else {
      if ($(this).hasClass('selected')) {
      $(this).prop('disabled', false); // 이미 선택된 좌석은 선택 가능하게 유지
      } else {
      $(this).prop('disabled', true); // 선택 불가능한 좌석
      }
      }
      }
      });
    calculatePrice(); // 총 가격 계산
    }
    
         // Ajax 요청 보내기
         $.ajax({
           type: "GET",
           url: "${pageContext.request.contextPath}/getSeat/seats",
           data: { theater_id: "${svokey.theater_id}", screening_id: "${svokey.screening_id}" },
           success: function(data) {
             // 좌석 만들기
             var rowHtml = '';
             for (var i = 0; i < data.length; i++) {
               let seat = data[i];
               let seatHtml = '<td><button class="seatBtn ' + (seat.booked ? 'booked' : 'available') + '" data-seatno="' + seat.seatno + '" value="' + seat.mbhang + '">' + seat.seatno + '</button></td>';
               if (seat.booked === 1) {
                  seatHtml = '<td><button class="seatBtn ' + (seat.booked ? 'booked' : 'available') + '" data-seatno="' + seat.seatno + '" value="' + seat.mbhang + '" style="background-color: black; color: #c9b459;">' + seat.seatno + '</button></td>';
                }
               rowHtml += seatHtml;
             if ((i + 1) % 5 == 0) { // 한 행에 5개의 좌석이 차면
                 let tableHtml = '<tr>' + rowHtml + '</tr>'; // 행 추가
                 $('#tableSeat').append(tableHtml);
                 rowHtml = ''; // 새로운 행을 만들기 위해 rowHtml 초기화
             }
             }
          // 마지막에 한 행이 남아있는 경우 추가
             if (rowHtml != '') {
                 let tableHtml = '<tr>' + rowHtml + '</tr>';
                 $('#tableSeat').append(tableHtml);
             }
           },
           error: function() {
             console.log('Error loading seats');
           }
         });
      
       
      // 좌석 버튼 클릭 시 색깔도 변하게 만드는 기능
//$seat.find('.seatBtn').click(function() { // 클릭 이벤트 리스너 등록
 $(document).on('click', 'button.seatBtn', function() {
     let seatval = $(this).attr('value');
       console.log(seatval);
       let seatno = $(this).data('seatno');
       console.log(seatno);
      let currentCount = getTotalCount(); // 현재 선택된 인원 수
      // 인원을 선택하지 않고 좌석 버튼을 눌렀을 때 뜨는 경고창
      if(currentCount === 0){
          $('p.dot-list').text("인원을 먼저 선택해주세요.");
            $('#document-modal').css('display','flex');
            return;
        }
      if ($(this).hasClass('booked')) {
          $('p.dot-list').text('이미 예약된 좌석입니다.');
         $('#document-modal').css('display','flex');
         return;
      } else {
      // 선택되어 있는 좌석인 경우
      if ($(this).hasClass('selected')) {
      $(this).removeClass('selected');   
      selectedCount--; //selectedCount--는 현재 선택된 좌석의 수를 1 감소
      currentCount--; // 현재 인원 1씩 감소
      selectedSeats.splice(selectedSeats.indexOf($(this).data('seatno')), 1);
      $('.seat-position').eq(selectedCount).text("-").css('background-color', '#263343'); // 선택한 좌석 번호를 화면에서 지움
      $('.number .now').text(); // 현재 선택된 좌석 수를 화면에 표시   
      // 선택된 좌석 번호를 화면에 표시
      $(this).css('background-color', 'white');
      $(this).css('color', 'black');
      } else {
        // 선택 가능한 좌석 수를 넘어선 경우
            if (selectedCount >= currentCount) {
                 $('p.dot-list').text('좌석 예약이 완료되었습니다.');
              $('#document-modal').css('display','flex');
      } else {
      $(this).addClass('selected');
      selectedCount++; //  selectedCount--는 현재 선택된 좌석의 수를 1 증가     
      selectedSeats.push($(this).data('seatno')); // selectedSeats라는 배열에 현재 선택한 좌석의 번호를 추가
      console.log(selectedSeats); // 좌석번호가 배열에 담겨져 있음 (데이터 저장)
      // 선택된 좌석 번호를 화면에 표시
       $('.seat-position').eq(selectedCount-1).text(seatno).css('background-color', '#06b0b3'); // 선택한 좌석 번호를 화면에 표시  
      $(this).css('background-color', 'black');
      $(this).css('color', '#c9b459 ');
      }
      }
      }
      calculatePrice(); // 좌석 선택 시 가격을 계산하여 화면에 표시
      });
          
      
      
      let uid = '<%=(String)session.getAttribute("sessionID")%>'; 
      $('#pageNext').click(function(e) {
      if (uid =="null") { // 로그인이 되어 있는 경우
         $('p.dot-list').text('로그인이 필요한 서비스입니다. 로그인 페이지로 넘어갑니다.');
           $('#document-modal').css('display','flex');
           // 확인 버튼을 클릭하면 로그인 페이지로 이동
           $('.btn-document-modal').click(function(){
             window.location.href = "${pageContext.request.contextPath}/member/loginForm";
           });
           // 일정 시간이 지난 후에 로그인 페이지로 이동하기
           setTimeout(function(){
             window.location.href = "${pageContext.request.contextPath}/member/loginForm";
           }, 10000); // 5초 후에 실행    
               
      } else {  // 로그인이 되어 있지 않은 경우 
      e.preventDefault();
      // 선택된 좌석 번호를 쉼표로 구분하여 selectedSeats 변수에 저장
      // 배열을 쉼표로 구분된 문자열로 변환
      let seatNumbers = selectedSeats.join(",");
      // 총 가격을 totalPrice 변수에 저장
      let totalPrice = calculatePrice();
      // 선택된 성인, 청소년, 우대 인원수를 변수에 저장
      peopleCount();
      let adultCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("성인")')
          .siblings('.count').children('.number').children(".now").text());
      let teenCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("청소년")')
                .siblings('.count').children('.number').children(".now").text());
      let discountCount = parseInt($(".check-people-box").children('.check-people').children('.txt:contains("우대")')
                .siblings('.count').children('.number').children(".now").text());
      // 날짜 데이터 전달 - dateDTO에서 mbdate으로 바꿔서 보내기
      let year = $('.date span').text().split('.')[0];
      let month = $('.date span').text().split('.')[1];
      let day = $('.date span').text().split('.')[2];
      // input 태그에 값을 할당
      $('input[name=seatno]').attr("value",selectedSeats);
      $('input[name=totalPrice]').val(totalPrice);
      $('input[name=adultCount]').val(adultCount);
      $('input[name=teenCount]').val(teenCount);
      $('input[name=discountCount]').val(discountCount);
      $('input[name=mbdate]').val(year + '-' + month + '-' + day);
      // 결제창으로 이동
      $('#form-seat-ticket').submit();
              
          }   
         });
       
      
      
      $('.btn-document-modal').click(function(){
       $('#document-modal').css('display','none');
      })
      
      // 초기화 버튼
      function resetSeats() {
         // 좌석 초기화
          $('.selected').removeClass('selected').prop('disabled', false).css('background-color', 'white').css('color', 'black');
         $('.wrap').children('.seat-position').css("background-color","#263343");
         // 선택좌석 
         $('div.seat-position').text('-');
         console.log("clean test13=====");
          selectedSeats = [];
          selectedCount = 0;
          // 인원 수 초기화
          $('.number .now').text('0');
          $('.money em').text('0'); // 가격을 0으로 초기화
          // getMaxSeat() 함수는 좌석의 최대 개수를 반환하는 함수입니다. availableSeats 변수에 getMaxSeat()의 반환값을 할당함
          
          // 연령대 선택 초기화
          $('.check-people .number .now').text('0');
          currentCount = 0;
          
         // 인원 수 업데이트
          peopleCount();
     
         
        }
      // 초기화 버튼
      $('.button-reset').click(function() {
         console.log("test 완료");
         resetSeats();
      });
  
});
</script>



</html>