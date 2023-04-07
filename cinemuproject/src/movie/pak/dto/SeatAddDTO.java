package movie.pak.dto;

public class SeatAddDTO {
//좌석으로 넘어갈 때 필요한 예매한 영화들 정보 더 수정하기
	private String mname; // 영화이름
	private int mage; // 연령
	private String mimg; // 영화 포스터
	private String theater_name;
	private int theater_no;
	private int theater_id;
	private String day;
	private String dayOfweek;
	private String year;
	private String month;
	private int mno;
	private String start_time;
	private String end_time;
	private int screening_id;
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMage() {
		return mage;
	}
	public void setMage(int mage) {
		this.mage = mage;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public int getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getDayOfweek() {
		return dayOfweek;
	}
	public void setDayOfweek(String dayOfweek) {
		this.dayOfweek = dayOfweek;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getScreening_id() {
		return screening_id;
	}
	public void setScreening_id(int screening_id) {
		this.screening_id = screening_id;
	}
	

}