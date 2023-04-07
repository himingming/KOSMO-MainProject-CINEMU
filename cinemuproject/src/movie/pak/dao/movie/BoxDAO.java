package movie.pak.dao.movie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.BoxDTO;

@Repository
public class BoxDAO implements BoxDAOInter{
	
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public List<BoxDTO> boxList() {
		return ss.selectList("movieup.box");
	}

	@Override
	public List<Float> getratio() {
		return ss.selectList("movieup.ratio");
	}

}
