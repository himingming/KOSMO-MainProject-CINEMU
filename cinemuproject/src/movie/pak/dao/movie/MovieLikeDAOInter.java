package movie.pak.dao.movie;

import movie.pak.dto.MovieLikeDTO;

public interface MovieLikeDAOInter {
	public void addLike(MovieLikeDTO mlvo); //insert
	public void delLike(MovieLikeDTO mlvo); //delete
	public int mylikeCnt(MovieLikeDTO mlvo); //���ƿ� �� ��ȯ ���ƿ� ����� �ִٸ� 1 ������ 0 ��ȯ
	public int ClikeCnt(MovieLikeDTO mlvo);
	public int likeCnt(MovieLikeDTO mlvo);
	
}
