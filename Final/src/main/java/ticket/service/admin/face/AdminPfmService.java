package ticket.service.admin.face;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import ticket.dto.PfmBookinfo;
import ticket.dto.PfmDateByTime;
import ticket.dto.PfmDateByTimeList;
import ticket.dto.PfmDetail;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.SeatSection;
import ticket.dto.SeatSectionList;
import ticket.dto.TabBanner;
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
	public List<MainBanner> getMBannerList();

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
	public List<TabBanner> getNewTabBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르가 콘서트인 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List<TabBanner> getConTabBanner();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르가 뮤지컬&연극인 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List<TabBanner> getMuTabBanner();

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
	 * @최종수정일: 2018.12.19
	 * @Method설명: mainban_idx를 이용해서 메인 배너 삭제하기
	 * @작성자: 김지은
	 */
	public void deleteMainBanner(int mainbanIdx);
	
	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: tabIdx를 이용해서 탭 배너 삭제하기
	 * @작성자: 김지은
	 */
	public void deleteTabBanner(int tabIdx);
	
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
	 * @최종수정일: 2018.12.17
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	public void registPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList
			, CastList castList, SeatSectionList seatSecList, PfmDateByTimeList pfmDbtList
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
	 * @Method설명: 장르/정렬순으로 필터링, 현재 등록된  공연 목록 가져오기(페이징)
	 * @작성자: 전해진
	 */
	public List<Performance> getPfmListByGenreNOrder(String genre, String order, Paging paging);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 검색어와 일치하는 공연의 총 개수 가져오기(장르 상관 없이)
	 * @작성자: 전해진
	 */
	public int getPfmSearchCnt(String keyword);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 검색어와 일치하는 공연 리스트 가져오기(페이징)
	 * @작성자: 전해진
	 */
	public List<Performance> getPfmSearchList(String keyword, Paging paging);


	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명:공연장과 공연장 사진 등록 
	 * @작성자:박주희
	 */
	public void registHall(Hall hall, MultipartFile file);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 인덱스 일치하는 공연 정보 가져오기
	 * @작성자: 전해진
	 */
	public Performance getPfm(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 테마들 가져오기
	 * @작성자: 전해진
	 */
	public List<Theme> getTheme(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 아티스트 목록들 가져오기
	 * @작성자: 전해진
	 */
	public List<Artist> getArtist(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 일정정보들 가져오기
	 * @작성자: 전해진
	 */
	public List<PfmDateByTime> getPfmdbt(Performance pfm);

	/**
	 * @param pfm 
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 상세 정보 가져오기
	 * @작성자: 전해진
	 */
	public PfmDetail getPfmDetail(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 예약 정보 가져오기
	 * @작성자: 전해진
	 */
	public PfmBookinfo getPfmBookinfo(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 포스터 정보 가져오기
	 * @작성자: 전해진
	 */
	public Poster getPoster(Performance pfm);

	/**
	 * @param seatSecList 
	 * @최종수정일: 2018.12.17
	 * @Method설명: 공연 수정하기
	 * @작성자: 전해진
	 */
	public void editPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList, CastList castList,
			SeatSectionList seatSecList, PfmDateByTimeList pfmDbtList, String pfmDetailContents, String pfmBookinfoContents);

	/**
	 * @param pfm 
	 * @최종수정일: 2018.12.17
	 * @Method설명: 특정 공연의 좌석 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<SeatSection> getSeatSectionList(Performance pfm);

	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 공연 삭제하기
	 * @작성자: 전해진
	 */
	public void deletePfm(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 최신순 공연 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> getNeweastPfm(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 전체 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTotalPfm(String search);
	
	/**
	 * @최종수정일: 2018.12.27
	 * @Method설명: 파일업로드하기(메인배너)
	 * @작성자: 김지은
	 */
	public void fileUpload(int pfmIdx, ServletContext context, MultipartFile thumbFile, MultipartFile bannerFile);
	public void saveMainbanner(MainBanner mainbanner);
	
	/**
	 * @최종수정일: 2019.01.10
	 * @Method설명: 탭 배너 최종 저장
	 * @작성자: 김지은
	 */
	public void saveTabbanner(TabBanner tabbanner);
	
	/**
	 * @최종수정일: 2019.01.09
	 * @Method설명: 메인배너 업데이트 
	 * @작성자: 김지은
	 */
	public void updateMainbanner(MainBanner mainbanner);
	
	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: 탭배너등록하기
	 * @작성자: 김지은
	 */
	public void insertTBanner(Map<String, String> tabInfo);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: pfmIdx으로 메인 배너 중복 확인하기 
	 * @작성자: 김지은
	 */
	public boolean checkPfmIdxDup(int pfmIdx);
	
	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: pfmIdx로 탭 배너 중복 확인하기 
	 * @작성자: 김지은
	 */
	public boolean checkTabbanDup(Map<String, Integer> tabInfo);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 페이징한 전체 공연 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> getAllPfmList(Paging paging);
	public List<Performance> getPfmListAlpha(Paging paging);
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 페이징한 콘서트 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> getAllConPfmList(Paging paging);
	public List<Performance> getConPfmListAlpha(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 페이징한 뮤지컬 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> getAllMuPfmList(Paging paging);
	public List<Performance> getMuPfmListAlpha(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: pfmIdx로 검색해서 pfm 정보 가져오기
	 * @작성자: 김지은
	 */
	public Performance getPfmByPfmIdx(int pfmIdx);
	
	/**
	 * @최종수정일: 2018.12.31
	 * @Method설명: 정렬 종류별 공연 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> getNewestPfmList(String mbPfmSearch);
	public List<Performance> getAlphaPfmList();
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 가장 마지막 mainban_idx 가져오기  
	 * @작성자: 김지은
	 */
	public int getLastMainbanIdx();
	
	/**
	 * @최종수정일: 2019.01.07
	 * @Method설명: 총 누적 공연수 가져오기 
	 * @작성자: 김지은
	 */
	public int getTotalPfmCnt();
	
	/**
	 * @최종수정일: 2019.01.08
	 * @Method설명: mainbanIdx로 mainbanner 정보 가져오기
	 * @작성자: 김지은
	 */
	public MainBanner getMbBymainbanIdx(int mainbanIdx);
	
	
}
