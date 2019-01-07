package ticket.service.admin.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ticket.dao.face.AdminBoardDao;
import ticket.dto.Faq;
import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.service.admin.face.AdminBoardService;
import ticket.utils.Paging;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{

	@Autowired AdminBoardDao adminBoardDao;
	@Autowired ServletContext context;
	
	// 공지 전체 조회 리스트
	@Override
	public List getNotiList(Paging paging) {
			
		return adminBoardDao.selectNotiList(paging);
	}
 
	// 게시글 전체 수
	@Override
	public int selectCountAll() {
		return adminBoardDao.selectCntAll();		
		
	}
	
	// 페이징 정보
	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {

		int totalCount = this.selectCountAll();
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);
		
		return paging;
	}
	
	
 
	@Override
	public Notice getViewNoti(int noticeIdx) {

		return adminBoardDao.selectNotiView(noticeIdx);
		
	}

	
	@Override
	public void writeNoti(Notice notice) {
	
		adminBoardDao.insertNoti(notice);
	
	}


	@Override
	public Notice noticeUpdateView(Notice notice) {
		
		return adminBoardDao.selectNoticeBynoticeIdx(notice);
	}

	
	@Override
	public Notice upNoti(Notice notice) {

		adminBoardDao.updateNoti(notice);
		return notice;
	}
	

	@Override
	public void delNoti(Notice deleteNotice) {

		adminBoardDao.deleteNoti(deleteNotice);
		
	}

	

	@Override
	public Notice preNotiSer(int noticeIdx) {	
		return adminBoardDao.preNoti(noticeIdx);
	}

	@Override
	public Notice postNotiSer(int noticeIdx) {
		return adminBoardDao.postNoti(noticeIdx);
	}




	@Override
	public void filesave(ServletContext context, MultipartFile file) {
		// UUID, 고유식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로
		String stored = context.getRealPath("upload");
		
		// 저장될 파일의 이름
		String name = file.getOriginalFilename()+"_"+uId;
		
		// 파일 객체
		File dest = new File(stored, name);
		
		// 파일 저장(업로드)
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		NoticeFile noticeFile = new NoticeFile();
		
		noticeFile.setOriginName(file.getOriginalFilename());
		noticeFile.setStoredName(dest.getName());

		adminBoardDao.insertNotiFile(noticeFile);
	}

	@Override
	public List fileList() {
		return adminBoardDao.selectNotiFileAll();
	}

	@Override
	public NoticeFile getFile(int notiFileIdx) {
		return adminBoardDao.selectByNotiFileIdx(notiFileIdx);
	}

	
	
	
	

	@Override
	public List getFaqList(Faq faq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeFaq() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void upFaq() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delFaq() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void writeFaqAnswer() {
		// TODO Auto-generated method stub
		
	}

	// 현재 페이지 얻기
	@Override
	public int getCurPage(HttpServletRequest req) {
		//요청 파라미터 받기
		String curPage = req.getParameter("curPage");

		// null이나 ""이 아니면 int로 리턴
		if (curPage != null && !"".equals(curPage)) {
			return Integer.parseInt(curPage);
		}

		// null이나 "" 이면 0으로 반환
		return 0;
	}

	@Override
	public List<Inquiry> getInquiryList(Paging paging) {
		return adminBoardDao.selectInquiryList(paging);
	}

	@Override
	public int getCntInquiry() {
		return adminBoardDao.selectCntAllInq();
	}

	@Override
	public Inquiry getInquiry(Inquiry inqParam) {
		return adminBoardDao.selectInquiryByInqIdx(inqParam);
	}

	@Override
	public Map<Object, Object> uploadPfmImg(MultipartFile inqImgUpload) {
		// UUID, 고유 식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로
		String stored = context.getRealPath("resources/image");

		// 저장될 파일의 이름
		String oriName = inqImgUpload.getOriginalFilename();
		String name = oriName + "_" + uId;

		// 파일객체
		File dest = new File(stored, name);

		// 파일 저장(업로드)
		try {
			inqImgUpload.transferTo(dest);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String linkName = "http://localhost:8088/resources/image/" + name;

		Map<Object, Object> responseData = new HashMap<Object, Object>();
		responseData.put("link", linkName);

		// 저장 경로 반환
		return responseData;
	}

	@Override
	public void deletePfmImg(String src) {
		// 파일경로
		String filePath = context.getRealPath("upload/story") + "\\";
		// 파일이름 구하기
		String[] fileName = src.split("/");
		// 삭제할 파일 경로 + 파일이름
		filePath += fileName[5];

		File f = new File(filePath); // 파일 객체생성
		if (f.exists())
			f.delete(); // 파일이 존재하면 파일을 삭제한다.
	}

	@Override
	public void writeInquiry(Inquiry inquiry) {
		adminBoardDao.insertInquiry(inquiry);
	}

	@Override
	public void replyInquiry(InquiryAnswer inqAnswer) {
		// 답변 삽입
		adminBoardDao.insertReplyInquiry(inqAnswer);
		// 답변 처리 상태 변경
		adminBoardDao.updateInqReplyStatus(inqAnswer);
	}

	@Override
	public InquiryAnswer getInquiryAnswer(Inquiry inqParam) {
		return adminBoardDao.selectInquiryAnswer(inqParam);
	}

	@Override
	public void editReplyInquiry(InquiryAnswer inqAnswer) {
		// 이전 답변 삭제
		int res = adminBoardDao.deleteReplyInquiry(inqAnswer);
		// 답변 등록
		if(res > 0) adminBoardDao.insertReplyInquiry(inqAnswer);
		
	}

	@Override
	public void deleteInquiry(Inquiry inquiry) {
		InquiryAnswer inqAns = new InquiryAnswer();
		inqAns.setInqIdx(inquiry.getInqIdx());
		// 답글 삭제
		adminBoardDao.deleteReplyInquiry(inqAns);
		// 글 삭제
		adminBoardDao.deleteInquiry(inquiry);
	}


	
}
