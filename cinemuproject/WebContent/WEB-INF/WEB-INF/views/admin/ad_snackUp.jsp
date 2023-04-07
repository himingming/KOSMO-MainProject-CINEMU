<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content영역 -->
<div  class="container mt-5">
  <div class="row">
	<div id="sub1">
<fieldset>
<legend>상품 등록 관리자폼</legend>
<form method="post" action="pro.kosmo?cmd=resv&scmd=rinsert" enctype="multipart/form-data" id="upform">
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">상품 이름</label>
   <div class="col-sm-10"><input type="text" name="" id="" placeholder="상품이름을 입력하세요."/></div>
   
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">상품 가격</label>
   <div class="col-sm-10"><input type="text" name="" id=""/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">상품 소개</label>
   <div class="col-sm-10"><input type="text" name="" id=""/></div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">*이미지업로드</label>
    <div class="col-sm-10"><input type="file" name="upfile" id="upfile"/></div>
    <div class="col-sm-10"><img src="/resources/image/noimage.jpg" id="imgx" ></div>
</div>                        
<div class="row mb-3 ">
 <div class="col-sm-10">
 	<input type="submit" value="등록" id="insertBtn" class="btn btn-danger"/>
 	<input type="button" value="스낵리스트" id="listBtn" class="btn btn-danger"/>
 </div>
</div>
</form>
</fieldset>
  </div>
  </div>
</div>

<script>
//javascript는 클라이언트 측 언어
//HTML, CSS 동적으로 제어하는 목적으로 주로 사용
//html5부터 제공해주는 FileReader() 함수를 사용해서 이미지 미리보기를 구현
//함수는 메서드와 비슷
/*
 * 메서드 : public void readURL(String input){}
 * 변수: String reader => var reader
 *
 */
function readURL(input){
	//input type="file"의 주소를 가져온다.
	if(input.files && input.files[0]){
		var reader = new FileReader();
		//감지자
		reader.onload = function(e) {
			//이미지를 읽어낸 후 적용시킬 구문!
			//console.log("Path :"+e.target.result);
			//이미지를 id로 선택해 보자
			//$('#imgx') => <img src="이미지 경로" id="igmx">
			//src란 속성을 접근하기 위해서 attr()란 함수로 불러올 속성을 지정함
			//console.log($('#imgx').attr('src'));
			$('#imgx').attr('src',e.target.result);
		}
		//input type ="file"의 값을 바이너리 데이터로 읽어 온다.
		reader.readAsDataURL(input.files[0]);
	}
}
//jQuery문법
$(function(){
	//jQuery 선택자
	//대상선택자에서 변화를 감지하는 이벤트 : change()
	$('#upfile').change(function(){
		//경고창 -
		//alert("경고창");
		//alert($(this).val());
		//브라우저 콘솔창에 출력
		console.log($(this).val());
		console.log($(this).val().length);
		if($(this).val().length > 0){
			console.log("이미지 있다.");
			//함수 호출
			readURL(this);
		}else{
			console.log("이미지 없다.");
		}
	});
	
	//리스트 버튼 클릭
	//wbtn버튼 클릭 이벤트
	$('#listBtn').click(function(){
		//강제이동
		location="pro.kosmo?cmd=resv&scmd=rlist"
	});
	//등록 버큰 클릭
	$('#insertBtn').click(function(){
		//강제이동
		location="pro.kosmo?cmd=resv&scmd=rinsert"
	});
});
</script>