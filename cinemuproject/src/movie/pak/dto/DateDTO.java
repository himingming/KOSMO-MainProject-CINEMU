package movie.pak.dto;

public class DateDTO {
// 예매시 주간 날짜 만들기
	private String year;
	private String month;
	private String day;
	private String dayOfweek;
	
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
}
