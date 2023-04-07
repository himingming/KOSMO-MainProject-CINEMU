package movie.pak.dto;

import java.sql.Timestamp;

public class MovieBuyDTO {
	// 수정완료

	private int mbno;
	private String lid;
	private int mbsaram;
	private String mbdate;
	private int mbpay;
	private int mno;
	private Timestamp buy_time;
	private String booking_no;
	private int theater_id;
	private int screening_id;
	private String seatno;

	public int getMbno() {
		return mbno;
	}

	public void setMbno(int mbno) {
		this.mbno = mbno;
	}

	public String getLid() {
		return lid;
	}

	public void setLid(String lid) {
		this.lid = lid;
	}

	public int getMbsaram() {
		return mbsaram;
	}

	public void setMbsaram(int mbsaram) {
		this.mbsaram = mbsaram;
	}

	public String getMbdate() {
		return mbdate;
	}

	public void setMbdate(String mbdate) {
		this.mbdate = mbdate;
	}

	public int getMbpay() {
		return mbpay;
	}

	public void setMbpay(int mbpay) {
		this.mbpay = mbpay;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Timestamp getBuy_time() {
		return buy_time;
	}

	public void setBuy_time(Timestamp buy_time) {
		this.buy_time = buy_time;
	}

	public String getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(String booking_no) {
		this.booking_no = booking_no;
	}

	public int getTheater_id() {
		return theater_id;
	}

	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}

	public int getScreening_id() {
		return screening_id;
	}

	public void setScreening_id(int screening_id) {
		this.screening_id = screening_id;
	}

	public String getSeatno() {
		return seatno;
	}

	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}

}