package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.ScreeningDTO;
import movie.pak.dto.SeatDTO;
import movie.pak.dto.TheaterDTO;

public interface MovieBuyDAOInter {

	// 예매 시 영화 리스트 뽑아내기
	public List<MovieUpDTO> movieName();

	// 영화 예매
	public List<String> movieDir(int mno);

	public List<String> movieTime(MovieUpDTO vo);

	public List<MovieUpDTO> dayMovie(String mendday);

	// 상영관 리스트
	public List<TheaterDTO> theaterName();

	// ---상영시간표,영화관 리스트
	public List<TheaterDTO> sPlaceList();

	// 상영시간표,상영시간 리스트
	public List<MovieUpDTO> sScrList(String mendday, String theater_name);

	// 상영관 theater_no 리스트 뽑기 ex) 가산점 : 1관
	public List<TheaterDTO> theaterNo(String theater_name);

	// 상영관의 상영 시간 리스트 뽑기
	public List<ScreeningDTO> ScreeningTime(Map<String, Object> parammap);

	// 남은 좌석/ 총 좌석
	public SeatDTO getSeatInfoByTheaterId(Map<String, Object> paramMap);

}