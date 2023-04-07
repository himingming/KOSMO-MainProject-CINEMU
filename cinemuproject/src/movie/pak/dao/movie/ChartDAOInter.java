package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.LoginDTO;

public interface ChartDAOInter {

	public String movTitle(int mno); //영화의 제목을 가져옴 
	public List<LoginDTO> genDonut(int mno); // 영화를 예매한 성별의 수를 출력
	public List<Map<String, Integer>> ageBarlist(int mno); //영화를 예매한 세대의 수를 출력
	
}
