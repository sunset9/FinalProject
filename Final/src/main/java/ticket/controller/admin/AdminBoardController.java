package ticket.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ticket.dto.Notice;
import ticket.service.admin.face.AdminBoardService;
import ticket.utils.Paging;

@Controller
public class AdminBoardController {

	static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);

	@Autowired AdminBoardService adminBoardService;
	
	/**
	 * 2018.12.09
	 * @Method설명: 공지사항 목록 페이징 리스트
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticelist", method=RequestMethod.GET)	
	public String notiList(Model model,
			@RequestParam(required=false, defaultValue="0")int curPage,
			@RequestParam(required=false, defaultValue="10")int listCount,
			@RequestParam(required=false, defaultValue="10")int pageCount			
			) {
	
		Paging paging = adminBoardService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		List<Notice> list = adminBoardService.getNotiList(paging);
		model.addAttribute("noticelist", list);
		
		return "/admin/notice/list";
	}
	
	
	
	/**
	 * 2018.12.10
	 * @Method설명: 공지사항 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticeview", method=RequestMethod.GET)
	public String notiView(Model model, int noticeIdx) {
//		logger.info("공지 상세");
		
		Notice noticeView = adminBoardService.getViewNoti(noticeIdx);
		
		model.addAttribute("noticeView", noticeView);
		return "/admin/notice/view";
		
	}
	
		
	/**
	 * 2018.12.11
	 * @Method설명: 공지사항 글 쓰기, 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticewrite", method=RequestMethod.GET)
	public String notiWrite() {
		logger.info("공지 글쓰기 폼");
		
		return "/admin/notice/write";
				
	}
	
	
	@RequestMapping(value="/admin/noticewrite", method=RequestMethod.POST)
	public String notiWriteProc(HttpSession session, Notice notice) {
		
//		logger.info("공지 글 쓰기 처리");
		logger.info(notice.toString());
		
		adminBoardService.writeNoti(notice);
		
		return "redirect:/admin/noticelist";
		
	}
	
	
	/**
	 * 2018.12.12
	 * @Method설명: 공지사항 글 수정 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticeupdate", method=RequestMethod.GET)
	public String notiUpdate(Notice notice, Model model) {
		
		logger.info("공지수정폼");
		
		
		notice = adminBoardService.noticeUpdateView(notice);
//		System.out.println("update"+notice);
		model.addAttribute("update", notice);
		
		return "/admin/notice/update";
		
	}

	@RequestMapping(value="/admin/noticeupdate", method=RequestMethod.POST)
	public String notiUpdateProc(Notice notice) {
		logger.info("공지 수정 처리");
		logger.info(notice.toString());
		
		adminBoardService.upNoti(notice);
	
		return "redirect:/admin/noticelist";
		
	}
	
	
	/**
	 * 2018.12.11
	 * @Method설명: 공지사항 글 삭제
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticedelete")
	public String notiDelete(Notice deleteNotice) {
		logger.info("공지사항 글 삭제");
		logger.info(deleteNotice.toString());
		
		adminBoardService.delNoti(deleteNotice);
		return "redirect:/admin/noticelist";
		
	}
	
	

	

	
	/**
	 * 2018.12.13
	 * @Method설명: 공지사항 파일 업로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticefileupload", method=RequestMethod.GET)
	public String notiFileup() {
		return null;
		
	}
	
	/**
	 * 2018.12.13
	 * @Method설명: 공지사항 파일 업로드 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticefileupload", method=RequestMethod.POST)
	public String notiFileupProc() {
		return null;
		
	}
	
	/**
	 * 2018.12.13
	 * @Method설명: 공지사항 파일 다운로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticefiledownload", method=RequestMethod.GET)
	public void notiFiledownload() {
		
	}
	
	
	
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 목록 페이징 리스트
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqlist", method=RequestMethod.GET)
	public String faqList(Model model) {
		logger.info("faqlist");

		return "/admin/faq/list";
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqview", method=RequestMethod.GET)
	public void faqView(Model model) {
		logger.info("FAQ 상세");
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 쓰기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqwrite", method=RequestMethod.GET)
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
	@RequestMapping(value="/admin/faqanswer", method=RequestMethod.GET)
	public void faqAnswer() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글에 달린 답변 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqanswer", method=RequestMethod.POST)
	public String faqAnswerProc() {
		return null;
		
	}
	
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 수정
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqupdate", method=RequestMethod.GET)
	public void faqUpdate() {
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 수정 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqupdate", method=RequestMethod.POST)
	public String faqUpdateProc() {
		return null;
		
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 삭제
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqdelete", method=RequestMethod.GET)
	public void faqDelete() {
			
	}
	
	/**
	 * 2018.12.05
	 * @Method설명: FAQ 글 삭제 처리
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/faqdelete", method=RequestMethod.POST)
	public String faqDeleteProc() {
		return null;
			
	}
	
	
	
}
