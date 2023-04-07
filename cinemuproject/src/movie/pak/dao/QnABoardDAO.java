package movie.pak.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.QnACommDTO;

@Repository
public class QnABoardDAO implements QnABoardDAOInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addBoard(QnABoardDTO vo) {
		ss.insert("qaboard.add", vo);
		
	}

	@Override
	public List<QnABoardDTO> getSearchList(PageSearchDTO pvo) {
		//search&page
	List<QnABoardDTO> list = ss.selectList("qaboard.listSearchPage", pvo);
			return list;
	}

	@Override
	public int getCnt(PageSearchDTO pvo) {
		int cnt = ss.selectOne("qaboard.searchCount", pvo);
		return cnt;
	}

	@Override
	public QnABoardDTO detailBoard(int no) {
		QnABoardDTO vo = ss.selectOne("qaboard.qadetail",no);
		return vo;
	}

	@Override
	public void delete(int no) {
		ss.delete("qaboard.qadelete", no);
		
	}

	@Override
	public void upBoard(QnABoardDTO vo) {
		ss.update("qaboard.qaupdate", vo);
		
	}
// ´ñ±Û
	@Override
	public void addQAComm(QnACommDTO qcvo) {
		ss.insert("qaboard.addcomm", qcvo);
		
	}

	@Override
	public List<QnACommDTO> listQAComm(int no) {
		List<QnACommDTO> list = ss.selectList("qaboard.listcomm", no);
		return list;
	}

	@Override
	public void upQaComm(QnACommDTO qcvo) {
		ss.update("qaboard.upcomm", qcvo);
		
	}

	@Override
	public void delQAComm(int no) {
		ss.delete("qaboard.delcomm", no);
		
	}

	@Override
	public int delNo(int no) {
		return ss.selectOne("qaboard.delno", no);
	}
	
	@Override
	public LoginDTO linkdEmail(int no) {
		return ss.selectOne("qaboard.linkedmail", no);
	}

}
