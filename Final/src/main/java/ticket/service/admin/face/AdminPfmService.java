package ticket.service.admin.face;

import java.util.List;
import java.util.Map;

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
import ticket.dto.PfmDateByTimeList;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.utils.Paging;

/**
 * @author PIAOZHUZI
 *
 */
/**
 * @author PIAOZHUZI
 *
 */
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
	 * @최종수정일: 2018.12.09
	 * @Method설명: 1:1 문의 미답변수 가져오기
	 * @작성자: 김지은
	 */
	public int getUnanswered();
	
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
	public List<Artist> getArtistList(Artist artist, Paging paging);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 공연장 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<Hall> getHallList();

	/**
	 * @param pfmBookinfoContents 
	 * @최종수정일: 2018.12.07
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	public void registPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList
			, CastList castList, PfmDateByTimeList pfmDbtList
			, String pfmDetailContents, String pfmBookinfoContents);

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 포스터 이미지 파일 업로드/ 저장된 포스터 정보 반환
	 * @작성자: 전해진
	 */
	public Poster uploadPoster(MultipartFile posterUpload);

	/**
	 * @param paging 
	 * @최종수정일: 2018.12.08
	 * @Method설명:콘서트 모달안에배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getModalListCon(Paging paging);


	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 뮤지컬 모달 안에 배너 리스트 
	 * @작성자:박주희
	 */
	public List<Poster> getModalListMu(Paging paging);
	

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 가족 모달 안에 배너 리스트 
	 * @작성자:박주희
	 */
	public List<Poster> getModalListFam(Paging paging);

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명:콘서트 모달 안에 들어갈 배너 갯수 
	 * @작성자:박주희
	 */
	public int getModalListConCnt();

	
	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 뮤지컬 모달안에 들어갈 배너 갯수 
	 * @작성자: 박주희
	 */
	public int getModalListMuCnt();

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 가족&아동 모달안에 들어갈 배너 갯수 
	 * @작성자:박주희
	 */
	public int getModalListFamCnt();
	
	/**
	 * @최종수정일: 2018.12.08
	 * @Method설명:콘서트 배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getListCon();

	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 검색결과를 불러옴 
	 * @작성자: 박주희
	 */
	public List<Poster> getSearchListForCon(String name);
	

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 검색결과를 불러옴 (뮤지컬)
	 * @작성자: 박주희
	 */
	public List<Poster> getSearchListForMu(String name);
	
	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 검색결과를 불러옴(가족&아동)
	 * @작성자:박주희
	 */
	public List<Poster> getSearchListForFam(String searchPoster);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 가족아동 배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getListFam();
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명:뮤지컬 모달안에배너 리스트
	 * @작성자:박주희
	 */
	public List<Poster> getModalListMu();

	
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
	public void removeFam(CategoryFam fam);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(뮤지컬) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeMu(CategoryMu mu);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명:포스터로 등록된 배너 개수 
	 * @작성자:박주희
	 */
	public int getListAllCntCon();
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명:포스터로 등록된 배너 개수 
	 * @작성자:박주희
	 */
	public int getListAllCntMu();
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명:포스터로 등록된 배너 개수 
	 * @작성자:박주희
	 */
	public int getListAllCntFam();
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연 등록 시 이미지(상세정보, 예약정보) 업로드
	 * @작성자: 전해진
	 */
	public Map<Object, Object> uploadPfmImg(MultipartFile pfmImgUpload);

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: Froala에 업로드한 이미지 삭제
	 * @작성자: 전해진
	 */
	public void deletePfmImg(String src);

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 검색결과와 일치하는 아티스트 수 가져오기
	 * @작성자: 전해진
	 */
	public int getArtistSearchCnt(Artist artist);

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 장르로 필터링, 현재 등록된  공연 개수 가져오기
	 * @작성자: 전해진
	 */
	public int getPfmCntByGenre(String genre);
	
	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 장르로 필터링, 현재 등록된  공연 목록 가져오기(페이징)
	 * @작성자: 전해진
	 */
	public List<Performance> getPfmListByGenre(String genre, Paging paging);



}
