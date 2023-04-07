package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.BoxDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;

public interface MovieUpDAOInter {

	   // 1. 영화 등록
	   public void addMovieUp(MovieUpDTO vo);
	   // 2. 영화 리스트??? 
	   public List<MovieUpDTO> movieList();
	   // 3. 영화 상세보기 
	   public MovieUpDTO detailMovie(int mno);
	   // 4. 영화등록 삭제
	   public void delete(int mno);
	   // 5. 영화정보 수정
	   public void updateMovie(MovieUpDTO vo);
	   
	   // 6. 영화 리스트 페이징
	   public int getCnt();
	   public List<MovieUpDTO> listMovie(Map<String, Integer> map);
	   
	   //     후기 평점 리스트 출력
     public void addMovieComm(MovieCommDTO mcvo);
     public List<MovieCommDTO> listMovieComm(int no);
     
     //     후기 평점 리스트 수정 및 삭제
     public void upMovieComm(MovieCommDTO mcvo);
     public int delmovie(int no) ;
     public void delcomm(int commno);
     public float mgoodAvg(int mno) ; //평점 출력
     
 	// 서칭
 	public List<MovieUpDTO> searchMv(String searchValue);
 // 예매율을 가져오기 위한 DAO
    public List<Float> getratio();
	
    
    //박스오피스 List
    public List<BoxDTO> boxList();
}
