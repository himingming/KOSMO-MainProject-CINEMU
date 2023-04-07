package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.LoginDTO;

@Repository
public class ChartDAO implements ChartDAOInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public String movTitle(int mno) {
		return ss.selectOne("chart.mtitle", mno);
	}

	@Override
	public List<LoginDTO> genDonut(int mno) {
		return ss.selectList("chart.gendonut", mno);
	}

	@Override
	public List<Map<String, Integer>> ageBarlist(int mno) {
		
		return ss.selectList("chart.ageBarlist", mno);
	}

}
