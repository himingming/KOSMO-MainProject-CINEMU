package movie.pak.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;

@Repository
public class SearchQueryDao implements SearchQueryDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<MovieUpDTO> getMov(String searchValue) {
		return ss.selectList("query.movie", searchValue);
	}

	@Override
	public List<MovieCommDTO> getMComm(String searchValue) {
		return ss.selectList("query.moviecomm", searchValue);
	}

	@Override
	public List<QnABoardDTO> getQna(String searchValue) {
		return ss.selectList("query.qaboard", searchValue);
	}

	@Override
	public String rmvname() {
		return ss.selectOne("query.random");
	}

	@Override
	public List<MovieUpDTO> getMovP(PageSearchDTO psvo) {
		return ss.selectList("query.movpg", psvo);
	}

	@Override
	public List<MovieCommDTO> getMCommP(PageSearchDTO psvo) {
		return ss.selectList("query.commpg", psvo);
	}

	@Override
	public List<QnABoardDTO> getQnaP(PageSearchDTO psvo) {
		return ss.selectList("query.qapg", psvo);
	}

	@Override
	public List<Map<String, Integer>> getCntlist(String searchValue) {
		return ss.selectList("query.cntmap", searchValue);
	}
}
