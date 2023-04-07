package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.BoxDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;

public interface MovieUpDAOInter {

	   // 1. ��ȭ ���
	   public void addMovieUp(MovieUpDTO vo);
	   // 2. ��ȭ ����Ʈ??? 
	   public List<MovieUpDTO> movieList();
	   // 3. ��ȭ �󼼺��� 
	   public MovieUpDTO detailMovie(int mno);
	   // 4. ��ȭ��� ����
	   public void delete(int mno);
	   // 5. ��ȭ���� ����
	   public void updateMovie(MovieUpDTO vo);
	   
	   // 6. ��ȭ ����Ʈ ����¡
	   public int getCnt();
	   public List<MovieUpDTO> listMovie(Map<String, Integer> map);
	   
	   //     �ı� ���� ����Ʈ ���
     public void addMovieComm(MovieCommDTO mcvo);
     public List<MovieCommDTO> listMovieComm(int no);
     
     //     �ı� ���� ����Ʈ ���� �� ����
     public void upMovieComm(MovieCommDTO mcvo);
     public int delmovie(int no) ;
     public void delcomm(int commno);
     public float mgoodAvg(int mno) ; //���� ���
     
 	// ��Ī
 	public List<MovieUpDTO> searchMv(String searchValue);
 // �������� �������� ���� DAO
    public List<Float> getratio();
	
    
    //�ڽ����ǽ� List
    public List<BoxDTO> boxList();
}
