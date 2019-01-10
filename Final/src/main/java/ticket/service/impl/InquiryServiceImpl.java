package ticket.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ticket.dao.face.InquiryDao;
import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
import ticket.service.face.InquiryService;
import ticket.utils.Paging;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryDao inquiryDao;
	@Autowired
	ServletContext context;
	
	@Override
	public List<Inquiry> getInqList(int userIdx, Paging paging) {
		Map map = new HashMap();
		map.put("paging", paging);
		map.put("userIdx", userIdx);
		
		return inquiryDao.selectInquiryList(map);
	}

	@Override
	public int getCntInquiry() {
		return inquiryDao.selectCntAllInq();
	}

	@Override
	public Inquiry getInquiry(Inquiry inqParam) {
		return inquiryDao.selectInquiryByInqIdx(inqParam);
	}



	@Override
	public void writeInquiry(Inquiry inquiry) {
		inquiryDao.insertInquiry(inquiry);
	}


	@Override
	public InquiryAnswer getInquiryAnswer(Inquiry inqParam) {
		return inquiryDao.selectInquiryAnswer(inqParam);
	}



	@Override
	public void deleteInquiry(Inquiry inquiry) {
		InquiryAnswer inqAns = new InquiryAnswer();
		inqAns.setInqIdx(inquiry.getInqIdx());
		// 답글 삭제
		inquiryDao.deleteReplyInquiry(inqAns);
		// 글 삭제
		inquiryDao.deleteInquiry(inquiry);		
	}

}
