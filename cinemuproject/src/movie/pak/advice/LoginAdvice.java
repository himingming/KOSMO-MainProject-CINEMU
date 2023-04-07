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
	         System.out.println("�ǳ�");
	         try {
	            rpath = (ModelAndView) jp.proceed(); // �α��� �޼��带 ȣ��
	         } catch (Throwable e) {
	            e.printStackTrace();
	         }
	         // getArgs: ����, DTO,userAgent, -3��
	         HttpSession session = (HttpSession) fd[0];
	         userAgent = (String) fd[3];
	         String reip = ((HttpServletRequest) (fd[1])).getRemoteAddr();
	         String uid= (String) session.getAttribute("sessionID");
	         System.out.println("agent=> "+ userAgent);
	         System.out.println("reip=> " + reip);
	         System.out.println("uid=> "+uid);
	         // �α��� ������ �����ͺ��̽��� �����ϱ�
	         MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
	         
	         vo.setIdn(uid);
	         vo.setStatus("login");
	         vo.setReip(reip);
	         vo.setUagent(userAgent);
	         loginDAOInter.addLoginLogging(vo);
	      }else if (methodName.equals("logfout")) {
	         System.out.println("�ǳ� �ηηη�");
	         // getArgs: ����, request - 2 ��
	         HttpSession session = (HttpSession) fd[0];
	         String uid= (String) session.getAttribute("sessionID");
	         String reip = ((HttpServletRequest) (fd[1])).getRemoteAddr();
	         // �α׾ƿ� ������ ������ ���̽��� �����ϱ�
	         MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
	         vo.setIdn(uid);
	         vo.setStatus("logout");
	         vo.setReip(reip);
	         vo.setUagent(userAgent);
	         loginDAOInter.addLoginLogging(vo);
	         try {
	            rpath = (ModelAndView) jp.proceed(); //�α׾ƿ� �޼��带 ȣ��
	         } catch (Throwable e) {
	            e.printStackTrace();
	         }
	      }
//	      try {
//	         rpath = (ModelAndView) jp.proceed();
//	      } catch (Throwable e) {
//	         e.printStackTrace();
//	      }
	      System.out.println("����2!");
	      return rpath;
	   }
}
