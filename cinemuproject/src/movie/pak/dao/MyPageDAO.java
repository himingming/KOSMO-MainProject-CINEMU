package movie.pak.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.MyMovieDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.SnackUpDTO;
import movie.pak.dto.TotallikeDTO;

@Repository
public class MyPageDAO implements MyPageDAOInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<MyMovieDTO> movieP(Map<String, Object> map) {
		System.out.println("map===>");
		return ss.selectList("mypagep.moviep", map);
	} 

	@Override
	public List<SnackUpDTO> snackP(Map<String, Object> map) {

		return ss.selectList("mypagep.snackp", map);
	} 
	

	@Override
	public List<QnABoardDTO> qnaP(Map<String, Object> map) {

		return ss.selectList("mypagep.qnap", map);
	}

	@Override
	public List<MovieCommDTO> moviecomm(Map<String, Object> map) {
		
		return ss.selectList("mypagep.mymvcomm",map);
	}
	@Override
	public int mvcommCnt(String id) {
		return ss.selectOne("mypagep.mvcommCnt",id);
	}

	@Override
	public int qnaPCnt(String id) {
		return ss.selectOne("mypagep.qnapCnt",id);
	}


	@Override
	public int snackCnt(String id) {
		return ss.selectOne("mypagep.snackCnt",id);
	}


	@Override
	public int movieCnt(String id) {
		return ss.selectOne("mypagep.movieCnt",id);
	}

	@Override
	public List<MovieUpDTO> mvlP(Map<String, Object> map) {
		return ss.selectList("mypagep.mvlikep",map);
	}


	@Override
	public int mvlCnt(String id) {
		return ss.selectOne("mypagep.mvlikeCnt",id);
	}
	// ���ƿ� ��ȭ �帣
	   @Override
	   public List<String> liketype(String lid) {
	      System.out.println("�޼��忡�� ����" + lid);
	      List<String> mulike = ss.selectList("mypagep.liketype", lid);
	      return mulike;
	   }
	   // ���ƿ� ������ ��ȭ �帣�� �̸�
	   @Override
	   public List<String> mtname(String lid, String genrelist) {
	      Map<String, String> paramMap = new HashMap<>();
	      paramMap.put("lid", lid);
	       paramMap.put("genrelist", genrelist);
	      return ss.selectList("mypagep.mtname", paramMap);
	   }
	   
	   // ��ü ȸ�� ���ƿ� ������ ��ȭ �帣
	   @Override
	   public List<TotallikeDTO> totalliketype() {
	      List<TotallikeDTO> totallike = ss.selectList("mypagep.totalliketype");
	      return totallike;
	   }
	   // ��ü ȸ�� ���ƿ� ������ ��ȭ �帣�� ��ȭ �̸�
	   @Override
	   public List<String> tomtname(String togenrelist) {
	      return ss.selectList("mypagep.tomtname", togenrelist);
	   }
	   
	// ��ȭ���� �� ��
	@Override
	public int mbPay(String lid) {
		return ss.selectOne("mypagep.mbpay",lid);
	}

	// �������� �� ��
	@Override
	public int popPay(String lid) {
		return ss.selectOne("mypagep.poppay", lid);
	}

}
