package movie.pak.dao;

import java.util.List;
import java.util.Map;

import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;

public interface SearchQueryDaoInter {
	
		// ��ȭ���� ���
		public List<MovieUpDTO> getMov(String searchValue);

		// ��ȭ ������ ���
		public List<MovieCommDTO> getMComm(String searchValue);

		// ���ǰԽ��� ���
		public List<QnABoardDTO> getQna(String searchValue);

		// ���� ��ȭ ���
		public String rmvname();
		
		// ajax paging-----------
		// ��ȭ���� ���
		public List<MovieUpDTO> getMovP(PageSearchDTO psvo);

		// ��ȭ ������ ���
		public List<MovieCommDTO> getMCommP(PageSearchDTO psvo);

		// ���ǰԽ��� ���
		public List<QnABoardDTO> getQnaP(PageSearchDTO psvo);
		
		// ���� ���
		public List<Map<String, Integer>> getCntlist(String searchValue);

}
