package movie.pak.controller.mapmail;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mail")
public class EmailController {
	static final String emailFromRecipient = "modnar159@naver.com";

	@Autowired
	private JavaMailSenderImpl mailSender;

	@GetMapping(value = "/emailForm")
	public String emailForm() {
		return "mail/emailForm";
	}
	@GetMapping(value = "/emailForm2")
	public String emailForm2() {
		return "mail/emailForm2";
	}

	@RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
	public ModelAndView sendEmailToClient(HttpServletRequest request) {
		String emailSubject = request.getParameter("subject");
		String emailMessage = request.getParameter("message");
		String emailToRecipient = request.getParameter("mailTo");
		// 메일 전송을 시작하는 메서드에게 데이터를 입력
		mailSender.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMsgHelperObj.setTo(emailToRecipient);
				mimeMsgHelperObj.setFrom(emailFromRecipient);
				mimeMsgHelperObj.setText(emailMessage);
				mimeMsgHelperObj.setSubject(emailSubject);
			}
		});
		System.out.println("\n 메일 전송 성공 \n");
	//	ModelAndView mav = new ModelAndView("success", "messageObj", "메일 전송 성공");
		ModelAndView mav = new ModelAndView("mail/emailsend", "messageObj", "메일 전송 성공");
		return mav;
	}
}
