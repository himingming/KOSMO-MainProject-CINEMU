package movie.pak.dao.movie;

import movie.pak.dto.MovieLikeDTO;

public interface MovieLikeDAOInter {
	public void addLike(MovieLikeDTO mlvo); //insert
	public void delLike(MovieLikeDTO mlvo); //delete
	public int mylikeCnt(MovieLikeDTO mlvo); //좋아요 수 반환 좋아요 기록이 있다면 1 없으면 0 반환
	public int ClikeCnt(MovieLikeDTO mlvo);
	public int likeCnt(MovieLikeDTO mlvo);
	
}
