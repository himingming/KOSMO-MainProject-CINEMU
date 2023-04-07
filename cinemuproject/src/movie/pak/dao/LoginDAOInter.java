package movie.pak.dao;

import java.util.List;
import java.util.Map;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.MyLoginLoggerDTO;
import movie.pak.dto.SnackUpDTO;

public interface LoginDAOInter {
public void addMember(LoginDTO vo);
public int idCheck(String id);

public LoginDTO login(LoginDTO vo);
public void addLoginLogging(MyLoginLoggerDTO vo);
public LoginDTO mypage(String id);
public void update(LoginDTO vo);
public MovieUpDTO movielist(String id);
public SnackUpDTO snacklist(SnackUpDTO skvo);
public LoginDTO myqalist(LoginDTO lgvo);

//아이디 찾기
public String findId(LoginDTO vo);

//비밀번호 찾기
public LoginDTO findPwd(LoginDTO vo); 

//비밀번호 수정
public void upPwd(Map<String, String> map);

//회원 탈퇴
public void delMem(String lid);

//로깅 정보 리스트 출력  
public List<MyLoginLoggerDTO> loginInfo(String idn);
public int logingDemo(String idn);

}
