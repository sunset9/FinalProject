package ticket.service.admin.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.CastList;
import ticket.dto.CategoryCon;
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.Theme;

public interface AdminPfmService {

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 리스트 불러오기
	 * @작성자: 김지은
	 */
	public List getMBannerList();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록/수정시, 공연 검색값 받아오기
	 * @작성자: 김지은
	 */
	public Performance getPfmInfo();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록/수정시, 배너랑 썸네일 정보 받아오기
	 * @작성자: 김지은
	 */
	public MainBanner getMBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 최종 등록하기
	 * @작성자: 김지은
	 */
	public void registMBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 새로 등록된(New) 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List getNewTabBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르가 콘서트인 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List getConTabBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르가 뮤지컬&연극인 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List getMuTabBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘의 총 예매수 불러오기
	 * @작성자: 김지은
	 */
	public int getTodayBook();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘의 예매취소수 불러오기
	 * @작성자: 김지은
	 */
	public int getTodayCancel();

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 오늘 등록된 모든 공연의 수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayAllPfm();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘 등록된 콘서트 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayCon();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘 등록된 뮤지컬&연극 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayMu();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘 등록된 가족&아동 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayFam();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 장르 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Genre> getGenreList();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 장르에 따른 모든 테마 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Theme> getThemeList(Genre genre);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 관람 등급 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<AgeGrade> getAgeGradeList();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 일치하는 이름의 아티스트 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Artist> getArtistList(Artist artist);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 공연장 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<Hall> getHallList();

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	public void registPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList, CastList castList);

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 포스터 이미지 파일 업로드/ 저장된 포스터 정보 반환
	 * @작성자: 전해진
	 */
	public Poster uploadPoster(MultipartFile posterUpload);

	/**
	 * @최종수정일: 2018.12.08
	 * @Method설명:콘서트 모달안에배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getModalListCon();

	/**
	 * @최종수정일: 2018.12.08
	 * @Method설명:콘서트 배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getListCon();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 가족아동 배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getListFam();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 뮤지컬 배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getListMu();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 콘서트 배너 추가
	 * @작성자:박주희
	 */
	public void addCon(CategoryCon con);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 가족&아동 공연 배너 추가
	 * @작성자:박주희
	 */
	public void addFam(CategoryFam fam);

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명:test 중입니다.
	 * @작성자:박주희
	 */
	public void addFamPoster(ServletContext context, MultipartFile file);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:뮤지컬공연 배너 추가
	 * @작성자:박주희
	 */
	public void addMu(CategoryMu mu);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(콘서트) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeCon(CategoryCon con);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(가족&아동) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeFam(CategoryCon fam);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(뮤지컬) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeMu(CategoryCon mu);

}
