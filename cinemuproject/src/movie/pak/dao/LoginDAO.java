package movie.pak.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieBuyDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.MyLoginLoggerDTO;
import movie.pak.dto.SnackUpDTO;

@Repository
public class LoginDAO implements LoginDAOInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addMember(LoginDTO vo) {
		ss.insert("login.add", vo);
		
	}

	@Override
	public int idCheck(String id) {
		int cnt = ss.selectOne("login.idChk", id);
		return cnt;
	}

	@Override
	public LoginDTO login(LoginDTO vo) {
		
		return ss.selectOne("login.login", vo);
	}

	@Override
	public void addLoginLogging(MyLoginLoggerDTO vo) {
		ss.insert("login.logger_in", vo);
		
	}

	@Override
	public LoginDTO mypage(String id) {
		
		return ss.selectOne("login.mypage", id);
	}

	@Override
	public void update(LoginDTO vo) {
		ss.update("login.myup", vo);
		
	}

	@Override
	public MovieUpDTO movielist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SnackUpDTO snacklist(SnackUpDTO skvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LoginDTO myqalist(LoginDTO lgvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delMem(String lid) {
		ss.delete("login.delmem", lid);
	}

	
	// login_log info list
	@Override
	public List<MyLoginLoggerDTO> loginInfo(String idn) {
		return ss.selectList("login.loginfo", idn);
	}

	@Override
	public int logingDemo(String idn) {
		return ss.selectOne("login.logdemo", idn);
	}

	// id 찾기
	@Override
	public String findId(LoginDTO vo) {
		 return ss.selectOne("login.findId",vo);
	}

	// 비번찾기
	@Override
	public LoginDTO findPwd(LoginDTO vo) {
		return ss.selectOne("login.findPwd",vo);
	}

    // 비번 찾기
	@Override
	public void upPwd(Map<String, String> map) {
		ss.update("login.pwdup",map);
	}

}
