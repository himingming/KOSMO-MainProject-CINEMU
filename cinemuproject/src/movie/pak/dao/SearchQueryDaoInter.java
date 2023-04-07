package movie.pak.dao;

import java.util.List;
import java.util.Map;

import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;

public interface SearchQueryDaoInter {
	
		// 영화정보 출력
		public List<MovieUpDTO> getMov(String searchValue);

		// 영화 감상평 출력
		public List<MovieCommDTO> getMComm(String searchValue);

		// 문의게시판 출력
		public List<QnABoardDTO> getQna(String searchValue);

		// 랜덤 영화 출력
		public String rmvname();
		
		// ajax paging-----------
		// 영화정보 출력
		public List<MovieUpDTO> getMovP(PageSearchDTO psvo);

		// 영화 감상평 출력
		public List<MovieCommDTO> getMCommP(PageSearchDTO psvo);

		// 문의게시판 출력
		public List<QnABoardDTO> getQnaP(PageSearchDTO psvo);
		
		// 숫자 출력
		public List<Map<String, Integer>> getCntlist(String searchValue);

}
