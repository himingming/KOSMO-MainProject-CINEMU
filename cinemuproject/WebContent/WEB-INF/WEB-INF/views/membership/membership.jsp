<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div id="content">
		<div class="page-tit">
			<h2>
				<strong>Cinemu Membership</strong>
			</h2>
			<p class="desc">Today's special moments are tomorrow's memories.</p>
		</div>
		<div id="membership">
			<div class="user">
				<div class="title">
					<p>cinemu만의 다양한 혜택을 누리세요!</p>
				</div>
				<hr>
				<table>
					<thead>
						<tr>
							<th><span id="membox" class="mem-img"></span></th>
							<th><img class="mem-img"
								src="${pageContext.request.contextPath}/resources/img/membership/silver.png"></th>
							<th><img class="mem-img"
								src="${pageContext.request.contextPath}/resources/img/membership/gold.png"></th>
							<th><img class="mem-img" id="plaid"
								style="width: 100px; height: 125px;"
								src="${pageContext.request.contextPath}/resources/img/membership/platinum.png"></th>
							<th><img class="mem-img" id="diaid"
							style="width: 100px; height: 125px;"
								src="${pageContext.request.contextPath}/resources/img/membership/diamond.png"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>선정 기준</td>
							<td>cinemu 가입시</td>
							<td>6개월 실 결제 금액<br>10만원 이상
							</td>
							<td>6개월 실 결제 금액<br>30만원 이상
							</td>
							<td>6개월 실 결제 금액<br>50만원 이상
							</td>
						</tr>
						<tr class="reserve-tr">
							<td>적립금</td>
							<td class="sil-td">구매금액의 <a>1%</a></td>
							<td class="gol-td">구매금액의 <a>3%</a></td>
							<td class="pla-td">구매금액의 <a>5%</a></td>
							<td class="dia-td">구매금액의 <a>10%</a></td>
						</tr>
						<tr>
							<td>영화 쿠폰</td>
							<td>주중 스페셜 관람권 1매 <br> 주중 관람권 1매 <br> 주중/주말 관람권 4매
							</td>
							<td>주중 스페셜 관람권 1매 <br> 주중 관람권 2매 <br> 주중/주말 관람권 6매
							</td>
							<td>주중 스페셜 관람권 2매 <br> 주중 관람권 2매 <br> 주중/주말 관람권 8매
							</td>
							<td>주중 스페셜 관람권 2매 <br> 주중 관람권 3매 <br> 주중/주말 관람권
								10매
							</td>
						</tr>
						<tr>
							<td>스낵 쿠폰</td>
							<td>팝콘M 교환권 1매 <br> 탄산음료M 교환권 1매 <br> 콤보 4천원 할인권
								1매
							</td>
							<td>팝콘M 교환권 2매 <br> 탄산음료M 교환권 2매 <br> 콤보 4천원 할인권
								3매
							</td>
							<td>팝콘M 교환권 1매 <br> 스위트 콤보 교환권 1매 <br> 에이드 할인권 1매
								<br> 콤보 4천원 할인권 3매
							</td>
							<td>팝콘M 교환권 2매 <br> 스위트 콤보 교환권 2매 <br> 에이드 할인권 2매
								<br> 콤보 4천원 할인권 5매
							</td>

						</tr>
						<tr>
							<td>기념일 쿠폰</td>
							<td>스위트 콤보 교환권 1매</td>
							<td>스위트 콤보 교환권 1매</td>
							<td>스위트 콤보 교환권 1매</td>
							<td>스위트 콤보 교환권 1매</td>
						</tr>
					</tbody>
				</table>
				<dl class="mem-ul">
					<dt>승급월로 부터 12개월 실적기준 (상영일) | 승급 포인트 적립 내역 기준</dt>
					<br>
					<dd>본 혜택은 VIP 등급 유지 기간 중 제공됩니다. 직접 쿠폰을 선택하신 후 다운받으셔야 쿠폰을 이용하실
						수 있습니다.</dd>
					<dd>VIP 쿠폰북은 영화와 매점, 기념일 쿠폰으로 구성되어 있습니다.</dd>
					<dd>등급 별 VIP 쿠폰 제공이 상이하오니 VIP 쿠폰북 안내를 통해 확인해주세요.</dd>
					<dd>쿠폰마다 유효 기간이 상이합니다. 유효기간을 꼭 확인해 주세요.</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
