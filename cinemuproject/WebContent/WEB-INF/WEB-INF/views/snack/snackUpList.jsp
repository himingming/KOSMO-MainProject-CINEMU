<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/snack-bt.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>


<div class="snack">
	<div class="container">
		<div class="page-tit">
			<hr>
			<h2>
				<strong>Snack</strong>
			</h2>
			<hr>
			<!-- Nav -->
			<div class="snack-menu">
				<%-- Cart버튼 --%>
				<button type="button" class="btn" data-toggle="modal"
					data-target="#cart">
					<i class="fa-solid fa-basket-shopping"></i>&nbsp;<span
						class="total-count"></span>
				</button>
				<button class="clear-cart btn">Clear</button>
			</div>

			<%-- for start --%>

			<!-- Main -->
			<div class="main-container">
				<div class="row">
					<c:forEach var="e" items="${list}">
						<div class="col">
							<div class="card" style="width: 20rem;">
								 <img
									class="card-img-top"
									src="${pageContext.request.contextPath}/resources/img/snack/${e.popimg}"
									alt="Card image cap">
								<div class="card-block">
									<h4 class="card-title">${e.popname}</h4>
									<p class="card-detail">${e.snackdetail }</p>
									<p class="card-text">${e.poppay }원</p>

									<a href="#" data-name="${e.popname}" data-price="${e.poppay }"
										class="add-to-cart btn"><i class="fa-solid fa-cart-plus"></i></a>

									<c:if test="${sessionScope.sessionID == 'admin'}">
										<a href="snackdelete?popno=${e.popno }" class="btn">delete</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>
			<div class="category-detailsnack">
				<dt>이용안내</dt>
				<dd>
					- 극장 사정에 따라 일부 메뉴 제공이 어려울 수 있습니다.<br> - 해당 기프트콘은 오프라인 매점에서 실제
					상품으로 교환할 수 있는 온라인 상품권입니다. <br> - 구매 후 전송받으신 기프트콘은, 사용가능한 CGV의
					매점에서 지정된 해당 상품으로만 교환이 가능합니다. (사용가능 CGV는 '상품교환'에서 확인 가능하며, 추가 상품을
					포함하여 구매 시 지점에 따라 사용이 불가 할 수 있으니 발송되는 기프트콘의 정보를 확인해주시기 바랍니다.) 해당 상품
					내에서 팝콘 맛 혹은 사이즈 변경 시 추가 비용 발생합니다. 교환 완료한 상품의 환불 및 반품은 불가합니다. <br>
					- 유효기간 연장을 신청하는 경우, 유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시
					3개월(92일) 단위로 유효기간이 연장됩니다. 단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장이 불가할 수
					있습니다. 유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다. <br> - 매점상품 기프트콘은 극장
					매점에서 상품 교환 후 수령한 영수증으로 CJ ONE 적립이 가능합니다. (모바일App,웹 > MY > 매점적립 or
					홈페이지> My CGV > 매점이용 포인트 적립) <br> - 상기 이미지는 실제와 다를 수 있습니다.
				</dd>

				<dt>취소/환불</dt>
				<dd>
					- 구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는
					수신자가 결제금액의 90%에 대해 환불 요청 가능합니다. <br> - 단, 이미 사용된 기프트콘에 대해서는
					결제취소/환불 신청이 불가합니다. 결제취소/환불 방법 결제취소는 모바일App,웹 > MY > 결제내역조회 > 스토어 or
					홈페이지 > My CGV > 스토어 > 결제내역의 해당 주문 상세내역에서 가능합니다. (기프트콘은 구매일로부터 60일
					이내 결제취소 가능하며, 카드 결제취소 가능 기간이 경과하였을 경우, 고객센터로 연락주시면 됩니다) 환불은
					모바일App,웹 > MY > 기프트콘 or 홈페이지 > My CGV > 스토어 > 내 기프트콘에서 환불을 원하는 기프트콘
					등록 후 진행 가능하며, 비회원의 경우 고객센터로 신청 가능합니다. 단 이 때, 본인 확인 및 계좌 확인 절차가
					진행됩니다. <br> - 수신자는 선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및
					환불에 대한 안내가 이루어집니다. <br> - 결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우
					구매자에게 기프트콘이 재발송됩니다. <br> - CGV고객센터 1544-1122
				</dd>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="cart" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title" id="exampleModalLabel">
								<i class="fa-solid fa-basket-shopping"></i>
							</h3>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<!-- cart 나오는 영역 -->
							<table class="show-cart table">
							<!-- 주문내역 -->
							</table>
							<div class="total-price">
								Total price: <span class="total-cart"></span>원
							
							
							<form
								action="${pageContext.request.contextPath}/snackbuy/snackbuy"
								method="post">
								<span id="paybtn"></span>
								<button type="submit" class="btn" id="orderp">지금 주문하기</button>
							</form>
						</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	//************************************************
	//Shopping Cart API
	//************************************************
	$(function() {
		let trying = '';
		let pricea = '';
		let item = '';
		//계산 확인

		$('#orderp').click(function() {
			console.log('클릭테스트')
			for ( const e in myApp.memberList) {

				trying = $('.trying').eq(e).text();
				pricea = $('.pricea').eq(e).text();
				item = $('.item-count').eq(e).val();

				$('input[name=popname]').eq(e).attr('value', trying);
				$('input[name=poppay]').eq(e).attr('value', pricea);
				$('input[name=snacksaram]').eq(e).attr('value', item);
				console.log('1trying=>' + trying);
				console.log('2pricea=>' + pricea);
				console.log('3item=>' + item);
			}
			shoppingCart.clearCart();
		});
	});

	var shoppingCart = (function() {
		// =============================
		// Private methods and propeties
		// =============================
		cart = [];

		// Constructor
		function Item(name, price, count) {
			this.name = name;
			this.price = price;
			this.count = count;
		}

		// Save cart
		function saveCart() {
			sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
		}

		// Load cart
		function loadCart() {
			cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
		}
		if (sessionStorage.getItem("shoppingCart") != null) {
			loadCart();
		}

		// =============================
		// Public methods and propeties
		// =============================
		var obj = {};

		// Add to cart
		obj.addItemToCart = function(name, price, count) {
			for ( var item in cart) {
				if (cart[item].name === name) {
					cart[item].count++;
					saveCart();
					return;
				}
			}
			var item = new Item(name, price, count);
			cart.push(item);
			saveCart();
		}
		// Set count from item
		obj.setCountForItem = function(name, count) {
			for ( var i in cart) {
				if (cart[i].name === name) {
					cart[i].count = count;
					break;
				}
			}
		};
		// Remove item from cart
		obj.removeItemFromCart = function(name) {
			for ( var item in cart) {
				if (cart[item].name === name) {
					cart[item].count--;
					if (cart[item].count === 0) {
						cart.splice(item, 1);
					}
					break;
				}
			}
			saveCart();
		}

		// Remove all items from cart
		obj.removeItemFromCartAll = function(name) {
			for ( var item in cart) {
				if (cart[item].name === name) {
					cart.splice(item, 1);
					break;
				}
			}
			saveCart();
		}

		// Clear cart
		obj.clearCart = function() {
			cart = [];
			saveCart();
		}

		// Count cart 
		obj.totalCount = function() {
			var totalCount = 0;
			for ( var item in cart) {
				totalCount += cart[item].count;
			}
			return totalCount;
		}

		// Total cart
		obj.totalCart = function() {
			var totalCart = 0;
			for ( var item in cart) {
				totalCart += cart[item].price * cart[item].count;
			}
			return Number(totalCart.toFixed(2));
		}

		// List cart
		obj.listCart = function() {
			var cartCopy = [];
			for (i in cart) {
				item = cart[i];
				itemCopy = {};
				for (p in item) {
					itemCopy[p] = item[p];

				}
				itemCopy.total = Number(item.price * item.count).toFixed(2);
				cartCopy.push(itemCopy)
			}
			return cartCopy;
		}

		// cart : Array
		// Item : Object/Class
		// addItemToCart : Function
		// removeItemFromCart : Function
		// removeItemFromCartAll : Function
		// clearCart : Function
		// countCart : Function
		// totalCart : Function
		// listCart : Function
		// saveCart : Function
		// loadCart : Function
		return obj;
	})();

	//*****************************************
	//Triggers / Events
	//***************************************** 
	//Add item
	let myApp = {};
	myApp.memberList = [];
	$('.add-to-cart').click(function(event) {
		event.preventDefault();
		var name = $(this).data('name');
		var price = Number($(this).data('price'));
		shoppingCart.addItemToCart(name, price, 1);
		displayCart();
		addcart();
	});

	// 
	// moviebuy에 insert 하기 위한 for문 시작
	function addcart() {
		let member = {};
		member.name = $('.trying').text();
		member.price = $('.pricea').text();
		member.itemcount = $('.item-count').val();
		myApp.memberList.push(member);
		console.log(member.name);
		console.log(member.price);
	}

	/*
	 let trying ='';
	 let pricea='';
	 let item ='';
	 //계산 확인

	 $('#orderp').click(function() {
	 console.log('클릭테스트')
	 for (const e in myApp.memberList) {
	
	 trying = $('.trying').eq(e).text();
	 pricea = $('.pricea').eq(e).text();
	 item = $('.item-count').eq(e).val();
	
	 $('input[name=popname]').attr('value',trying);
	 $('input[name=poppay]').attr('value',pricea);
	 $('input[name=snacksaram]').attr('value',item);
	 console.log('1trying=>'+trying);
	 console.log('2pricea=>'+pricea);
	 console.log('3item=>'+item);
	 }
	 });
	 */

	//Clear items
	$('.clear-cart').click(function() {
		shoppingCart.clearCart();
		displayCart();
	});

	//displayCart메서드
	function displayCart() {
		let trying = '';
		let pricea = '';
		let item = '';
		let member = {};
		let cartArray = shoppingCart.listCart();
		let output = "";
		let inputval = "";
		for ( var i in cartArray) {
			//Cart 리스트 생성
			output += "<tr>"
					+ "<td class='trying'>"
					+ cartArray[i].name
					+ "</td>"
					+ "<td class='pricea'>"
					+ cartArray[i].price
					+ "</td>"
					+ "<td><div class='input-group'><button class='minus-item input-group-addon btn btn-primary' data-name=" + cartArray[i].name + ">-</button>"
					+ "<input type='number' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'>"
					+ "<button class='plus-item btn btn-primary input-group-addon' data-name=" + cartArray[i].name + ">+</button></div></td>"
					+ "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].name + ">X</button></td>"
					+ " = " + "<td>" + cartArray[i].total + "</td>" + "</tr>";

			inputval += '<input type="hidden" name="poppay" class="pricea" value=""><input type="hidden" name="popname" class="trying" value=""><input type="hidden" name="snacksaram" class="snackcount" value="">';
			/*
			inputval += '<input type="hidden" name="poppay" class="pricea" value="">'
			+ '<input type="hidden" name="popname" class="trying" value="">'
			+ '<input type="hidden" name="snacksaram" class="snackcount" value="">';
			 */
			// input value 생성
		}
		;
		$('#paybtn').html(inputval);
		$('.show-cart').html(output);
		$('.total-cart').html(shoppingCart.totalCart());
		$('.total-count').html(shoppingCart.totalCount());
	}

	/*
	 function displayCart() {
	 var cartArray = shoppingCart.listCart();
	 var output = "";
	 for(var i in cartArray) {
	 output += "<tr>"
	 + "<td class='trying'>" + cartArray[i].name + "</td>" 
	 + "<td class='pricea'>"+cartArray[i].price+"</td>"
	 + "<td><div class='input-group'><button class='minus-item input-group-addon btn btn-primary' data-name=" + cartArray[i].name + ">-</button>"
	 + "<input type='number' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'>"
	 + "<button class='plus-item btn btn-primary input-group-addon' data-name=" + cartArray[i].name + ">+</button></div></td>"
	 + "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].name + ">X</button></td>"
	 + " = " 
	 + "<td>" + cartArray[i].total + "</td>" 
	 +  "</tr>";
	 }
	 $('.show-cart').html(output);
	 $('.total-cart').html(shoppingCart.totalCart());
	 $('.total-count').html(shoppingCart.totalCount());
	 }
	 */

	//Delete item button
	//displayCart() 호출 영역
	$('.show-cart').on("click", ".delete-item", function(event) {
		var name = $(this).data('name')
		shoppingCart.removeItemFromCartAll(name);
		displayCart(); //호출
	})

	//-1
	$('.show-cart').on("click", ".minus-item", function(event) {
		var name = $(this).data('name')
		shoppingCart.removeItemFromCart(name);
		displayCart();
	})
	//+1
	$('.show-cart').on("click", ".plus-item", function(event) {
		var name = $(this).data('name')
		shoppingCart.addItemToCart(name);
		displayCart();
	})

	//Item count input
	$('.show-cart').on("change", ".item-count", function(event) {
		var name = $(this).data('name');
		var count = Number($(this).val());
		shoppingCart.setCountForItem(name, count);
		displayCart();
	});

	displayCart();
	//카트 수량 value에 값 넣어주기 제이쿼리
</script>