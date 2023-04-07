package movie.pak.advice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.LoginDAOInter;
import movie.pak.dto.MyLoginLoggerDTO;


@Component
@Aspect
public class LoginInfoAdvice {
	@Autowired
	private LoginDAOInter loginDAOInter;
	
	// login_info 리스트 출력 (myPage는 메서드)
	//@Around("execution(* movie.pak.controller.member.ControllerMember.mypage(..))")
	private ModelAndView loglist(ProceedingJoinPoint jp) {
		System.out.println("Advice start"); // 어드바이스 시작
		ModelAndView rpath = null; //Controller에서 객체 생성 했을 경우 어드바이스까지 영향이 옴
		try {
			rpath = (ModelAndView) jp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		Object[] fd = jp.getArgs(); // jp의 인자 가져오기
		
		HttpServletRequest request = (HttpServletRequest) fd[0];
		HttpSession session = request.getSession(false);
		String uid = (String) session.getAttribute("sessionID");
		
		//String uid = (String) fd[1]; // controller에 매개변수 String id 추가
		System.out.println("LoginAdvice id: " + uid); // 여기까진 나옴
		//String list = Integer.toString(memberInter.logingDemo(uid));
		List<MyLoginLoggerDTO> list = loginDAOInter.loginInfo(uid);
		//System.out.println("list=>"+list);
		rpath.addObject("list", list);

		return rpath;
	}
	
}
