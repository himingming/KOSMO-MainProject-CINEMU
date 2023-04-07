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

//���̵� ã��
public String findId(LoginDTO vo);

//��й�ȣ ã��
public LoginDTO findPwd(LoginDTO vo); 

//��й�ȣ ����
public void upPwd(Map<String, String> map);

//ȸ�� Ż��
public void delMem(String lid);

//�α� ���� ����Ʈ ���  
public List<MyLoginLoggerDTO> loginInfo(String idn);
public int logingDemo(String idn);

}
