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
	public List<MyMovieDTO> movieP(Map<String, Object> map); // ��ȭ ���� ���� ���
	public int movieCnt (String id); // �� ���� ��
	public List<SnackUpDTO> snackP(Map<String, Object> map); // ���� ���� ���� ���
	public int snackCnt (String id); // �� ���� ���� ��
	public List<QnABoardDTO> qnaP(Map<String, Object> map); // Q&A ���� ���
	public int qnaPCnt (String id); // �� ���ǳ��� ��
	public List<MovieCommDTO> moviecomm(Map<String, Object> map); // ��ȭ ������
	public int mvcommCnt (String id); // �� ������ ��
	public List<MovieUpDTO> mvlP(Map<String, Object> map); // ���ƿ� ����
	public int mvlCnt (String id); // ���ƿ� �� ��
//���ƿ� ������ ��ȭ�� �帣
public List<String> liketype(String lid);
//���ƿ� ������ ��ȭ �帣�� ��ȭ �̸� 
public List<String> mtname(String lid, String genrelist);

//��ü ȸ���� ���ƿ� ������ ��ȭ�� �帣
public List<TotallikeDTO> totalliketype();
//��ü ���ƿ� ������ ��ȭ �帣�� ��ȭ �̸��� 
public List<String> tomtname(String togenrelist);


public int mbPay(String lid);//��ȭ�� �ݾ� 
public int popPay(String lid); //���� �� �ݾ�


}


