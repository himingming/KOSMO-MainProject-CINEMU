package movie.pak.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.LoginDAOInter;
import movie.pak.dao.MyPageDAOInter;
import movie.pak.dto.LoginDTO;
import movie.pak.dto.MovieUpDTO;
import movie.pak.dto.SnackUpDTO;

@Controller
@RequestMapping(value = "/member")
public class ControllerMember {
// ����Ϸ��� MemberDao�� MemberInter�� �����Ͽ� (implement)memberinter�� autowirde���ش�.

	@Autowired
	private LoginDAOInter loginDaoInter;

	@Autowired
	private MyPageDAOInter myPageInter;

	@Autowired
	private JavaMailSenderImpl mailSender;

	// ȸ������ ������ �̵�
	@GetMapping(value = "/joinForm")
	public String joinForm() {
		return "loginJoin/joinForm";

	}

	// �α��� ������ �̵�
	@GetMapping(value = "/loginForm")
	public String loginForm() {
		return "loginJoin/loginForm";

	}

	// ȸ������
	@PostMapping(value = "/join")
	public String memberIn(LoginDTO vo) {
		loginDaoInter.addMember(vo);

		return "loginJoin/loginForm";
	}

	// ���̵�üũ
	@RequestMapping(value = "/idchk")
	public ModelAndView idChk(String lid) {
		ModelAndView mav = new ModelAndView("loginJoin/idchk");
		int cnt = loginDaoInter.idCheck(lid);
		mav.addObject("cnt", cnt);
		return mav;
	}

	@PostMapping(value = "/login")
	public ModelAndView logfin(HttpSession session, HttpServletRequest requset, LoginDTO vo,
			@RequestHeader("User-Agent") String userAgent) {
		System.out.println("�޼��� ���� �׽�Ʈ");
		ModelAndView mav = new ModelAndView("redirect:/main");
		LoginDTO dto = loginDaoInter.login(vo);
		if (dto == null) {
			mav.setViewName("error/paramException");
			mav.addObject("emsg", "�α��� �����Դϴ�.");
		} else {
			System.out.println("login=>" + dto.getLid());
			session.setAttribute("sessionName", dto.getLname());
			session.setAttribute("sessionID", dto.getLid());
		}
		return mav;
	}

	@GetMapping(value = "/logout")
	public ModelAndView logfout(HttpSession session, HttpServletRequest request) {
		System.out.println("�α׾ƿ� �ǳ���?");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("sessionName");
		session.removeAttribute("sessionID");
		mav.setViewName("redirect:/main");
		return mav;
	}

	// mypage
	@GetMapping(value = "/mypage")
	public ModelAndView mypage(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		ModelAndView mav = new ModelAndView();
		if (id != null) {
			LoginDTO v = loginDaoInter.mypage(id);
			request.setAttribute("v", v);
			int mbpay = myPageInter.mbPay(id);
			int poppay = myPageInter.popPay(id);		
			request.setAttribute("poppay", poppay);
			request.setAttribute("mbpay", mbpay);

			mav.setViewName("loginJoin/myPage");
			// return "loginJoin/myPage";
		} else {
			// return "index";
			mav.setViewName("index");
		}
		return mav;
	}

	// ���̵� ��� ã�� �� �̵�
	@GetMapping(value = "/findId")
	public String findId() {
		return "loginJoin/findId";
	}

	@PostMapping(value = "/searchId")
	public ModelAndView searchId(LoginDTO vo) {
		ModelAndView mav = new ModelAndView("loginJoin/findId");
		String id = loginDaoInter.findId(vo);
		if (id != null) {
			mav.addObject("fid", 1);
			mav.addObject("id", id);
			System.out.println("id2" + id);
		} else {
			mav.addObject("fid", 0);
		}

		return mav;
	}

	// ��й�ȣ ã�� �� �̵�
	@GetMapping(value = "/findPwd")
	public String findPwd() {
		return "loginJoin/findPwd";
	}

	@PostMapping(value = "/sendRnum")
	public ModelAndView sendRnum(LoginDTO vo, HttpServletRequest request, HttpServletResponse response) {

		String email = (String) request.getParameter("lemail");
		String id = (String) request.getParameter("lid");
		Random r = new Random();
		LoginDTO v = loginDaoInter.findPwd(vo);
		String lid = v.getLid();

		int rnum = r.nextInt(999999); // ������������

		if (v.getLid().equals(id)) {
			System.out.println("173�� �� : " + id);
			if (v.getLemail().equals(email)) {
				String emailToRecipient = v.getLemail();
				String emailSubject = "[cinemu] " + lid + " ���� ��й�ȣ ã�� ������ȣ�Դϴ�.";
				String emailMessage = lid + " ���� ������ȣ : [ " + rnum + " ] �Դϴ�." + "\n" + "�Է�â�� ��Ȯ�� �Է� �� �������ֽñ� �ٶ��ϴ�.";
				String emailFromRecipient = "modnar159@naver.com";

				try {
					mailSender.send(new MimeMessagePreparator() {
						public void prepare(MimeMessage mimeMessage) throws Exception {
							MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
							mimeMsgHelperObj.setTo(emailToRecipient);
							mimeMsgHelperObj.setFrom(emailFromRecipient);
							mimeMsgHelperObj.setText(emailMessage);
							mimeMsgHelperObj.setSubject(emailSubject);
						}
					});
				} catch (Exception e) {
					ModelAndView mav = new ModelAndView("loginJoin/findPwd");
					String error = "�����Ͻ� id �Ǵ� email�� ������ ã�� �� �����ϴ�";
					mav.addObject("error", error);
				}

				ModelAndView mav = new ModelAndView("loginJoin/chkRnum");
				mav.addObject("rnum", rnum);
				mav.addObject("lid", lid);
				mav.addObject("lemail", emailToRecipient);

				return mav;

			} else {
				ModelAndView mav = new ModelAndView("loginJoin/findPwd");
				String error = "�����Ͻ� id �Ǵ� email�� ������ ã�� �� �����ϴ�";
				mav.addObject("error", error);
				return mav;
			}
		} else {
			ModelAndView mav = new ModelAndView("loginJoin/findPwd");
			String error = "�����Ͻ� id �Ǵ� email�� ������ ã�� �� �����ϴ�";
			mav.addObject("error", error);
			return mav;
		}

	}

	// ��� ���� �� �̵�
	@RequestMapping(value = "/upPwdForm")
	public ModelAndView upPwdForm(String lid) {
		ModelAndView mav = new ModelAndView("loginJoin/upPwd");
		mav.addObject("lid", lid);

		return mav;
	}

	// ��� ����
	@RequestMapping(value = "/upPwd")
	public ModelAndView upPwd(String lid, String lpwd) {
		ModelAndView mav = new ModelAndView("redirect:/member/loginForm");
		Map<String, String> map = new HashedMap();
		map.put("lid", lid);
		map.put("lpwd", lpwd);
		loginDaoInter.upPwd(map);
		mav.addObject("map", map);
		return mav;

	}

	@RequestMapping(value = "/update")
	public String upload(Model m, LoginDTO vo, HttpServletRequest request) {

		String img_path = "resources\\imgfiles"; // �̹��� ���
		String r_path = request.getRealPath("/");

		String oriFn = vo.getMfile().getOriginalFilename(); // ���� �̸�

		long size = vo.getMfile().getSize(); // �뷮
		String contentType = vo.getMfile().getContentType(); // Ÿ��

		StringBuffer path = new StringBuffer(); // �ӽ� �����
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);


		File f = new File(path.toString()); // ���� ��ü ����
		try {
			vo.getMfile().transferTo(f);
			vo.setLimg(oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		loginDaoInter.update(vo);

		return "redirect:/member/mypage";
	}

	@GetMapping(value = "/upform")
	public ModelAndView upForm(LoginDTO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("loginJoin/joinUpdateForm");
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("sessionID");
		vo = loginDaoInter.mypage(id);
		mav.addObject("v", vo);
		return mav;
	}


	// ȸ�� Ż�� ���� ��Ʈ�ѷ�
	@RequestMapping(value = "/delmem")
	public String delmember(String lid, HttpSession session) {
		loginDaoInter.delMem(lid);
		// ����� ���� ����
		session.removeAttribute("sessionID");
		return "redirect:/main";
	}

}