<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>   
<!DOCTYPE html>
<html>
 <head>
  <TITLE> New Document </TITLE>
  
 
<script
   src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>

<%-- 스타일 시트 --%>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/detailstyle.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/swiper.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/style.css">
<%--구글 폰트 --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&family=Nanum+Gothic:wght@700&family=Nanum+Myeongjo:wght@700;800&family=Noto+Sans+KR:wght@300;500;700;900&display=swap"
   rel="stylesheet">
<%-- fontawesome(이모티콘) --%>
<script src="https://kit.fontawesome.com/a6aba5f130.js"
   crossorigin="anonymous"></script>
<%-- 부트스트랩 시작 --%>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<%-- 부트스트랩 끝 --%>
<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<%--swiper --%>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

</head>
<body>

<header>
 <tiles:insertAttribute name="header"/>
 <tiles:insertAttribute name="menu"/>
</header>

<tiles:insertAttribute name="body"/>

<footer>
<tiles:insertAttribute name="footer"/>
</footer>

</body>
</html>