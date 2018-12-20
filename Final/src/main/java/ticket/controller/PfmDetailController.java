package ticket.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.Artist;
import ticket.dto.Expectation;
import ticket.dto.Performance;
import ticket.dto.PfmDetail;
import ticket.dto.Poster;
import ticket.dto.User;
import ticket.service.face.PfmDetailService;

@Controller
public class PfmDetailController {
	@Autowired PfmDetailService detailService;
	
	private static final Logger logger = LoggerFactory.getLogger(PfmDetailController.class);

	/**
	 * 최종수정일: 2018.12.19
	 * @Method설명: 공연 상세 클릭시 첫 페이지
	 * 				상세정보, 기대평, 관람후기, 공연장정보, 예매안내(TEXT)
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/pfmdetail", method=RequestMethod.GET)
	public void pfmdetail(
			Model model
			, Performance pfm
		) {
		// 선택한 이미지의 포스터 출력해주기
		Poster posterList = detailService.getChoicePfmDetail(pfm);
		model.addAttribute("posterList", posterList);
		
		// 공연 정보 불러오기
		Performance pfmInfoList = detailService.getPfmInfo(pfm);
		model.addAttribute("pfmInfoList", pfmInfoList);
		
		//	출연진 정보 불러오기
		List<Artist> castList = detailService.getCastInfo(pfm);
		model.addAttribute("castList", castList);
		
		//	상세 정보
		PfmDetail detailList = detailService.pfmDetailInfo(pfm);
		model.addAttribute("detailList", detailList);
		
		// 기대평 리스트 출력해주기
		List<Expectation> expecList = detailService.getExpectationList(pfm);
		model.addAttribute("expecList", expecList);
		
		//	작성자 리스트 출력
		List<User> expecUserList = detailService.getExpectationUserList(pfm);
		model.addAttribute("expecUserList", expecUserList);
	}

	/**
	 * 최종수정일: 2018.12.20
	 * @Method설명: 기대평 작성 / 출력
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/pfmdetail/expectation", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> expectation(
			String expContent
			, String pfmIdx
			, String userIdx
			, Performance pfm
		) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		logger.info(expContent);
		logger.info(pfmIdx);
		logger.info(userIdx);
		
		// 기대평 작성
		detailService.getExpectationInsert(expContent, pfmIdx, userIdx);
		
		// 기대평 리스트 출력해주기
		List<Expectation> expecList = detailService.getExpectationList(pfm);
		map.put("expecList", expecList);
		
		//	작성자 리스트 출력
		List<User> expecUserList = detailService.getExpectationUserList(pfm);
		map.put("expecUserList", expecUserList);
		
		// 기대평 삭제
//		detailService.getDelExpectation(expIdx);
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 오픈소식 상세페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/opendetail", method=RequestMethod.GET)
	public void opendetail() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 오픈 상세 관련 정보 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/opendetail", method=RequestMethod.POST)
	public void opendetailProc() {
		
	}
	
}
