package movie.pak.controller.qa;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import movie.pak.dao.QnABoardDAOInter;
import movie.pak.dto.LoginDTO;
import movie.pak.dto.PageSearchDTO;
import movie.pak.dto.QnABoardDTO;
import movie.pak.dto.QnACommDTO;

@Controller
@RequestMapping(value = "/qaboard")
public class QnAController {

	@Autowired
	private QnABoardDAOInter qnABoardDAOInter;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// -----------------------------------------------
		// Page처리를 위한 속성
			private int nowPage = 1; // 현재 페이지 값 -> 메뉴 페이지와 연동되는 변수
			private int nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block당 5개  배열 생성
			private int totalRecord; // 총 게시물 수 .Dao로 부터 받음
			private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
			private int pagePerBlock = 5; // 한 블럭당 보여질 페이지 수
			private int totalPage;  // 전체 페이지 수 => totalRecord/numPerPage
			private int totalBlock; // 전체 블럭수
			private int beginPerPage; // 각 페이지별 시작 게시물의 index값
			private int endPerPage; // 각 페이지별 마지막 게시물의 index값
		// --------------------------------------------------
	
	@GetMapping(value = "/qaform")
	public ModelAndView qnaForm() {
		ModelAndView mav = new ModelAndView("qna/qnaForm");
		return mav;
	}
	@PostMapping(value = "/qainsert")
	public String qnaIn(QnABoardDTO vo) {
		qnABoardDAOInter.addBoard(vo);
		return "redirect:/qaboard/qalist";
	}
	
	@RequestMapping(value = "/qalist")
public String listBoard(Model model, String cPage,String searchType,String searchValue) {
		
		PageSearchDTO vo = new PageSearchDTO();
		vo.setSearchType(searchType);
		vo.setSearchValue(searchValue);
		
		// --------------Page 처리하기
		// 총 게시물 수 가져오기 => 실행결과 TotalRecord :21
		totalRecord = qnABoardDAOInter.getCnt(vo);
		
		// 전체 페이지 출력해보기 => totalPage :2.1
		// double totalPage2 = totalRecord/(double)numPerPage;
		
		//  무조건 올림 => 2.1 => 3
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
	
		// totalBlock = totalPage/5;
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		
		// 현재 페이지를 요청할 때 파라미터로 현재 페이지값을 받는다. 1 ~~~~~~~ n
		String s_page = cPage;
		if (s_page != null) {
			nowPage = Integer.parseInt(s_page);
		}

		// nowPage의 값에서 SQL문의 #{begin} , #{end} 연산
		beginPerPage = (nowPage - 1) * numPerPage + 1; // 11
		endPerPage = (beginPerPage - 1) + numPerPage; //20
		
		// 데이터 전송해보기
		//Map<String, Integer> map = new HashMap<String, Integer>();
		//map.put("begin", beginPerPage);
		//map.put("end", endPerPage);
		vo.setBegin(beginPerPage);
		vo.setEnd(endPerPage);
		List<QnABoardDTO> list = qnABoardDAOInter.getSearchList(vo);
		
		// 페이지 블록안에 페이지 반복 시키기 위한 startPage , endPage를 구해서
				// view로 전달해야 함.
				int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1; // 
				int endPage = startPage + pagePerBlock - 1;
				// endPage의 연산의 범위가 우리가 구한 totalPage값 미만이라면
				// totalPage의 값으로 대입시킨다.
				if (endPage > totalPage) {
					endPage = totalPage;
				}
		// View에 forward로 전송할 데이터		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pagePerBlock", pagePerBlock); // 설정된 5
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("searchType", vo.getSearchType());
		model.addAttribute("searchValue", vo.getSearchValue());
		// --------------------------
		model.addAttribute("totalRecord", totalRecord);
		return "qna/qnaList";
	}
	
	@GetMapping(value = "/qadetail")
    public ModelAndView detail(int no) {
		ModelAndView mav = new ModelAndView("qna/qnaDetail");
		System.out.println(no);
		QnABoardDTO vo = qnABoardDAOInter.detailBoard(no);
		// 댓글-------------
		List<QnACommDTO> listcomm = qnABoardDAOInter.listQAComm(no);
		mav.addObject("listcomm", listcomm);
		// 댓글-------------
		
		System.out.println(vo);
		mav.addObject("vo", vo);
		return mav;
	}
	@GetMapping(value = "/qadelete")
	public String deleteBoard(int no) {
	qnABoardDAOInter.delete(no);
	return "redirect:/qaboard/qalist";
	
	}
	@GetMapping(value = "/qaupform")
	public ModelAndView upForm(int no) {
		ModelAndView mav = new ModelAndView("qna/qnaUpdate");
		QnABoardDTO vo = qnABoardDAOInter.detailBoard(no);
		mav.addObject("vo", vo);
		return mav;
		
	}
	@RequestMapping(value = "/qaupdate")
	public String updateForm(QnABoardDTO vo) {
		qnABoardDAOInter.upBoard(vo);
		return "redirect:/qaboard/qadetail?no="+vo.getNo();
	}
	
	// 댓글
	@RequestMapping(value = "/qcomminsert2")
	public ModelAndView addQaComm2(QnACommDTO qcvo) {
		qnABoardDAOInter.addQAComm(qcvo);
		ModelAndView mav = new ModelAndView("redirect:/qaboard/qadetail?no="+qcvo.getMcode());
		return mav;
	}
	
	// 댓글+이메일
	@RequestMapping(value = "/qcomminsert")
	public ModelAndView addQaComm(QnACommDTO qcvo) {
		qnABoardDAOInter.addQAComm(qcvo);
		int no = qcvo.getMcode();
		ModelAndView mav = new ModelAndView("redirect:/qaboard/qadetail?no=" + no);
		// --------------

		String id = qcvo.getMwriter();

//		if (id.equals("admin")) {
		if (id.equals("xman")) {
			// QnA에 작성한 데이터 불러오기1. 글쓴이 로그인정보
			// loginVO에 qnavo를 리스트로 getter/setter설정
			LoginDTO lvo = qnABoardDAOInter.linkdEmail(no);

			// QnA에 작성한 데이터 불러오기2. QnA게시글 정보 리스트에 담기
			List<QnABoardDTO> qlist = lvo.getQnaboard();
			// QnA 제목
			String suject = qlist.get(0).getSubject();
			// QnA 내용
			String content = qlist.get(0).getContent();
			// admin메일주소
			String emailFromRecipient = "modnar159@naver.com";
			// 이메일 제목
			String emailSubject = lvo.getLname() + "님의 문의에 대한 담당자의 답변이 등록되었습니다.";
			// QnA에 작성한 글
			String bar = "\n-----------------------------------\n";
			// admin메일주소
			String aa = "\n\n\n 문의하신 내용 " +  bar + "제목 :\t" + suject + "\n" + content+"\n\n\n";
			String emailMessage = "답변 \n" + qcvo.getMcontent() + aa;
			String emailToRecipient = lvo.getLemail();

			mailSender.send(new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					mimeMsgHelperObj.setTo(emailToRecipient);
					mimeMsgHelperObj.setFrom(emailFromRecipient);
					mimeMsgHelperObj.setText(emailMessage);
					mimeMsgHelperObj.setSubject(emailSubject);
				}
			});
		}
		// --------------

		return mav;
	}
	
	
	@RequestMapping(value = "/upcomm")
	public String upComm(QnACommDTO qcvo) {
		int num= qcvo.getMcode();
		qnABoardDAOInter.upQaComm(qcvo);
		return "redirect:/qaboard/qadetail?no="+num;
	}
	@RequestMapping(value = "/delcomm")
	public String delComm(int no) {
		int num = qnABoardDAOInter.delNo(no);
		qnABoardDAOInter.delQAComm(no);
		return "redirect:/qaboard/qadetail?no="+num;
	}
}
