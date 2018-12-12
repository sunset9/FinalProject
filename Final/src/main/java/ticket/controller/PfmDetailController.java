package ticket.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.service.face.PfmDetailService;

@Controller
public class PfmDetailController {
	@Autowired PfmDetailService detailService;
	
	private static final Logger logger = LoggerFactory.getLogger(PfmDetailController.class);

	/**
	 * 최종수정일: 2018.12.04
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
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 상세 내용 관련 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/pfmdetail", method=RequestMethod.POST)
	public void pfmdetailProc() {
		
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
