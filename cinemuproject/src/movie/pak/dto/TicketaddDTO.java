package movie.pak.dto;

public class TicketaddDTO {

	   private String mbdate;
	   private int totalPrice;
	   private String seatno;
	   private int adultCount;
	   private int teenCount;
	   private int discountCount;
	public String getMbdate() {
		return mbdate;
	}
	public void setMbdate(String mbdate) {
		this.mbdate = mbdate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public int getAdultCount() {
		return adultCount;
	}
	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}
	public int getTeenCount() {
		return teenCount;
	}
	public void setTeenCount(int teenCount) {
		this.teenCount = teenCount;
	}
	public int getDiscountCount() {
		return discountCount;
	}
	public void setDiscountCount(int discountCount) {
		this.discountCount = discountCount;
	}

	
	
}