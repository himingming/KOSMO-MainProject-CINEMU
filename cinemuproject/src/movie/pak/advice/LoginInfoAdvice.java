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
	
	// login_info ����Ʈ ��� (myPage�� �޼���)
	//@Around("execution(* movie.pak.controller.member.ControllerMember.mypage(..))")
	private ModelAndView loglist(ProceedingJoinPoint jp) {
		System.out.println("Advice start"); // �����̽� ����
		ModelAndView rpath = null; //Controller���� ��ü ���� ���� ��� �����̽����� ������ ��
		try {
			rpath = (ModelAndView) jp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		Object[] fd = jp.getArgs(); // jp�� ���� ��������
		
		HttpServletRequest request = (HttpServletRequest) fd[0];
		HttpSession session = request.getSession(false);
		String uid = (String) session.getAttribute("sessionID");
		
		//String uid = (String) fd[1]; // controller�� �Ű����� String id �߰�
		System.out.println("LoginAdvice id: " + uid); // ������� ����
		//String list = Integer.toString(memberInter.logingDemo(uid));
		List<MyLoginLoggerDTO> list = loginDAOInter.loginInfo(uid);
		//System.out.println("list=>"+list);
		rpath.addObject("list", list);

		return rpath;
	}
	
}
