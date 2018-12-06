package ticket.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminNotiFaqController {

	
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 목록 페이징 리스트
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/list")	
	public void notiList(Model model) {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/view")
	public void notiView(Model model) {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 쓰기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/write", method=RequestMethod.GET)
	public void notiWrite() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 쓰기 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/write", method=RequestMethod.POST)
	public void notiWriteProc() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 수정
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/update", method=RequestMethod.GET)
	public void notiUpdate() {
		
	}

	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 수정 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/update", method=RequestMethod.POST)
	public void notiUpdateProc() {
		
	}

	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 글 삭제
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/delete", method=RequestMethod.GET)
	public void notiDelete() {
		
	}


	/**
	 * 2018.12.05
	 * @Method설명:
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/delete", method=RequestMethod.POST)
	public void notiDeleteProc() {
		
	}

	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 파일 업로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/fileupload", method=RequestMethod.GET)
	public void notiFileup() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 파일 업로드 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/fileupload", method=RequestMethod.POST)
	public void notiFileupProc() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: 공지사항 파일 다운로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="notice/filedownload", method=RequestMethod.GET)
	public void notiFiledownload() {
		
	}
	
	
	
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 목록 페이징 리스트
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/list")
	public void faqList(Model model) {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/view")
	public void faqView(Model model) {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 쓰기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/write")
	public void faqWrite() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 쓰기 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/write")
	public void faqWriteProc() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글에 달린 답변
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/answer")
	public void faqAnswer() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글에 달린 답변 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/answer")
	public void faqAnswerProc() {
		
	}
	
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 수정
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/update")
	public void faqUpdate() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 수정 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/update")
	public void faqUpdateProc() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 삭제
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/delete")
	public void faqDelete() {
			
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 삭제 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="faq/delete")
	public void faqDeleteProc() {
			
	}
	
	
	
}
