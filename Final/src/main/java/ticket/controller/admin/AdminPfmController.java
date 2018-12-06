package ticket.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;

@Controller
public class AdminPfmController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminPfmController.class);

	@Autowired AdminPfmService pService;
	

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 새 공연 등록 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/registPfm", method=RequestMethod.GET)
	public void viewRistForm(Model model) {
		// 공연 분류(장르) 가져오기
		List<Genre> genreList = pService.getGenreList();
		model.addAttribute("genreList", genreList);
		
		// 관람 등급 가져오기
//		List<AgeGrade> ageList = pService.getAgeGradeList();
//		model.addAttribute("ageList", ageList);
		
		// 공연장 리스트 가져오기
//		List<Hall> hallList = pService.getHallList();
//		model.addAttribute("hallList", hallList);
		
		// 좌석정보 가져오기(ui 뿌리기 위해)
		
	
//		return "/admin/pfm/registPfm";
	}
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 장르에 따른 모든 테마 리스트 정보 가져오기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/viewTheme", method=RequestMethod.GET)
	public @ResponseBody List<Theme> getThemeList(
			Genre genre
			, Model model) {
		// 테마 리스트 가져오기
		List<Theme> themeList = pService.getThemeList(genre);
		model.addAttribute("themeList", themeList);
		
		return themeList;
	}

	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색한 이름과 일치하는 아티스트 목록 리턴
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/searchArtist", method=RequestMethod.GET)
	public @ResponseBody List<Artist> getArtistList(Artist artist) {
		List<Artist> artistList = pService.getArtistList(artist);
		
		return artistList;
	}
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/registPfm", method=RequestMethod.POST)
	public void registPfm(
			Performance pfm
			, Genre genre
			, int[] themeIdx
			) {
		// 공연 기본 정보 등록
		logger.info(pfm.toString());
		
		// 포스터 정보 등록
		
		// 장르 정보 등록
		logger.info(genre.toString());
		
		// 테마 정보 등록
		for(int i: themeIdx) {
			logger.info(String.valueOf(i));
		}
		
		// 출연진 등록
		
		// 좌석 정보 & 가격 등록
		// 공연 날짜 & 시간 등록
		// 공연 상세 정보 등록
		// 예매 상세 정보 등록
		
	}
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 수정 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/editPfm", method=RequestMethod.GET)
	public void editForm(
			Performance pfm
			,Model model
			) {
		
	}
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 수정하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/editPfm", method=RequestMethod.POST)
	public void editPfm(
			) {
		
		// 
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 삭제하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/deletePfm", method=RequestMethod.GET)
	public String deletePfm(Performance pfm) {
		
		return "redirect:/";
	}
	
	
}
