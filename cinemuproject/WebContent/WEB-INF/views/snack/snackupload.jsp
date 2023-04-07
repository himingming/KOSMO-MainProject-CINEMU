<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <article >
        <header>
            <h1>FileUpload Demo</h1>
        </header>
        <ul class="list-unstyled"><li class="border-top my-3"></li></ul>
     <div class="container">
        <%-- boardForm 들어 갈 자리. --%>
        
<fieldset>
<legend>이미지 업로드 폼</legend>
<form method="post" action="${pageContext.request.contextPath}/snack/snackUpload" enctype="multipart/form-data">
  <input type="hidden" name="mgrno" value=1>
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">제품 이름</label>
   <div class="col-sm-10"><input type="text" name="popname" id="popname" placeholder="팝콘 이름을 입력하세요."></div>
   
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">가격</label>
   <div class="col-sm-10"><input type="text" name="poppay" id="poppay"></div>
</div>

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">원산지</label>
   <div class="col-sm-10"><input type="text" name="country" id="country"></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">유효기간</label>
    <div class="col-sm-10"><input type="text" name="usedate" id="usedate"></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">스낵 디테일</label>
    <textarea name="snackdetail" id="snackdetail" rows="10" cols="13"></textarea>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">*이미지업로드</label>
    <div class="col-sm-10"><input type="file" name="mfile" id="mfile"></div>
    <div class="col-sm-10"><img src="${pageContext.request.contextPath}/resources/img/noimage.jpg"
    id="imgx"></div>
</div>                        
<div class="row mb-3 ">
 <div class="col-sm-10"><input type="submit" value="등록" id="btn1" class="btn btn-danger"/>
<a href="${pageContext.request.contextPath}/snack/snackUplist">
                  <input type="button" value="리스트" id="btn1" class="btn btn-danger"></a>
 </div>
</div>
</form>
</fieldset>

     </div>
 
    </article>
    
    <%--11월 25일 --%>

<script>

function readURL(input) {
	   // input type= "file"의 주소를 가져온다.
	   if(input.files && input.files[0]){
	      // 자바스크립트 I/O
	      var reader = new FileReader();
	      // 감지자
	      reader.onload = function(e){
	         $('#imgx').attr('src', e.target.result); // setter 넣겠다.
	      }
	      reader.readAsDataURL(input.files[0]);
	   }
	}
//jQuery문법
   $(function() {
      //jQuery 선택자
      //대상선택자에서 변화를 감지하는 이벤트: change()
      $('#mfile').change(function() {
         if ($(this).val().length > 0) {
            readURL(this);
         } else {
            console.log("이미지 없다.");
         }
      });
   });
  
</script>