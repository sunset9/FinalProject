package ticket.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.service.admin.face.AdminBoardService;

@Controller
public class AdminBoardController {

	static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);

	@Autowired AdminBoardService adminNotiFaqService;
	
	/**
	 * 2018.12.06
	 * @Method설명: 공지사항 목록 페이징 리스트
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/list", method=RequestMethod.GET)	
	public String notiList(Model model) {
		return "/admin/notice/list";
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/view", method=RequestMethod.GET)
	public void notiView(Model model) {
		logger.info("공지 상세");
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 쓰기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/write", method=RequestMethod.GET)
	public void notiWrite() {
		logger.info("공지 글 쓰기");
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 쓰기 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/write", method=RequestMethod.POST)
	public String notiWriteProc() {
		return null;
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 수정
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/update", method=RequestMethod.GET)
	public void notiUpdate() {
		
	}

	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 수정 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/update", method=RequestMethod.POST)
	public String notiUpdateProc() {
		return null;
		
	}

	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 삭제
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/delete", method=RequestMethod.GET)
	public void notiDelete() {
		
	}


	/**
	 * 2018.12.05
	 * @Method설명:
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/delete", method=RequestMethod.POST)
	public String notiDeleteProc() {
		return null;
		
	}

	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 파일 업로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/fileupload", method=RequestMethod.GET)
	public void notiFileup() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 파일 업로드 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/fileupload", method=RequestMethod.POST)
	public String notiFileupProc() {
		return null;
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 파일 다운로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/filedownload", method=RequestMethod.GET)
	public void notiFiledownload() {
		
	}
	
	
	
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 목록 페이징 리스트
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/list", method=RequestMethod.GET)
	public void faqList(Model model) {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/view", method=RequestMethod.GET)
	public void faqView(Model model) {
		logger.info("FAQ 상세");
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 쓰기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/write", method=RequestMethod.GET)
	public void faqWrite() {
		logger.info("FAQ 글 쓰기");
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 쓰기 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqwrite", method=RequestMethod.POST)
	public String faqWriteProc() {
		return null;
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글에 달린 답변
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/answer", method=RequestMethod.GET)
	public void faqAnswer() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글에 달린 답변 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/answer", method=RequestMethod.POST)
	public String faqAnswerProc() {
		return null;
		
	}
	
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 수정
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/update", method=RequestMethod.GET)
	public void faqUpdate() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 수정 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/update", method=RequestMethod.POST)
	public String faqUpdateProc() {
		return null;
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 삭제
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/delete", method=RequestMethod.GET)
	public void faqDelete() {
			
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 삭제 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faq/delete", method=RequestMethod.POST)
	public String faqDeleteProc() {
		return null;
			
	}
	
	
	
}
