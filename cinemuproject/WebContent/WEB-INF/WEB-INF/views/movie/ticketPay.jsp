<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%--2023. 3. 12./Kosmo--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<style>
.inner-wrap {
   width: 1250px;
   margin: auto;
   padding-top: 40px;
   padding-bottom: 100px;
   height: 700px;
}
/* 빠른 예매 타이틀 공간 */
.quick-reserve {
   margin-top: 10px;
   height: 600px;
}

.quick-reserve h2 {
   margin-left: 0px;
   width: 100%;
   border-bottom: 1px solid black; /* 없애면 안됨!*/
   padding-bottom: 10px;
}
/* 빠른 예매 타이틀 공간 끝 */

/* 왼쪽 컨테이너 시작*/
.left-container {
    display: grid;
   height: 600px;
   width: 930px;
   margin-right: 20px;
   float: left;
}

.title-small-utill {
   padding: 8px 0 9px 0;
   border: 1px solid;
}

.title-small-utill>h3 {
   text-align: left;
   height: 2px;
   display: inline-block;
   margin-top: 10px;
}
/*초기화 버튼*/
.button-reset {
   text-align: right;
   float: right;
   width: 70px;
   height: 30px;
   border: 1px solid rgb(197, 196, 196);
   background-color: white;
   text-align: right;
   border-radius: 7px;
   font-size: small;
   font-weight: 550;
   color: rgb(12, 9, 22);
   position: sticky;
   margin: 8px 7px 7px 0;
}

.sale-ticket {
   margin: 10px;
   border: 1px solid;
}

.sale-ticket>span {
   width: 100%;
   height: 40px;
   display: block;
   text-align: left;
   justify-content: center;
   font-weight: bold;
   padding-left: 20px;
   padding-top: 10px;
   font-size: 13px;
}
/* 왼쪽 컨테이너 끝*/
/* 오른쪽 컨테이너 시작*/
.right-container {
    display: grid;
   float: right;
   border-radius: 6px;
   background-color:  #263343;
   width: 300px;
}

.title-name {
   width: 100%;
   height: 110px;
   padding: 10px;
}

.count-age {
   width: 30px;
}

.title-text {
   color: white;
   display: inline;
   font-size: 20px;
}

.screen-system, .screen-location, .screen-day {
   color: white;
   font-size: 15px;
   margin-left: 10px;
   height: 5px;
}

.screen-time {
   float: right;
   color: white;
   font-size: 15px;
   height: 5px;
   padding-right: 8%;
}

.fa-clock {
   float: left;
}
/* 오른쪽 컨테이너 끝*/
/* 마일리지 팝업창 시작*/
.btn-modal-show{
    border: 1px solid rgb(190, 190, 190);
    width: 30%;
    height: 40px;
    background-color: white;
    margin-top: 12px;
    font-size: 10px;
}
#point-modal{
    background-color:rgba(0, 0, 0, 0.8); 
    justify-content:center; 
    align-items:center;     
    position:absolute;      
    top:0;
    left:0;
    right:0;
    bottom:0;             
    display:none; 
}
.point-modal{
    width:400px;            
    border-radius:5px;       
    overflow:hidden;        
    background-color:#263343; 
    box-shadow: 5px 10px 10px 1px rgba(0,0,0,.1); 
    height: 400px;
    z-index: 60;
}
.point-modal-header{
  width:100%;
  height:30px;  
  display:flex; 
  align-items:left;
  justify-content:left;
  color: white;
  font-size: 5px;
  padding-left: 10px;
}
.tit{
    font-weight: 500;
    font-style: normal;
}
.point-modal-body{
    width: 400px;
    height: 400px;
    padding: 6px;
    background-color:#ffffff;
    word-break:break-word; 
    overflow-y:auto;  
}
.dot-list{
    font-size: 15px;
    font-weight: 500;
}
.usable-point{
    justify-content:center;            
    text-align: center;
    margin-left: auto;
    background-color: rgb(235, 235, 235);
    height: 30px;
    font-size: 15px;
    color: #3104B4;
}
em{
    margin-left: 10px;
    font-size: 13px;
    font-style: normal;
}
.button-list{
    width:100%;
    height:30px;
    float: center;
    margin: auto;
}
.btn-discount-pay{     
    text-align: center;  
    width:50px;                    
    height:30px;
    margin: auto;                                              
    color:#ffffff;                 
    cursor:pointer;  
    border: 1px solid #844fff;
    background-color: #263343;       
}
.btn-point-submit{
 
}
.btn-block{
    color: white ;
    background-color: #263343;
}
#point-input{
width: 250px;
}
.total-point{
    width: 100%;
    height: 230px;
    border: 1px solid rgb(173, 172, 172);
    margin: 3px;
}
.point-wrap{
    width: 100%;
    height: 30%;
    display: flex;

}
.text-right{
    float: right;
}
p{
    color: #3ba7ff;
}
.block{
    padding-top: 20px;
    margin: auto;
    float: left;
    height: 60%;
}
/* 마일리지 팝업창 끝*/
.btn-pre,
.btn-pay {
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

.btn-pre:hover,
.btn-pay:hover {
  background-color: #34495e;
}

</style>

</head>
<body>
 <div class="inner-wrap">
    <div class="quick-reserve" >
      <h2>결제</h2>
        <div class="left-container">
           <div class="title-small-utill" >
            <h3>관람권 및 할인적용</h3>
             <button type=button class="button-reset">
                        <img
                            src="${pageContext.request.contextPath}/resources/img/resetbutton.png"
                            class="btn-reset-icon" />초기화
                    </button>
          </div>
          <div class="sale-ticket">
             <span>씨네무 마일리지/관람권</span>
                        <button type="button" id="point-modal-show" class="btn-modal-show">씨네무 멤버십 마일리지</button>
                        <button type="button" id="coupon-modal-show" class="btn-modal-show">씨네무 관람권</button>
          </div>
            <div class="pay-kakao" >
                <h5>결제수단 선택</h5>
                <div class="text-wrap">
                    <div class="" id="pay-kakao-id"></div>
                    <div class="text-event"><p>1만원 이상 결제시 영화관람권 추첨 이벤트 자동응모!</p></div>
                </div>
                <div class="pay-wrap">
                   <input type="radio" class="active" name="radio-card-pay" id="card-pay-radiobox" checked>
                    <label for="card-pay-radiobox">신용/체크카드</label>
                   
                </div>
                <div class="pay-story">
                    <ul>
                        <li>내통장결제는 본인명의의 계좌를 최초 1회등록 후 비밀번호 입력만으로 간편하게 이용할 수 있는 현금결제 서비스 입니다.</li>
                        <li>은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</li>
                    </ul>
                </div>
            </div>
          </div>
      <div class="right-container">
          <div class="title-name">
                <img src="${pageContext.request.contextPath}/resources/img/newaging/${svokey.mage}.png" class="count-age">
                <p class="title-text">${svokey.mname}</p>
                    <p class="screen-system">예매 좌석 정보
                      (${ ticket.seatno})  
                      </p>
                <p class="screen-location">${svokey.theater_name}/${svokey.theater_no}관</p>
                <p class="screen-day">${ticket.mbdate }(${svokey.dayOfweek}) </p>
                <p class="screen-time"><i class="fas fa-clock"></i>${svokey.start_time} ~ ${svokey.end_time}</p>
            </div>
           <div class="pay-container">
                <div class="kind-age">
                      <p class="name" style="color: white">
           <c:if test="${ticket.adultCount > 0}"> 성인 ${ticket.adultCount}명</c:if>
         <c:if test="${ticket.teenCount > 0}"> 청소년 ${ticket.teenCount}명</c:if>
        <c:if test="${ticket.discountCount > 0}"> 우대 ${ticket.discountCount}명</c:if>
        <c:set var="totalCount" value="${ticket.adultCount + ticket.teenCount + ticket.discountCount}" />
                    </p>
                </div>
                <div class="total">
                    <p class="pay" style="font-weight: bolder; color: white;">총 액 </p>
                    <p class="total-pay" style="color: white"><em>${ticket.totalPrice }</em>원</p>
                </div>
                <i class="fas fa-minus-circle"></i>
                <div class="discount-total">
                    <p class="discount-pay">
                        <em>0</em>원
                    </p>
                </div>
                <div class="discount-content">
                    <div class="point">
                        <p class="use-point" style="color: white">마일리지 사용</p>
                        <p class="point-discount" style="color: white"><em></em>원</p>
                    </div>
                </div>
                <div class="final-pay">
                    <p class="final-title" style="color: white">최종결제금액</p>
                    <p class="final-total" style="color: white"><em>${ticket.totalPrice }</em>원</p>
                </div>
                <div class="way-pay">
                    <p class="way-pay-title" style="color: white">결제수단</p>
                    <p class="way-pay-content" style="color: white">신용/체크카드 결제</p>
                </div>
                <div class="btn-final">
                <!-- 이전페이지로 이동 -->
                <!-- 두페이지 앞으로 가기 
                <a href="javascript:history.go(2)">두페이지 뒤로가기</a> -->
                    <a class="btn-pre" href="javascript:history.back();">이전</a>
                    

                 
                        <button class="btn-pay" type="button" id="paybutton">결제</button>
                </div>
            </div>
      </div>
      
      <form action="${pageContext.request.contextPath}/successticket/ticketComplate" method="post" id="ticket-insert"  accept-charset="UTF-8">
      <input type="hidden" name="adultCount" value="${ticket.adultCount}" />
        <input type="hidden" name="teenCount" value="${ticket.teenCount}" />
        <input type="hidden" name="discountCount" value=" ${ticket.discountCount}" />
      <input type="hidden" name="mbsaram"  value="${totalCount}"/>
      <input type="hidden" name="mbdate"  value="${ ticket.mbdate}"/>
      <input type="hidden" name="mno"  value="${svokey.mno }"/>
      <input type="hidden" name="theater_id"  value="${svokey.theater_id }"/>
      <input type="hidden" name="theater_no" value="${svokey.theater_no}" /> 
        <input type="hidden" name="theater_name" value="${svokey.theater_name}" />  
      <input type="hidden" name="screening_id"  value="${svokey.screening_id } "/>
        <input type="hidden" name="start_time" value="${svokey.start_time}" /> 
        <input type="hidden" name="end_time" value="${svokey.end_time}" />
        <input type="hidden" name="dayOfweek" value="${svokey.dayOfweek}" />
       <input type="hidden" name="mname" value="${svokey.mname}" />
       <input type="hidden" name="mimg" value="${svokey.mimg}" />
        <input type="hidden" name="seatno" value="${ticket.seatno }" />
      <input type="hidden" name="mbpay"  value=""/>
      <input type="hidden" name="booking_no"  value=""/>
      <input type="hidden" name="lid"  value=""/>
      
      
      </form>
      
      </div>
      <!-- 마일리지 모달 시작 -->
       <div id="point-modal">
        <div class="point-modal">
            <div class="point-modal-header">
                <!--안보이게는   display:flex; 을 추가한다.-->
                <h5 class="tit">씨네무 멤버쉽 마일리지</h5>
            </div>
            <div class="point-modal-body">
                <ul class="dot-list">
                    <li>마일리지가 5000원 이상일 경우 사용가능한 마일리지 입니다.</li>
                    <li>마일리지 적립 및 사용내역은 나의 멤버쉽 마일리지 확인하세요</li>
                </ul>
               <div class="usable-point">
  <i class="fas fa-parking"></i> 사용가능한 멤버십 마일리지 <span><em>${mvo.lmileage}</em>P</span>
</div>
<div class="total-point">
  <c:choose>
    <c:when test="${not empty mvo.lmileage}">
      <div class="point-wrap">
        <div class="block">
          <input type="number" min="5000" max="${mvo.lmileage}" step="1" id="point-input" placeholder="사용할 마일리지를 입력하세요">
          <button class="btn-block" id="point-submit-btn">사용하기</button>
        <div id="alert-message"></div>
        </div>
      </div>
    </c:when>
    <c:otherwise>
      <div class="point-wrap">
        <div class="block" data-point=""></div>
      </div>
    </c:otherwise>
  </c:choose>
</div>
                
                <div class="button-list">
                    <!--적용시 금액 할인되도록-->
                    <button type="button" class="btn-discount-pay" id="btn-point-close">닫기</button>
                    <!--취소시 style의 display값을 none으로 -->
                    <button type="button" class="btn-discount-pay" id="btn-point-submit">적용</button>
                </div>
            </div>
        </div>
    </div>
 </div> 
</body>
<script>
$(function(){
   let uid = '<%=(String)session.getAttribute("sessionID")%>'; 
   // 예매번호 랜덤
function generateBookingNo() {
     let bookingNo = '';
     const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';  // 사용할 문자들
     const length = 5;  // 예매번호 길이
     for (let i = 1; i < length; i++) {
       const randomIndex = Math.floor(Math.random() * characters.length);  // 무작위로 인덱스를 선택
       bookingNo += characters[randomIndex];  // 선택된 문자를 예매번호에 추가
     }
     return bookingNo;
   }
   const bookingNo = generateBookingNo(); // 예매번호 생성
   
   // 결제완료 
 $(".btn-pay").click(function(){
      
      }); // btn-pay 
      
// 마일리지 팝업창         
 $('#point-modal-show').click(function(){
      $('#point-modal').css("display","flex");
 });
 $('#btn-point-close').click(function(){
      $('#point-modal').css("display","none");
 });
 
 $('#btn-point-submit').click(function() {
       let inputPoint = $('#point-input').val();
       let currentPoint = parseInt('${mvo.lmileage}');
     
       if (currentPoint < 5000) {
          document.getElementById('alert-message').innerHTML = '마일리지가 부족하여 사용할 수 없습니다.';
           return;
       }
       
       if (inputPoint < 1000 || inputPoint > currentPoint) {
          document.getElementById('alert-message').innerHTML = '잘못된 입력입니다. 1000원 이상 사용 가능하며, 보유한 마일리지 이하의 금액까지 사용 가능합니다.';
           return;
       }
       
       $.ajax({
           type: "POST",
           url: "${pageContext.request.contextPath}/Mileage/MileageDed",
           dataType: 'json',
           data: {
               lid: uid,
               subtractAmount: inputPoint
           },
           success: function(data) {
                   $('p.discount-pay>em').text(inputPoint);
                   let currentPay = parseInt('${ticket.totalPrice}');
                   let minus = parseInt($('p.discount-pay>em').text());                  
                   let numberTotal = currentPay * 1;    
                   let currentTotal = numberTotal - minus  
                   if (currentTotal >= 0) {
                       $('p.final-total>em').text(currentTotal);
                   } else {
                       $('p.final-total>em').text(currentPay);
                   }
                   let point = parseInt(inputPoint);
                   if (point >= 0) {
                       $('p.point-discount>em').text(point);
                   } else {
                       $('p.point-discount>em').text(0);
                   }
                   $('#point-modal').css('display', 'none');
           },
           error: function(e) {
               console.log(e);
               document.getElementById('alert-message').innerHTML ='마일리지 차감에 실패했습니다. 다시 시도해주세요.';
           }
       });
   });
//마일리지 팝업창   끝

 $('.btn-pay').click(function(e) {
     e.preventDefault();
     let currentTotal =  $('p.final-total>em').text();
     console.log("currentTotal123"+currentTotal);
   $('input[name=lid]').val(uid);
    $('input[name=mbpay]').val(currentTotal);
    $('input[name=booking_no]').val(bookingNo);
   
    
    $('#ticket-insert').submit();
})
// 결제 버튼 끝
      }) // 제일 큰 function 
</script>
</html>