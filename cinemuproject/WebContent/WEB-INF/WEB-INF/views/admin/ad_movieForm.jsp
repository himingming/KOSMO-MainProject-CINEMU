<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Content영역 -->
<div class="container mt-5">
   <div class="row">
      <div id="sub1">
         <fieldset>
            <legend>이미지 업로드 폼</legend>

            <form method="post" action="${pageContext.request.contextPath}/movies/moviein" 
               enctype="multipart/form-data">
                 <input type="hidden" name="mgrno" value=1>

               <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">*이미지업로드</label>
                  <div class="col-sm-10">
                     <input type="file" name="mfile" id="mfile">
                  </div>
                     <div class="col-sm-10">
                     <img src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx">
                  </div>
                  
                  </div>

                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">영화이름</label>
                     <div class="col-sm-10">
                        <input type="text" name="mname" id="mname"
                           placeholder="제목을 입력하세요." />
                     </div>
                     </div>
                     
                  
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">관람수</label>
                     <div class="col-sm-10">
                        <input type="text" name="msaram" id="msaram" />
                        
                     </div>
                  </div>
                  
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">영화 장르</label>
                     <div class="col-sm-10">
                        <input type="checkbox" name="mtype" id="mtype" value="드라마" />
                        <label for="select0" class="input-label checkbox">드라마</label>
                        <input type="checkbox" name="mtype" id="mtype"value="멜로/로맨스"/>
                        <label for="select1" class="input-label checkbox">멜로/로맨스</label>
                        <input type="checkbox" name="mtype" id="mtype" value="미스터리" />
                        <label for="select2" class="input-label checkbox">미스터리</label>
                        <input type="checkbox" name="mtype" id="mtype" value="판타지" />
                        <label for="select3" class="input-label checkbox">판타지</label>
                        <input type="checkbox" name="mtype" id="mtype" value="다큐멘터리"/>
                        <label for="select4" class="input-label checkbox">다큐멘터리</label>
                        <input type="checkbox" name="mtype" id="mtype" value="스릴러"/>
                        <label for="select5" class="input-label checkbox">스릴러</label>
                        <input type="checkbox" name="mtype" id="mtype" value="SF" />
                        <label for="select6" class="input-label checkbox">SF</label>
                        <input type="checkbox" name="mtype" id="mtype" value="코미디" />
                        <label for="select7" class="input-label checkbox">코미디</label>
                        <br>
                        <input type="checkbox" name="mtype" id="mtype" value="애니메이션" />
                        <label for="select8" class="input-label checkbox">애니메이션</label>
                        <input type="checkbox" name="mtype" id="mtype" value="액션" />
                        <label for="select9" class="input-label checkbox">액션</label>
                        <input type="checkbox" name="mtype" id="mtype"value="서사" />
                        <label for="select10" class="input-label checkbox">서사</label>
                        <input type="checkbox" name="mtype" id="mtype" value="공포" />
                        <label for="select11" class="input-label checkbox">공포</label>
                        <input type="checkbox" name="mtype" id="mtype" value="느와르" />
                        <label for="select12" class="input-label checkbox">느와르</label>
                        <input type="checkbox" name="mtype" id="mtype" value="가족" />
                        <label for="select13" class="input-label checkbox">가족</label>
                        <input type="checkbox" name="mtype" id="mtype" value="범죄" />
                        <label for="select14" class="input-label checkbox">범죄</label>
                        <input type="checkbox" name="mtype" id="mtype" value="서스펜스" />
                        <label for="select15" class="input-label checkbox">서스펜스</label>
                        <input type="checkbox" name="mtype" id="mtype" value="전쟁" />
                        <label for="select16" class="input-label checkbox">전쟁</label>
                        <input type="checkbox" name="mtype" id="mtype" value="모험" />
                        <label for="select17" class="input-label checkbox">모험</label>
                        
                     </div>
                  </div>
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">상영시간</label>
                     <div class="col-sm-10">
                        <input type="text" name="mtime" id="mtime" />
                     </div>
                  </div>
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">연령</label>
                     <div class="col-sm-10">
                         <select name = "mage" id="mage">
                          <option value="">연령 선택하세요</option> 
            <option value="0">전체 관람가</option>
            <option value="7">7세 이상 관람가</option>
            <option value="12">12세 이상 관람가</option>
            <option value="15">15세 이상 관람가</option>
            <option value="18">18세 이상 관람가</option>
                         </select>
                     </div>
                  </div>
           
    
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">개봉일</label>
                     <div class="col-sm-10">
                        <input type="date" name="mstartday" id="mstartday" />
                        
                     </div>
                  </div>
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">감독</label>
                     <div class="col-sm-10">
                        <input type="text" name="mdirec" id="mdirec" />
                     </div>
                  </div>
                  
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">줄거리</label>
                     <textarea name="mstory" id="mstory" rows="10" cols="13"></textarea>
                  </div>

                  
                  
                  <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">출연진</label>
                     <div class="col-sm-10">
                        <input type="text" name="mactor" id="mactor" />
                     </div>
                  </div>
                  
               <!--    <div class="row mb-3">
                     <label class="col-sm-2 col-form-label">관리자</label>
                     <div class="col-sm-10">
                        <input type="text" name="mgrno" id="mgrno" />
                     </div>
                  </div>
                   -->
                  
               <div class="row mb-3 ">
                  <div class="col-sm-10">
                     <input type="submit" value="등록" id="wbtn" class="btn btn-info" />
                     <a href="${pageContext.request.contextPath}/movies/movielist"><input type="button" value="리스트" id="listBtn"
                        class="btn btn-danger" /></a>
                  </div>
               </div>
            </form>
         </fieldset>
      </div>
   </div>
</div>

<script>
   //javaScript는 클라이언트 측 언어
   //HTML, CSS를 동적으로 제어하는 목적으로 주로 사용
   //html5부터 제공해주는 FileReader()함수를 사용해서 이미지 미리보기를 구현
   //함수는 메서드와 비슷 , 호출을 해야 동작한다.
   /*
    메서드: public void readURL(String input){}
    변수: String reader => var reader
    */
   function readURL(input) {
      //input type="file"의 주소를 가져온다.
      if (input.files && input.files[0]) {
         //자바스크립트 I/O
         var reader = new FileReader(); //***
         //감지자
         reader.onload = function(e) { //onload 이벤트 감지/ 익명함수(함수표현식 function(e))
            //이미지를 읽어 낸 후 적용시킬 구문
            //console.log("Path: "+e.target.result); //console: sout~ log를 보임
            //이미지를 id로 선택해보자
            //$('#imgx') => <img src"이미지경로" id=imgx>
            //src란 속성을 접근하기 위해서 attr()란 함수로 불러올 속성을 지정함
            //console.log($('#imgx').attr('src')); => getter
            $('#imgx').attr('src', e.target.result); //setter넣는다
         }
         // input 파일의 값을 바이너리 데이터로 읽어 온다.
         reader.readAsDataURL(input.files[0]);
      }
   }
   //jQuery문법
   $(function() {
      //jQuery 선택자
      //대상선택자에서 변화를 감지하는 이벤트: change()
      $('#mfile').change(function() {
         //경고창-
         // alert("경고창");
         // alert($(this).val()); //this->#upfile
         //브라우저 콘솔창에 출력
         console.log($(this).val());
         console.log($(this).val().length);
         if ($(this).val().length > 0) {
            console.log("이미지 있다.");
            //함수호출
            readURL(this);
         } else {
            console.log("이미지 없다.");
         }
      });
      //리스트 버튼 클릭
      //wbtn버튼 클릭 이벤트
      //$('#listBtn').click(function() {
         //강제이동   
      //   location = "${pageContext.request.contextPath}/movies/movielist";
      //});
   });
</script>