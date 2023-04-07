package movie.pak.dto;

import java.util.List;

public class ScreeningDTO {
	private int screening_id;
	private int theater_id;
	private int mno;
	private String start_time;
	private String end_time;

	// 상영시간 일정표 리스트 resultMap 시작
	private List<MovieUpDTO> movie;

	public int getScreening_id() {
		return screening_id;
	}

	public void setScreening_id(int screening_id) {
		this.screening_id = screening_id;
	}

	public int getTheater_id() {
		return theater_id;
	}

	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
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

	public List<MovieUpDTO> getMovie() {
		return movie;
	}

	public void setMovie(List<MovieUpDTO> movie) {
		this.movie = movie;
	}

}
