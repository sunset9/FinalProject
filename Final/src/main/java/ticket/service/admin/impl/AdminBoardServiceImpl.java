package ticket.service.admin.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.AdminBoardDao;
import ticket.dto.Faq;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.service.admin.face.AdminBoardService;
import ticket.utils.Paging;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{

	@Autowired AdminBoardDao adminBoardDao;
	
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
	public void getViewNoti(Notice notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void writeNoti() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updaNoti() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleNoti() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void inseNotiFile(NoticeFile noticeFile) {
		// TODO Auto-generated method stub
		
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
	public void updaFaq() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleFaq() {
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













	
}
