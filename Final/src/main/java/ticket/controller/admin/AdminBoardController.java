package ticket.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.service.admin.face.AdminBoardService;
import ticket.utils.Paging;

@Controller
public class AdminBoardController {

	static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);

	@Autowired AdminBoardService adminBoardService;
	@Autowired ServletContext context;
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
	public String notiWriteProc(HttpSession session, Notice notice, HttpServletRequest request) {
		
//		logger.info("공지 글 쓰기 처리");
		logger.info(notice.toString());
		System.out.println("11111:::::"+notice.toString());
		adminBoardService.writeNoti(notice);
		
		return "redirect:/admin/noticelist";
		
	}
	
//	다음 에디터 이미지 첨부 팝업
	@RequestMapping(value="/admin/imagepopup")
	public String imagePopup() {
		return "/admin/notice/image";
	}
	
	// 다음 에디터 단일 파일 업로드 Ajax
	@RequestMapping(value="/admin/sigleuploadimageajax", method=RequestMethod.POST)
	public @ResponseBody HashMap sigleUploadImageAjax
		(@RequestParam("Filedata") MultipartFile multipartFile, HttpSession httpSession) {

		HashMap fileInfo = new HashMap(); // CallBack할 때 이미지 정보를 담을 Map
		
		// 업로드 파일이 존재하면
		if(multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {

			// 확장자 제한
			String originalName = multipartFile.getOriginalFilename(); // 실제 파일 명
			String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase(); // 실제파일 확장자 (소문자변경) 

			if( !( (originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif")) || (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")) ) ){
				 fileInfo.put("result",-1); // 허용 확장자가 아닐 경우
				 return fileInfo;			
			}
			
			// 파일크기제한 (1MB) 
			long filesize = multipartFile.getSize(); // 파일크기 
			long limitFileSize = 1*1024*1024; // 1MB 
			if(limitFileSize < filesize){ // 제한보다 파일크기가 클 경우
			 fileInfo.put("result",-2);
			 return fileInfo; 
			}
			
			// 저장경로 
			String defaultPath = httpSession.getServletContext().getRealPath("/"); // 서버기본경로 (프로젝트 폴더 아님) 
			String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "images" + File.separator + ""; 
			
			// 저장경로 처리 
			File file = new File(path); 
			if(!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성 
			file.mkdirs(); 
			}
		
			// 파일 저장명 처리 (20150702091941-fd8-db619e6040d5.확장자) 
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
			String today= formatter.format(new Date()); 
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension; 

			// Multipart 처리 
			try { 
			// 서버에 파일 저장 (쓰기)
			 multipartFile.transferTo(new File(path + modifyName));

			 // 로그
			 System.out.println("** upload 정보 **");
			 System.out.println("** path : " + path + " **");
			 System.out.println("** originalName : " + originalName + " **");
			 System.out.println("** modifyName : " + modifyName + " **"); 
		 } catch (Exception e) { 
			e.printStackTrace();
			 System.out.println("이미지파일업로드 실패 - singleUploadImageAjax");
			}

			 // CallBack - Map에 담기
			 String imageurl = httpSession.getServletContext().getContextPath() + "/upload/board/images/" + modifyName; // separator와는 다름!
			 fileInfo.put("imageurl", imageurl); // 상대파일경로(사이즈변환이나 변형된 파일) 
			 fileInfo.put("filename", modifyName); // 파일명
			 fileInfo.put("filesize", filesize); // 파일사이즈
			 fileInfo.put("imagealign", "C"); // 이미지정렬(C:center)
			 fileInfo.put("originalurl", imageurl); // 실제파일경로
			 fileInfo.put("thumburl", imageurl); // 썸네일파일경로(사이즈변환이나 변형된 파일) 
			 
			 fileInfo.put("result", 1); // -1, -2를 제외한 아무거나 싣어도 됨 }			 
			}
		
		return fileInfo;	// @ResponseBody 어노테이션을 사용하여 Map을 JSON형태로 반환 
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
	 * @Method설명: 공지사항 파일 업로드 (합치기전 테스트)
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticefileupload", method=RequestMethod.GET)
	public String notiFileup() {
		logger.info("업로드폼");
		return "/admin/notice/fileup";
		
	}
	
//@RequestParam(value="n") String name => n이란 값을 name에 저장
	@RequestMapping(value="/admin/noticefileupload", method=RequestMethod.POST)
	public String notiFileupProc(
			@RequestParam(value="file") MultipartFile fileupload) {
		// 업로드 파일 정보 전달
		adminBoardService.filesave(context, fileupload); 
		
		return "redirect:/admin/noticefilelist";
		
	}

	
	@RequestMapping(value="/admin/noticefilelist")
	public String filelist(Model model) {
		
		List<NoticeFile> filelist = adminBoardService.fileList();
		
		model.addAttribute("filelist", filelist);
		
		return "/admin/notice/filelist";
		
	}
	
	
	/**
	 * 2018.12.13
	 * @Method설명: 공지사항 파일 다운로드
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticefiledownload", method=RequestMethod.GET)
	public ModelAndView notiFiledownload(ModelAndView mav, int notiFileIdx) {
		
		NoticeFile file = adminBoardService.getFile(notiFileIdx);
		logger.info(file.toString());
		mav.setViewName("down"); // 뷰이름
		mav.addObject("downFile", file);
		return mav;
		
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
