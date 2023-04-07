<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.fit-picture {
    width: 250px;
}
.fit-table {
    width: 750px;
}
</style>

<!-- Content영역 -->
<div class="container mt-5">
	<div class="row">
		<div id="sub1">
			<fieldset>
				<legend>스낵구매</legend>
			</fieldset>
		</div>
	</div>
</div>

<form method="post" action="pro.kosmo" id="snackform">
					<input type="hidden" name="cmd" value="snack"> 
					<input type="hidden" name="scmd" value="popcorn">
<table class="table">
	<thead>
		<tr>
			<td>스낵1</td>
			<td>스낵2</td>
			<td>스낵3</td>
		</tr>
	</thead>
	<tbody>
	<tr>
		<td class="align-middle">
			<div class="row mb-3">
    			<div class="col-sm-10">
    				<img class="fit-picture" 
    					src="/resources/image/apple.jpg" id="imgx1" class="rounded">
    			</div>
    			<div>
    			<label>러브콤보</label>
    			</div>
    			<div>
    			<label></label>
    			</div>
			</div> 
		</td>
		<td class="align-middle">
			<div class="row mb-3">
    			<div class="col-sm-10">
    				<img class="fit-picture" 
    					src="/resources/image/banana.jpg" id="imgx2">
    			</div>
    			<label>더블콤보</label>
    			</div>
    			<div>
    			<label>15,000원</label>
    			</div>
			</div>
		</td>
		<td class="align-middle">
			<div class="row mb-3">
    			<div class="col-sm-10">
    				<img class="fit-picture" 
    					src="/resources/image/blueberries.jpg" id="imgx3">
    			</div>
    			<label>트리플콤보</label>
    			</div>
    			<div>
    			<label>20,000원</label>
    			</div>
			</div>
		</td>
	</tr>
	<tr>
			<td colspan="3" style="text-align: center">
  			<div>
		    <input type="radio" id="snack1" name="snack" value="snack1">
		    <label for="snack1">스낵1</label>
		    <input type="radio" id="snack2" name="snack" value="snack2">
		    <label for="snack2">스낵2</label>
		    <input type="radio" id="snack3" name="snack" value="snack3">
		    <label for="snack3">스낵3</label>
		  </div>
			</td>
	</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="3" style="text-align: right">
				<a href="pro.movie?cmd=demo&scmd=cart"><input type="button" value="결제" id="wbtn" class="button-r">
			</a></td>
		</tr>
	</tfoot>
	</table>
</form>