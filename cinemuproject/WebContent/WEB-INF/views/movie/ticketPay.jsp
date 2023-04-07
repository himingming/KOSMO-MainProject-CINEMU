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
/* ���� ���� Ÿ��Ʋ ���� */
.quick-reserve {
   margin-top: 10px;
   height: 600px;
}

.quick-reserve h2 {
   margin-left: 0px;
   width: 100%;
   border-bottom: 1px solid black; /* ���ָ� �ȵ�!*/
   padding-bottom: 10px;
}
/* ���� ���� Ÿ��Ʋ ���� �� */

/* ���� �����̳� ����*/
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
/*�ʱ�ȭ ��ư*/
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
/* ���� �����̳� ��*/
/* ������ �����̳� ����*/
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
/* ������ �����̳� ��*/
/* ���ϸ��� �˾�â ����*/
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
/* ���ϸ��� �˾�â ��*/
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
      <h2>����</h2>
        <div class="left-container">
           <div class="title-small-utill" >
            <h3>������ �� ��������</h3>
             <button type=button class="button-reset">
                        <img
                            src="${pageContext.request.contextPath}/resources/img/resetbutton.png"
                            class="btn-reset-icon" />�ʱ�ȭ
                    </button>
          </div>
          <div class="sale-ticket">
             <span>���׹� ���ϸ���/������</span>
                        <button type="button" id="point-modal-show" class="btn-modal-show">���׹� ����� ���ϸ���</button>
                        <button type="button" id="coupon-modal-show" class="btn-modal-show">���׹� ������</button>
          </div>
            <div class="pay-kakao" >
                <h5>�������� ����</h5>
                <div class="text-wrap">
                    <div class="" id="pay-kakao-id"></div>
                    <div class="text-event"><p>1���� �̻� ������ ��ȭ������ ��÷ �̺�Ʈ �ڵ�����!</p></div>
                </div>
                <div class="pay-wrap">
                   <input type="radio" class="active" name="radio-card-pay" id="card-pay-radiobox" checked>
                    <label for="card-pay-radiobox">�ſ�/üũī��</label>
                   
                </div>
                <div class="pay-story">
                    <ul>
                        <li>����������� ���θ����� ���¸� ���� 1ȸ��� �� ��й�ȣ �Է¸����� �����ϰ� �̿��� �� �ִ� ���ݰ��� ���� �Դϴ�.</li>
                        <li>���� ���˽ð��� ��� ������������� �̿��� �Ұ��մϴ�.</li>
                    </ul>
                </div>
            </div>
          </div>
      <div class="right-container">
          <div class="title-name">
                <img src="${pageContext.request.contextPath}/resources/img/newaging/${svokey.mage}.png" class="count-age">
                <p class="title-text">${svokey.mname}</p>
                    <p class="screen-system">���� �¼� ����
                      (${ ticket.seatno})  
                      </p>
                <p class="screen-location">${svokey.theater_name}/${svokey.theater_no}��</p>
                <p class="screen-day">${ticket.mbdate }(${svokey.dayOfweek}) </p>
                <p class="screen-time"><i class="fas fa-clock"></i>${svokey.start_time} ~ ${svokey.end_time}</p>
            </div>
           <div class="pay-container">
                <div class="kind-age">
                      <p class="name" style="color: white">
           <c:if test="${ticket.adultCount > 0}"> ���� ${ticket.adultCount}��</c:if>
         <c:if test="${ticket.teenCount > 0}"> û�ҳ� ${ticket.teenCount}��</c:if>
        <c:if test="${ticket.discountCount > 0}"> ��� ${ticket.discountCount}��</c:if>
        <c:set var="totalCount" value="${ticket.adultCount + ticket.teenCount + ticket.discountCount}" />
                    </p>
                </div>
                <div class="total">
                    <p class="pay" style="font-weight: bolder; color: white;">�� �� </p>
                    <p class="total-pay" style="color: white"><em>${ticket.totalPrice }</em>��</p>
                </div>
                <i class="fas fa-minus-circle"></i>
                <div class="discount-total">
                    <p class="discount-pay">
                        <em>0</em>��
                    </p>
                </div>
                <div class="discount-content">
                    <div class="point">
                        <p class="use-point" style="color: white">���ϸ��� ���</p>
                        <p class="point-discount" style="color: white"><em></em>��</p>
                    </div>
                </div>
                <div class="final-pay">
                    <p class="final-title" style="color: white">���������ݾ�</p>
                    <p class="final-total" style="color: white"><em>${ticket.totalPrice }</em>��</p>
                </div>
                <div class="way-pay">
                    <p class="way-pay-title" style="color: white">��������</p>
                    <p class="way-pay-content" style="color: white">�ſ�/üũī�� ����</p>
                </div>
                <div class="btn-final">
                <!-- ������������ �̵� -->
                <!-- �������� ������ ���� 
                <a href="javascript:history.go(2)">�������� �ڷΰ���</a> -->
                    <a class="btn-pre" href="javascript:history.back();">����</a>
                    

                 
                        <button class="btn-pay" type="button" id="paybutton">����</button>
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
      <!-- ���ϸ��� ��� ���� -->
       <div id="point-modal">
        <div class="point-modal">
            <div class="point-modal-header">
                <!--�Ⱥ��̰Դ�   display:flex; �� �߰��Ѵ�.-->
                <h5 class="tit">���׹� ����� ���ϸ���</h5>
            </div>
            <div class="point-modal-body">
                <ul class="dot-list">
                    <li>���ϸ����� 5000�� �̻��� ��� ��밡���� ���ϸ��� �Դϴ�.</li>
                    <li>���ϸ��� ���� �� ��볻���� ���� ����� ���ϸ��� Ȯ���ϼ���</li>
                </ul>
               <div class="usable-point">
  <i class="fas fa-parking"></i> ��밡���� ����� ���ϸ��� <span><em>${mvo.lmileage}</em>P</span>
</div>
<div class="total-point">
  <c:choose>
    <c:when test="${not empty mvo.lmileage}">
      <div class="point-wrap">
        <div class="block">
          <input type="number" min="5000" max="${mvo.lmileage}" step="1" id="point-input" placeholder="����� ���ϸ����� �Է��ϼ���">
          <button class="btn-block" id="point-submit-btn">����ϱ�</button>
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
                    <!--����� �ݾ� ���εǵ���-->
                    <button type="button" class="btn-discount-pay" id="btn-point-close">�ݱ�</button>
                    <!--��ҽ� style�� display���� none���� -->
                    <button type="button" class="btn-discount-pay" id="btn-point-submit">����</button>
                </div>
            </div>
        </div>
    </div>
 </div> 
</body>
<script>
$(function(){
   let uid = '<%=(String)session.getAttribute("sessionID")%>'; 
   // ���Ź�ȣ ����
function generateBookingNo() {
     let bookingNo = '';
     const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';  // ����� ���ڵ�
     const length = 5;  // ���Ź�ȣ ����
     for (let i = 1; i < length; i++) {
       const randomIndex = Math.floor(Math.random() * characters.length);  // �������� �ε����� ����
       bookingNo += characters[randomIndex];  // ���õ� ���ڸ� ���Ź�ȣ�� �߰�
     }
     return bookingNo;
   }
   const bookingNo = generateBookingNo(); // ���Ź�ȣ ����
   
   // �����Ϸ� 
 $(".btn-pay").click(function(){
      
      }); // btn-pay 
      
// ���ϸ��� �˾�â         
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
          document.getElementById('alert-message').innerHTML = '���ϸ����� �����Ͽ� ����� �� �����ϴ�.';
           return;
       }
       
       if (inputPoint < 1000 || inputPoint > currentPoint) {
          document.getElementById('alert-message').innerHTML = '�߸��� �Է��Դϴ�. 1000�� �̻� ��� �����ϸ�, ������ ���ϸ��� ������ �ݾױ��� ��� �����մϴ�.';
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
               document.getElementById('alert-message').innerHTML ='���ϸ��� ������ �����߽��ϴ�. �ٽ� �õ����ּ���.';
           }
       });
   });
//���ϸ��� �˾�â   ��

 $('.btn-pay').click(function(e) {
     e.preventDefault();
     let currentTotal =  $('p.final-total>em').text();
     console.log("currentTotal123"+currentTotal);
   $('input[name=lid]').val(uid);
    $('input[name=mbpay]').val(currentTotal);
    $('input[name=booking_no]').val(bookingNo);
   
    
    $('#ticket-insert').submit();
})
// ���� ��ư ��
      }) // ���� ū function 
</script>
</html>