package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.BoxDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;

@Repository
public class MovieUpDAO implements MovieUpDAOInter {

		@Autowired
	   private SqlSessionTemplate ss;
	   
	   @Override
	   public void addMovieUp(MovieUpDTO vo) {
	      ss.insert("movieup.add", vo);
	      
	   }

	   @Override
	   public List<MovieUpDTO> movieList() {
	      return ss.selectList("movieup.listmovie");
	   }

	   @Override
	   public MovieUpDTO detailMovie(int mno) {
	      MovieUpDTO vo = ss.selectOne("movieup.detailmovie",mno);
	      return vo;
	   }

	   @Override
	   public void delete(int mno) {
	      ss.delete("movieup.deletemovie", mno);
	      
	   }

	   @Override
	   public void updateMovie(MovieUpDTO vo) {
	      ss.update("movieup.updatemovie", vo);
	      
	   }

	   @Override
	   public int getCnt() {
	      int cnt = ss.selectOne("movieup.totalCount");
	      return cnt;
	   }

	   @Override
	   public List<MovieUpDTO> listMovie(Map<String, Integer> map) {
	      List<MovieUpDTO> list = ss.selectList("movieup.listpage", map);
	      return list;
	   }
	   
	   @Override
	   public void addMovieComm(MovieCommDTO mcvo) {
	      ss.insert("movieup.addmoviecomm",mcvo);      
	   }

	   @Override
	   public List<MovieCommDTO> listMovieComm(int no) {
	      return  ss.selectList("movieup.listmoviecomm",no);
	   }

	   @Override
	   public void upMovieComm(MovieCommDTO mcvo) {
	      ss.update("movieup.upmoviecomm",mcvo);
	      
	   }

	   @Override
	   public int delmovie(int no) {
	      return ss.selectOne("movieup.delmovie",no);
	   }

	   @Override
	   public void delcomm(int commno) {
	      ss.delete("movieup.delcommno",commno);
	      
	   }

	   @Override
	   public float mgoodAvg(int mno) {
	      return ss.selectOne("movieup.mgoodAvg",mno);
	   }
	   
		// movie 서치 메서드
		@Override
		public List<MovieUpDTO> searchMv(String searchValue) {
			System.out.println("DAO searchMv=>" + searchValue);
			List<MovieUpDTO> list = ss.selectList("movieup.searchMv", searchValue);
			return list;
		}

		@Override
		   public List<Float> getratio() {
		     return ss.selectList("movieup.ratio");
		   }

		@Override
		public List<BoxDTO> boxList() {
			return ss.selectList("movieup.box");
		}
	
}
