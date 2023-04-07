package movie.pak.advice;

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
public class LoginAdvice {

	private String userAgent;
	
	    @Autowired
	   private LoginDAOInter loginDAOInter;
	   
	   @Around("execution(* movie.pak.controller.member.ControllerMember.logf*(..))")
	   public ModelAndView loginLogger(ProceedingJoinPoint jp) {
	      ModelAndView rpath = null;
	      String methodName = jp.getSignature().getName();
	      
	      Object[] fd = jp.getArgs();
	      for(Object e : fd) {
	         System.out.println(e.getClass().getName());
	      }
	      if(methodName.equals("logfin")) {
	         System.out.println("되나");
	         try {
	            rpath = (ModelAndView) jp.proceed(); // 로그인 메서드를 호출
	         } catch (Throwable e) {
	            e.printStackTrace();
	         }
	         // getArgs: 세션, DTO,userAgent, -3개
	         HttpSession session = (HttpSession) fd[0];
	         userAgent = (String) fd[3];
	         String reip = ((HttpServletRequest) (fd[1])).getRemoteAddr();
	         String uid= (String) session.getAttribute("sessionID");
	         System.out.println("agent=> "+ userAgent);
	         System.out.println("reip=> " + reip);
	         System.out.println("uid=> "+uid);
	         // 로그인 정보를 데이터베이스에 저장하기
	         MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
	         
	         vo.setIdn(uid);
	         vo.setStatus("login");
	         vo.setReip(reip);
	         vo.setUagent(userAgent);
	         loginDAOInter.addLoginLogging(vo);
	      }else if (methodName.equals("logfout")) {
	         System.out.println("되나 로로로로");
	         // getArgs: 세션, request - 2 개
	         HttpSession session = (HttpSession) fd[0];
	         String uid= (String) session.getAttribute("sessionID");
	         String reip = ((HttpServletRequest) (fd[1])).getRemoteAddr();
	         // 로그아웃 정보를 데이터 베이스에 저장하기
	         MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
	         vo.setIdn(uid);
	         vo.setStatus("logout");
	         vo.setReip(reip);
	         vo.setUagent(userAgent);
	         loginDAOInter.addLoginLogging(vo);
	         try {
	            rpath = (ModelAndView) jp.proceed(); //로그아웃 메서드를 호출
	         } catch (Throwable e) {
	            e.printStackTrace();
	         }
	      }
//	      try {
//	         rpath = (ModelAndView) jp.proceed();
//	      } catch (Throwable e) {
//	         e.printStackTrace();
//	      }
	      System.out.println("동작2!");
	      return rpath;
	   }
}
