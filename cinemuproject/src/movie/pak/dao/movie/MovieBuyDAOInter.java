package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.ScreeningDTO;
import movie.pak.dto.SeatDTO;
import movie.pak.dto.TheaterDTO;

public interface MovieBuyDAOInter {

	// ���� �� ��ȭ ����Ʈ �̾Ƴ���
	public List<MovieUpDTO> movieName();

	// ��ȭ ����
	public List<String> movieDir(int mno);

	public List<String> movieTime(MovieUpDTO vo);

	public List<MovieUpDTO> dayMovie(String mendday);

	// �󿵰� ����Ʈ
	public List<TheaterDTO> theaterName();

	// ---�󿵽ð�ǥ,��ȭ�� ����Ʈ
	public List<TheaterDTO> sPlaceList();

	// �󿵽ð�ǥ,�󿵽ð� ����Ʈ
	public List<MovieUpDTO> sScrList(String mendday, String theater_name);

	// �󿵰� theater_no ����Ʈ �̱� ex) ������ : 1��
	public List<TheaterDTO> theaterNo(String theater_name);

	// �󿵰��� �� �ð� ����Ʈ �̱�
	public List<ScreeningDTO> ScreeningTime(Map<String, Object> parammap);

	// ���� �¼�/ �� �¼�
	public SeatDTO getSeatInfoByTheaterId(Map<String, Object> paramMap);

}