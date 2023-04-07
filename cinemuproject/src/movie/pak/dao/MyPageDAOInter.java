package movie.pak.dao;

import java.util.List;
import java.util.Map;

import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.MyMovieDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.SnackUpDTO;
import movie.pak.dto.TotallikeDTO;

public interface MyPageDAOInter {
	public List<MyMovieDTO> movieP(Map<String, Object> map); // 영화 예매 내역 출력
	public int movieCnt (String id); // 총 예매 수
	public List<SnackUpDTO> snackP(Map<String, Object> map); // 스낵 구매 내역 출력
	public int snackCnt (String id); // 총 스낵 구매 수
	public List<QnABoardDTO> qnaP(Map<String, Object> map); // Q&A 내역 출력
	public int qnaPCnt (String id); // 총 문의내역 수
	public List<MovieCommDTO> moviecomm(Map<String, Object> map); // 영화 감상평
	public int mvcommCnt (String id); // 총 감상평 수
	public List<MovieUpDTO> mvlP(Map<String, Object> map); // 좋아요 내역
	public int mvlCnt (String id); // 좋아요 총 수
//좋아요 선택한 영화의 장르
public List<String> liketype(String lid);
//좋아요 선택한 영화 장르의 영화 이름 
public List<String> mtname(String lid, String genrelist);

//전체 회원이 좋아요 선택한 영화의 장르
public List<TotallikeDTO> totalliketype();
//전체 좋아요 선택한 영화 장르의 영화 이름들 
public List<String> tomtname(String togenrelist);


public int mbPay(String lid);//영화총 금액 
public int popPay(String lid); //스낵 총 금액


}


