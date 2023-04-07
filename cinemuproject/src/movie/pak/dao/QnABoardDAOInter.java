package movie.pak.dao;

import java.util.List;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.QnACommDTO;

public interface QnABoardDAOInter {

	public void addBoard(QnABoardDTO vo);
	public List<QnABoardDTO> getSearchList(PageSearchDTO pvo);
	public int getCnt(PageSearchDTO pvo);
	
	public QnABoardDTO detailBoard(int no);
	public void delete(int no);
	public void upBoard(QnABoardDTO vo);
	
	public void addQAComm(QnACommDTO qcvo);
	public List<QnACommDTO> listQAComm(int no);
	// ��� ����
	public void upQaComm(QnACommDTO qcvo);
	// ��� ����
	public void delQAComm(int no);
	public int delNo(int no);
	
	// �̸��� ����
	public LoginDTO linkdEmail(int no);
}
