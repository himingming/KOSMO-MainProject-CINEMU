package movie.pak.dto;

public class SeatDTO {
	private int seat_id;
	private String seatno;
	private String mbyeol;
	private String mbhang;
	private int booked;
	private int theater_id;
	private int screening_id;
	private int total_seats;
	private int booked_seats;
	private int remaining_seats;
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public String getMbyeol() {
		return mbyeol;
	}
	public void setMbyeol(String mbyeol) {
		this.mbyeol = mbyeol;
	}
	public String getMbhang() {
		return mbhang;
	}
	public void setMbhang(String mbhang) {
		this.mbhang = mbhang;
	}
	public int getBooked() {
		return booked;
	}
	public void setBooked(int booked) {
		this.booked = booked;
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
	public int getTotal_seats() {
		return total_seats;
	}
	public void setTotal_seats(int total_seats) {
		this.total_seats = total_seats;
	}
	public int getBooked_seats() {
		return booked_seats;
	}
	public void setBooked_seats(int booked_seats) {
		this.booked_seats = booked_seats;
	}
	public int getRemaining_seats() {
		return remaining_seats;
	}
	public void setRemaining_seats(int remaining_seats) {
		this.remaining_seats = remaining_seats;
	}

}