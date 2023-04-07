<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content영역 -->


<form action="sendRnum" method="post">
  <div class="inner-container">
  	<div class="search-box">
    <div class="box">
      <h1>Password 찾기</h1>
      <input type="text" placeholder="ID" name="lid"/>
      <input type="e-mail" name="lemail" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" placeholder="e-mail ex) movie@cinemu.com" />
      <input type="submit" value="e-mail 인증번호 발송" class="submit" style="font-family: 'Nanum Gothic', sans-serif; font-size: 16px;"/>
		${error }
      <div class="subsearch-box">
      <a href="${pageContext.request.contextPath}/member/loginForm">로그인하기</a>&nbsp;&nbsp; 
      <a href="${pageContext.request.contextPath}/member/findId">ID찾기</a>
      </div>
    </div>
  </div>
  </div>
  </form>

 