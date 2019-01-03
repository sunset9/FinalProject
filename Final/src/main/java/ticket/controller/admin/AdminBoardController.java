package ticket.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;

import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
import ticket.dto.Notice;
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
	 * 
	 * @Method설명: 공지사항 글 상세보기
	 * @작성자: 조요한
	 */
	@RequestMapping(value="/admin/noticeview", method=RequestMethod.GET)
	public String notiView(Model model, int noticeIdx) {
//		logger.info("공지 상세");
		
		Notice noticeView = adminBoardService.getViewNoti(noticeIdx);
		Notice preNoti = adminBoardService.preNotiSer(noticeIdx);
		Notice postNoti = adminBoardService.postNotiSer(noticeIdx);
		
		model.addAttribute("noticeView", noticeView);
		model.addAttribute("preNoti", preNoti);
		model.addAttribute("postNoti", postNoti);
		
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
//		System.out.println("11111:::::"+notice.toString());
		adminBoardService.writeNoti(notice);
		
		return "redirect:/admin/noticelist";
		
	}
//	다음 에디터 이미지 첨부 팝업
	@RequestMapping(value="/admin/imagepopup")
	public String imagePopup() {
		return "/admin/notice/image";
	}
	
//	*********************************
	
	// Image 업로드(Image) Ajax
	@RequestMapping(value="/admin/singleUploadImageAjax", method=RequestMethod.POST)
	public @ResponseBody HashMap singleUploadImageAjax(@RequestParam("Filedata")MultipartFile multipartFile, HttpSession httpSession) {
		
		HashMap fileInfo = new HashMap(); // 콜백할때 파일 정보를 담을 맵
		
		// 업로드 파일 존재시
		if(multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
			
			// 확장자 제한
			String originalName = multipartFile.getOriginalFilename(); // 실제 파일명
			String originalNameExtension = originalName.substring(originalName.lastIndexOf(".")+1).toLowerCase(); // 실제 파일 확장자(소문자로 변경)
			
			if(!((originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif")) || (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")) )){
				fileInfo.put("result", -1); // 허용 확장자가 아닐 경우
				return fileInfo;
			}
		
			// 파일 크기 제한(1MB)
			long filesize = multipartFile.getSize();
			long limitFileSize = 1*1024*1024;
			if(limitFileSize < filesize){
				fileInfo.put("result", -2);
				return fileInfo;
			}
			
			// 저장경로
			String defaultPath = httpSession.getServletContext().getRealPath("/"); // 서버 기본 경로
			String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "images" + File.separator +"";

			// 저장경로 처리
			File file = new File(path);
			if(!file.exists()) { // 파일없을시 생성 (디렉토리)
				file.mkdirs();
			}
			
			// 파일 저장명 처리
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;

			// Multipart 처리			
			try {
				// 서버에 파일 저장(쓰기)				
				multipartFile.transferTo(new File(path + modifyName));
			
				// 로그
				System.out.println("image upload 정보");
				System.out.println("path" + path);
				System.out.println("originalName " + originalName );
				System.out.println("modifyName " + modifyName );
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
				System.out.println("IllegalStateException");
				
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("IOException");
			}
			
			// 콜백 - 맵에 담기			
			String imageurl = httpSession.getServletContext().getContextPath()+ "/upload/board/images/" + modifyName; // separtor 경로와 다름
			fileInfo.put("imageurl", imageurl);
			fileInfo.put("filename", modifyName);
			fileInfo.put("filesize", filesize);
			fileInfo.put("imagealign", "C");
			fileInfo.put("originalurl", imageurl);
			fileInfo.put("thumburl", imageurl);
			
			fileInfo.put("result", 1);
		}
		
		return fileInfo;
		
	}
						
//	파일 업로드 버튼 누를시 파일팝업
	@RequestMapping(value="/admin/filepopup")
	public String filePopup() {
		return "/admin/notice/file";
	}
	
	// 파일 업로드 Ajax
	@RequestMapping(value="/admin/singleUploadFileAjax", method=RequestMethod.POST)
	public @ResponseBody HashMap singleUploadFileAjax
	(@RequestParam("Filedata") MultipartFile multipartFile, HttpSession httpSession) {
		
		HashMap fileInfo = new HashMap(); // 콜백할때 파일 정보를 담을 맵

		// 업로드 파일이 존재하면
		if(multipartFile!=null&&!(multipartFile.getOriginalFilename().equals(""))) {
			
			// 파일 크기 제한 (5MB)
			long filesize = multipartFile.getSize();
			long limitFileSize = 50*1024*1024;
			if(limitFileSize<filesize) {
				fileInfo.put("result", -1);
				return fileInfo;
			}
			
			// 저장경로
			String defaultPath = httpSession.getServletContext().getRealPath("/"); // 서버기본 경로 (프로젝트폴더아님)
			String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "files" + File.separator + "";
			
			// 저장경로 처리
			File file = new File(path);
			if(!file.exists()) { // 디렉토리 존재하지 않을경우 생성
				file.mkdirs();
			}
			
			// 파일 저장명 처리 (수정된 이름 today+파일명)
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String originalName = multipartFile.getOriginalFilename(); // 파일이름
			String modifyName = today + "-" + originalName;
			
			
			// Multipart 처리
			try {
				
				// 서버에 파일 저장(쓰기)
				multipartFile.transferTo(new File(path+modifyName));
				
				
				// 로그
				System.out.println("file upload 정보");
				System.out.println("path" + path);
				System.out.println("originalName" + originalName);
				System.out.println("modifyName" + modifyName);
				
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
				System.out.println("업로드 실패 IllegalState");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("IOExep");
			}
			
			String fileMime = multipartFile.getContentType();
			
			// 콜백 - 맵에 담기
			String attachurl = httpSession.getServletContext().getContextPath() + "/upload/board/files/" + modifyName; // separator와 다름
			fileInfo.put("attachurl", attachurl); // 상대 파일 경로
			fileInfo.put("filemime", fileMime);
			fileInfo.put("filename", modifyName);
			fileInfo.put("filesize", filesize);
			fileInfo.put("result", 1);						
		}				
		return fileInfo;		
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
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 목록 보여주기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/viewinquiry", method=RequestMethod.GET)
	public String viewInquiry(
			@RequestParam(defaultValue="1") int curPage
			,Model model) {
		// 페이징 정보
		int inqTotCnt = adminBoardService.getCntInquiry();  
		Paging paging = new Paging(inqTotCnt, curPage);
		
		// 리스트 가져오기
		List<Inquiry> inqList = adminBoardService.getInquiryList(paging);
		model.addAttribute("inqList", inqList);
		
		return "/admin/inquiry/viewInquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 상세보기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/detailinquiry", method=RequestMethod.GET)
	public String detailInquiry(
			Inquiry inqParam
			,Model model) {
		
		// 상세내용 가져오기
		Inquiry inquiry = adminBoardService.getInquiry(inqParam);
		model.addAttribute("inq", inquiry);
		
		// 답변 가져오기
		InquiryAnswer inqAns = adminBoardService.getInquiryAnswer(inqParam);
		model.addAttribute("inqAns", inqAns);
		
		return "/admin/inquiry/detailInquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 글쓰기 화면 띄워주기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/writeinquiry", method=RequestMethod.GET)
	public String writeInquiry(){
		return "/admin/inquiry/writeInquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 답변 수정하는 창 띄워주기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/editreplyinquiry", method=RequestMethod.GET)
	public String viewEditReplyInquiry(Inquiry inq
			, Model model){
		InquiryAnswer inqAns = adminBoardService.getInquiryAnswer(inq);
		model.addAttribute("inqAns", inqAns);
		
		return "/admin/inquiry/editReplyInquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 답변 수정하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/editreplyinquiry", method=RequestMethod.POST)
	public String editReplyInquiry(
			InquiryAnswer inqAns
			, Model model){
		
		adminBoardService.editReplyInquiry(inqAns);
		
		return "redirect:/admin/detailinquiry?inqIdx=" + inqAns.getInqIdx();
	}
	
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 화면 띄워주기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/replyinquiry", method=RequestMethod.GET)
	public String viewReplyInquiry(
			Inquiry inq
			, Model model) {
		
		// 답변 달려고 하는 글 정보 넘겨주기
		model.addAttribute("inq", inq);
		return "/admin/inquiry/replyInquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/replyinquiry", method=RequestMethod.POST)
	public String replyInquiry(InquiryAnswer inqAnswer) {
		adminBoardService.replyInquiry(inqAnswer);
		
		return "redirect:/admin/viewinquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 이미지 업로드 처리
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/uploadinqimg", method = RequestMethod.POST)
	public void uploadInqImg(@RequestParam(name = "file") MultipartFile inqImgUpload,
			HttpServletResponse response) {
		Map<Object, Object> responseData = adminBoardService.uploadPfmImg(inqImgUpload);

		String jsonResponseData = new Gson().toJson(responseData);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(jsonResponseData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명:1:1 문의 답변 이미지 삭제 처리
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/deleteinqimg", method = RequestMethod.POST)
	public @ResponseBody void deleteInqInfoImg(String src) {
		adminBoardService.deletePfmImg(src);
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 글쓰기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/writeinquiry", method = RequestMethod.POST)
	public String writeInquiry(Inquiry inquiry) {
		adminBoardService.writeInquiry(inquiry);
		
		return "redirect:/admin/viewinquiry";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 삭제
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/deleteInquiry", method = RequestMethod.GET)
	public String deleteInquiry(Inquiry inquiry) {
		adminBoardService.deleteInquiry(inquiry);
		
		return "redirect:/admin/viewinquiry";
	}
	
	
}
