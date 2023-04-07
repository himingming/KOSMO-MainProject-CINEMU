package movie.pak.advice;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class AllException {

   @ExceptionHandler(Exception.class)
   public ModelAndView handlerException(Exception e) {
      ModelAndView mav = new ModelAndView("error/paramException");
      mav.addObject("emsg", "잠시 후 다시 시도해주세요");
      mav.addObject("exception", e);
      return mav;

   }
   
}