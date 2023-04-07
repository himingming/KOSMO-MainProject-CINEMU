<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
   
</script>


<div class="container mt-5">
   <div class="row">
      <header>
         <h1>현재 영화 리스트</h1>
      </header>



      <table style="border: 1px solid;">
         <thead>
         
            <tr>
               <th width="5%" class="text-center">영화번호</th>
               <th width="5%" class="text-center">포스터</th>
               <th width="5%" class="text-center">영화제목</th>
               <th width="5%" class="text-center">관람수</th>
               <th width="5%" class="text-center">영화장르</th>
               <th width="5%" class="text-center">상영시간</th>
               <th width="5%" class="text-center">연령</th>
               <th width="5%" class="text-center">개봉일</th>
               <th width="5%" class="text-center">감독</th>
               <th width="5%" class="text-center">줄거리</th>
               <th width="5%" class="text-center">출연진</th>
               </tr>
               </thead>
               <tbody>
         <c:forEach var="e" items="${list}">
            <tr>   
               <td width="5%" class="text-center">${e.mno }</td>
               <td width="5%" class="text-center"><img
                  src="${pageContext.request.contextPath}/resources/imgfiles/${e.mimg}"
                  style="width: 100px"></td>      
               <td width="5%" class="text-center"><a href="moviedetail?no=${e.mno }">${e.mname}</a></td>
               <td width="5%" class="text-center">${e.msaram}</td>
               <td width="5%" class="text-center">${e.mtype}</td>
               <td width="5%" class="text-center">${e.mtime}</td>
               <td width="5%" class="text-center">${e.mage}</td>
               <td width="5%" class="text-center">${e.mstartday}</td>
               <td width="5%" class="text-center">${e.mdirec}</td>
               <td width="30%" class="text-center">${e.mstory}</td>
            <td width="5%" class="text-center">${e.mactor}</td>
            </tr>
         </c:forEach>
      </tbody>

      <tfoot>
       <tr>
                  <td colspan="10">
                  <%@include file="../page/pageModule.jsp" %>
                  </td>
               </tr>
               <tr><td colspan="5" style="text-align: center"> </td>
</tr>
      
         <tr>
         <td>
          <button type="button" class="btn btn-outline-danger" id="inbtn">글작성</button>
          <button type="button" class="btn btn-outline-danger" id="upbtn">수정</button>
         <button type="button" class="btn btn-outline-danger" id="delbtn">삭제</button>
      </td>
         </tr>
      </tfoot>
      </table>
      
   </div>
</div>

<script>
   $(function() {
      //wbtn클릭 이벤트
      $('#inbtn').click(function() {

         //강제이동
         location = "${pageContext.request.contextPath}/movies/movieForm"
      });
      $('#upbtn').click(function() {
         //강제이동
         location = "${pageContext.request.contextPath}/movies/movieupdate"
      });
      $('#delbtn').click(function() {
         //강제이동
         location = "${pageContext.request.contextPath}/movies/moviedelete"
      });
   });
</script>