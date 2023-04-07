<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%--2023. 3. 29./Kosmo--%>
<style>
.ticketSuceess{
  height:500px;
}
.ticketSuceess h1{
   margin: 50px;
}
.successList {
  list-style: none;
  width: 55%;
  font-size: 1.2rem;
  margin: 0 auto;
  text-align: center;
}

.successList li {
  border: 1px solid #ddd;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.successList li>div{
margin-right: 40px;
}
.successList img {
  margin-right: 10px;
}

.ticketSuceess .successList li span {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.ticketSuceess .successList li span>b{
margin-right: 30px;
}
</style>
<body>
<div style="text-align: center;" class="ticketSuceess">
<h1>예매가 완료되었습니다.</h1>
  <ul class="successList">
    <li>
        <img src="${pageContext.request.contextPath}/resources/img/semi_movie/${svokey.mimg }" style="width: 300px;" alt="${svokey.mname}">
      <div>
        <span><b>이&nbsp&nbsp&nbsp&nbsp&nbsp름</b>${mbbvo.lid}</span>
        <span><b>예매번호</b> ${mbbvo.booking_no}</span>
        <span><b>상&nbsp영&nbsp관</b>${svokey.theater_name}점.${svokey.theater_no}관</span>
        <span><b>영&nbsp&nbsp&nbsp&nbsp&nbsp화</b>${svokey.mname}</span>
        <span><b>일&nbsp&nbsp&nbsp&nbsp&nbsp시</b>${ticket.mbdate}(${svokey.dayOfweek}) ${svokey.start_time} ~ ${svokey.end_time} </span>
        <span><b>인&nbsp&nbsp&nbsp&nbsp&nbsp원</b>
          <c:if test="${ticket.adultCount > 0}"> 성인 ${ticket.adultCount}명</c:if>
          <c:if test="${ticket.teenCount > 0}"> 청소년 ${ticket.teenCount}명</c:if>
          <c:if test="${ticket.discountCount > 0}"> 우대 ${ticket.discountCount}명</c:if>
        </span>
        <span><b>좌&nbsp&nbsp&nbsp&nbsp&nbsp석</b>${ticket.seatno}</span>
        <span><b>결제금액</b>${mbbvo.mbpay}</span>
      </div>
    </li>
  </ul>
</div>
</body>
