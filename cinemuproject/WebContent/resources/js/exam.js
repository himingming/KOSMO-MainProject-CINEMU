/**
 * @author kosmo
 * 
 */
$(function(){
	//let firstColor ="d-flex flex-row-reverse mybgColor";
	console.log("log00 => "+$('.mybgColor').attr('class'));
	$('#item1').click(function(){
		//$(this).attr('class',firstColor)
		console.log("log => "+$('.mybgColor').attr('class'));
		$('.mybgColor').attr('class',function(){
			$(this).attr('style','background-color:#0dcaf0');
			/*
			let changeClass = $(this).attr('class');
			let class_sttr_arr = changeClass.split(" ");
			$.each(class_sttr_arr,function(e,val){
				console.log(e+"::::::::::::::::::"+val)
				if(val.includes("bg-")){
					console.log("================>"+e+":"+val);
					$('.mybgColor').attr('class').replace(val,'bg-info');
				}else{
					changeClass +=" bg-info";
				}
				$('.mybgColor').attr('class',changeClass)
			});
			*/
		});
	});
	$('#item2').click(function(){
		console.log("log => "+$('.mybgColor').attr('class'));
		$('.mybgColor').attr('class',function(){
			$(this).attr('style','background-color:#ffc107');
		});
		//이미지 세팅하기
		let imgArr = ['d1.jpg','d2.jpg','d3.jpg'];
		$('.carousel-item > img').each(function(idx){
			console.log("바뀔 이미지 :"+imgArr[idx]+", log Img => "+$(this).attr('src'));
			$(this).attr('src','../resources/image/'+imgArr[idx]);
		});
		
	});
	$('#item3').click(function(){
		$('.mybgColor').attr('class',function(){
			$(this).attr('style','background-color:#0d6efd');
		});
		//이미지 세팅하기
		let imgArr = ['c1.jpg','c2.jpg','c3.jpg'];
		$('.carousel-item > img').each(function(idx){
			console.log("바뀔 이미지 :"+imgArr[idx]+", log Img => "+$(this).attr('src'));
			$(this).attr('src','../resources/image/'+imgArr[idx]);
		});
	});
});