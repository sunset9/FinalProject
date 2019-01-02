package ticket.service.admin.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ticket.dao.face.CategoryConDao;
import ticket.dao.face.CategoryFamDao;
import ticket.dao.face.CategoryMuDao;
import ticket.dao.face.HallDao;
import ticket.dao.face.HallFileDao;
import ticket.dao.face.PfmDao;
import ticket.dao.face.PosterDao;
import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Cast;
import ticket.dto.CastList;
import ticket.dto.CategoryCon;
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.Genre;
import ticket.dto.GenreEnum;
import ticket.dto.Hall;
import ticket.dto.HallFile;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.PfmBookinfo;
import ticket.dto.PfmDateByTime;
import ticket.dto.PfmDateByTimeList;
import ticket.dto.PfmDetail;
import ticket.dto.PfmTheme;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.SeatSection;
import ticket.dto.SeatSectionList;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;
import ticket.dto.TabBanner;
import ticket.utils.Paging;

@Service
public class AdminPfmServiceImpl implements AdminPfmService {
	@Autowired
	ServletContext context;
	@Autowired
	PfmDao pDao;
	@Autowired
	CategoryConDao conDao;
	@Autowired
	CategoryMuDao muDao;
	@Autowired
	CategoryFamDao famDao;
	@Autowired
	PosterDao infoDao;
	@Autowired
	HallDao hallDao;
	@Autowired
	HallFileDao hallFileDao;

	@Override
	public List<MainBanner> getMBannerList() {
		return pDao.selectMainBanner();
	}

	@Override
	public Performance getPfmInfo() {
		return null;
	}

	@Override
	public MainBanner getMBanner() {
		return null;
	}

	@Override
	public void registMBanner() {
		// pfmDao.insertMBanner()
	}

	@Override
	public List<TabBanner> getNewTabBanner() {
		return pDao.selectNewTabBanner();
	}

	@Override
	public List<TabBanner> getConTabBanner() {
		//콘서트 탭배너 목록 가져오기
		return pDao.selectConTabBanner();
	}

	@Override
	public List<TabBanner> getMuTabBanner() {
		//뮤지컬&연극 탭배너 목록 가져오기
		return pDao.selectMuTabBanner();
	}

	@Override
	public int getTodayBook() {
		// 오늘의 예매수 불러오기
		return pDao.selectTodayBook();
	}

	@Override
	public int getTodayCancel() {
		// 오늘의 예매취소수 불러오기
		return pDao.selectTodayCancel();
	}

	@Override
	public int getTodayCon() {
		// 오늘 등록된 콘서트의 수 불러오기
		return pDao.selectTodayCon();
	}

	@Override
	public int getTodayMu() {

		return pDao.selectTodayMu();
	}

	@Override
	public int getTodayFam() {

		return pDao.selectTodayFam();
	}

	@Override
	public List<Genre> getGenreList() {
		return pDao.selectAllGenre();
	}

	@Override
	public List<Theme> getThemeList(Genre genre) {
		return pDao.selectAllTheme(genre);
	}

	@Override
	public List<AgeGrade> getAgeGradeList() {
		return pDao.selectAllAgeGrade();
	}

	@Override
	public List<Artist> getArtistList(Artist artist, Paging paging) {
		return pDao.selectArtistByName(artist, paging);
	}

	@Override
	public List<Hall> getHallList() {
		return pDao.selectAllHall();
	}

	@Override
	public void registPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList
			, CastList castList, SeatSectionList seatSecList, PfmDateByTimeList pfmDbtList
			, String pfmDetailContents, String pfmBookinfoContents) {
		int pfmIdx = 0;
		// 공연 기본 정보 등록
		pDao.insertPfm(pfm);
		// 저장한 공연 인덱스
		pfmIdx = pfm.getPfmIdx();

		// 포스터 업로드
		if (posterUpload.getSize() != 0) {
			Poster poster = uploadPoster(posterUpload);
			poster.setPfmIdx(pfmIdx); // 공연 idx 지정
			// 포스터 업로드 정보 DB 저장
			pDao.insertPoster(poster);
		}

		// 테마들 등록
		if (themeList.getThmList() != null) {
			for (PfmTheme thm : themeList.getThmList()) {
				if (thm.getThemeIdx() != 0) { // theme가 존재하는 경우에 insert
					// 공연 idx 지정
					thm.setPfmIdx(pfmIdx);
					pDao.insertPfmTheme(thm);
				}
			}
		}

		// 출연진들 등록
		if (castList.getCastList() != null) {
			for (Cast cast : castList.getCastList()) {
				if (cast.getArtistIdx() != 0) { // artist 정보가 존재하는 경우에 insert
					// 공연 idx 지정
					cast.setPfmIdx(pfmIdx);
					pDao.insertCast(cast);
				}
			}
		}

		// 좌석 정보 등록
		if(seatSecList.getSeatSecList() != null) {
			for(SeatSection seatSec : seatSecList.getSeatSecList()) {
				if(seatSec.getOriSecName() != "") {
					// 공연 idx 지정
					seatSec.setPfmIdx(pfmIdx);
					seatSec.setHallIdx(pfm.getHallIdx());
					pDao.insertSeatSection(seatSec);
				}
			}
		}
		
		// 공연 일정들(날짜, 시간) 등록
		if (pfmDbtList.getPfmDbtList() != null) {
			for (PfmDateByTime pfmDbt : pfmDbtList.getPfmDbtList()) {
				if (pfmDbt.getPfmDate() != null && pfmDbt.getPfmTime() != null) { // 일정 정보가 존재하는 경우에 insert
					// 공연 idx 지정
					pfmDbt.setPfmIdx(pfmIdx);
					pDao.insertPfmDbt(pfmDbt);
				}
			}
		}

		// 공연 상세정보 등록
		if (!"".equals(pfmDetailContents)) {
			PfmDetail pfmDetail = new PfmDetail();
			pfmDetail.setPfmIdx(pfmIdx);
			pfmDetail.setContents(pfmDetailContents);
			pDao.insertPfmDetail(pfmDetail);
		}

		// 공연 예약정보 등록
		if (!"".equals(pfmBookinfoContents)) {
			PfmBookinfo pfmBookinfo = new PfmBookinfo();
			pfmBookinfo.setPfmIdx(pfmIdx);
			pfmBookinfo.setContents(pfmBookinfoContents);
			pDao.insertPfmBookinfo(pfmBookinfo);
		}
	}

	public Poster uploadPoster(MultipartFile posterUpload) {
		// UUID, 고유 식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로
		String stored = context.getRealPath("resources/image");

		// 저장될 파일의 이름
		String oriName = posterUpload.getOriginalFilename();
		String name = oriName + "_" + uId;

		// 파일객체
		File dest = new File(stored, name);

		// 파일 저장(업로드)
		try {
			posterUpload.transferTo(dest);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 반환할 포스터 객체 생성
		Poster poster = new Poster();
		poster.setOriginName(oriName);
		poster.setStoredName(name);

		return poster;
	}

	@Override
	public List<Poster> getListCon() {
		return infoDao.selectBypfmIdx();
	}

	@Override
	public List<Poster> getListFam() {
		return infoDao.selectBypfmIdxFam();
	}

	@Override
	public List<Poster> getListMu() {
		// TODO Auto-generated method stub
		return infoDao.selectBypfmIdxMu();
	}

	@Override
	public void addCon(CategoryCon con) {
		conDao.insert(con);
	}

	@Override
	public void addFam(CategoryFam fam) {
		famDao.insert(fam);

	}

	@Override
	public void addMu(CategoryMu mu) {
		muDao.insert(mu);

	}

	@Override
	public void removeCon(CategoryCon con) {
		conDao.delete(con);
	}

	@Override
	public void removeFam(CategoryFam fam) {
		famDao.delete(fam);
	}

	@Override
	public void removeMu(CategoryMu mu) {
		muDao.delete(mu);
	}

	@Override
	public void addFamPoster(ServletContext context, MultipartFile file) {

		// UUID, 고유 식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로
		String stored = context.getRealPath("upload");

		// 저장될 파일의 이름
		String name = file.getOriginalFilename() + "_" + uId;

		// 파일객체
		File dest = new File(stored, name);

		// 파일 저장(업로드)
		try {
			file.transferTo(dest);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Poster info = new Poster();
		info.setOriginName(file.getOriginalFilename());
		info.setStoredName(dest.getName());
		infoDao.insert(info);
	}

	@Override
	public int getTodayAllPfm() {
		// 오늘 등록된 모든 공연의 수 가져오기
		return pDao.selectTodayAllPfm();
	}

	@Override
	public List<Poster> getModalListCon(Paging paging) {

		// 장르로 선택된(콘서트) 리스트 가져오기
		return infoDao.selectBygenreIdx(1, paging);
	}

	@Override
	public List<Poster> getModalListMu(Paging paging) {
		return infoDao.selectBygenreIdx(2, paging);
	}

	@Override
	public List<Poster> getModalListFam(Paging paging) {
		return infoDao.selectBygenreIdx(3, paging);
	}

	@Override
	public int getUnanswered() {
		// 1:1 문의 미답변수 가져오기
		return pDao.selectUnanswered();
	}

	@Override
	public Map<Object, Object> uploadPfmImg(MultipartFile pfmImgUpload) {
		// UUID, 고유 식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로
		String stored = context.getRealPath("resources/image");

		// 저장될 파일의 이름
		String oriName = pfmImgUpload.getOriginalFilename();
		String name = oriName + "_" + uId;

		// 파일객체
		File dest = new File(stored, name);

		// 파일 저장(업로드)
		try {
			pfmImgUpload.transferTo(dest);

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

	public List<Poster> getSearchListForCon(String name) {
		return infoDao.selectPosterByName(name);
	}

	@Override
	public List<Poster> getSearchListForMu(String name) {
		return infoDao.selectPosterByNameMu(name);
	}

	@Override
	public List<Poster> getSearchListForFam(String searchPoster) {
		return infoDao.selectPosterByNameFam(searchPoster);
	}

	@Override
	public List<Poster> getModalListMu() {
		return infoDao.selectBygenreIdx(2, null);
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
	public int getArtistSearchCnt(Artist artist) {
		return pDao.selectCntArtist(artist);
	}

	@Override
	public int getModalListConCnt() {
		return infoDao.selectCntBygenreIdx(1); // 장르 1번 콘서트
	}

	@Override

	public int getModalListMuCnt() {
		return infoDao.selectCntBygenreIdx(2);
	}

	@Override
	public int getModalListFamCnt() {
		return infoDao.selectCntBygenreIdx(3);
	}

	@Override
	public int getListAllCntCon() {
		return conDao.selectAllCnt();
	}

	@Override
	public int getListAllCntMu() {
		return muDao.selectAllCnt();
	}

	@Override
	public int getListAllCntFam() {
		return famDao.selectAllCnt();
	}

	@Override
	public int getPfmCntByGenre(String genre) {
		// 검색하려는 장르 인덱스 
		int genreIdx = GenreEnum.valueOf(genre).getIdx();

		return pDao.selectAllCntPfmByGenre(genreIdx);
	}

	@Override
	public List<Performance> getPfmListByGenreNOrder(String genre, String order, Paging paging) {
		// 검색하려는 장르 인덱스 
		int genreIdx = GenreEnum.valueOf(genre).getIdx();

		// 반환할 결과 리스트
		List<Performance> resPfmList = new ArrayList<>();
		
		// 최신순으로 가져오는 경우
		if("LATEST".equals(order)) {
			// 장르 일치하는 공연 목록 가져옴(페이징만 신경써서 조회)
			return resPfmList = pDao.selectPfmByGenre(genreIdx, paging);
			
		// 예매순으로 가져오는 경우
		} else if("RANK".equals(order)){
			// 오늘 날짜
			Date today = new Date();
			
			// 0. '조회 구간' 설정
			// 시작 구간: 30일 전
			Date periodS = new Date(today.getTime()); 
			periodS.setTime((long) (periodS.getTime() - (double)30 * 24 * 60 * 60 * 1000));
			// 끝 구간: 오늘
			Date periodE = today; 
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			// Date -> String 변환
			String startStr = dateFormat.format(periodS);
			String endStr = dateFormat.format(periodE);
			
			// 1. 예매율 구하려는 공연 목록 가져옴
			List<Performance> pfmList = pDao.selectPfmListByPeriod(startStr, endStr, genreIdx);
			
			// 2. 공연 리스트 반복문으로 돌면서, 예매율 계산할 구간 구하기
			for(Performance pfm : pfmList) {
				// 최종 조회 범위
				Date startDate = periodS;
				Date endDate = periodE;
				
				// '티켓' 시작일이 '조회 구간' 시작일 보다 느린 경우, '계산 구간' 시작일 = '티켓' 시작일
				if(pfm.getTicketStart().getTime() - startDate.getTime() >= 0) {
					startDate = pfm.getTicketStart();
				}
				// '조회 구간' 마지막일이 '티켓' 종료일 보다 느린 경우, '계산 구간' 마지막일 = '조회 구간' 마지막일
				if(endDate.getTime() - pfm.getTicketEnd().getTime() >= 0) {
					endDate = pfm.getTicketEnd();
				}
				
				// 3.1 해당 공연의 총 좌석 수 구하기
				int totalSeatCnt = pDao.selectCntAllSeatByHallIdx(pfm);
				System.out.println(totalSeatCnt);
				
				System.out.println(startDate);
				System.out.println(endDate);
				
				// 3.2 계산 구간에 예매한 좌석 수 구하기
				int bookSeatCnt = pDao.selectCntBookSeatBypfmIdx(pfm, startDate, endDate);
				System.out.println(bookSeatCnt);
				
				// 3.3 해당 공연의 공연 횟수 구하기 
				int pfmDbtCnt = pDao.selectPfmDbtCntByPfmIdx(pfm, startDate, endDate);
				System.out.println(pfmDbtCnt);
				
				// 3.4 예매율 계산
				float bookRate = 0;
				if(bookSeatCnt != 0) {
					bookRate = (((float)bookSeatCnt/pfmDbtCnt) / totalSeatCnt) * 100;
				}
				System.out.println("예매율:" + bookRate);
				
				// 예매율 필드에 삽입
				pfm.setBookingRate(bookRate);
				
				// 예매순으로 결과 리스트에 삽입
				for(int i = 0; i<resPfmList.size(); i++) {
					if(pfm.getBookingRate() >= resPfmList.get(i).getBookingRate()) {
						resPfmList.add(i, pfm);
						break;
					}
				}
				
				// 첫 번째 요소인 경우 무조건 삽입
				if(resPfmList.size() == 0) {
					resPfmList.add(pfm);
				}
				
			} // end for
			return resPfmList;
		}
		
		return null;
	}

	@Override
	public int getPfmSearchCnt(String keyword) {
		return pDao.selectCntPfmSearch(keyword);
	}

	@Override
	public List<Performance> getPfmSearchList(String keyword, Paging paging) {
		return pDao.selectPfmSearch(keyword, paging);
	}

	public void registHall(Hall hall, MultipartFile file) {
		// TODO Auto-generated method stub
		int hallIdx = 0;
		hallDao.insert(hall);

		hallIdx = hall.getHallIdx();
		
		if(file.getSize()!=0) {
			HallFile hallFile = uploadHallPic(file);
			hallFile.setHallIdx(hallIdx);
			hallFileDao.insert(hallFile);
		}
	}

	public HallFile uploadHallPic(MultipartFile file) {

		// UUID, 고유 식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로
		String stored = context.getRealPath("resources/image");

		// 저장될 파일의 이름
		String oriName = file.getOriginalFilename();
		String name = oriName + "_" + uId;

		// 파일객체
		File dest = new File(stored, name);

		// 파일 저장(업로드)
		try {
			file.transferTo(dest);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 반환할 공연장 사진파일 객체 생성
		HallFile hallFile = new HallFile();

		hallFile.setOriginName(oriName);
		hallFile.setStoredName(name);

		return hallFile;

	}

	@Override
	public Performance getPfm(Performance pfm) {
		return pDao.selectPfmByIdx(pfm);
	}

	@Override
	public List<Theme> getTheme(Performance pfm) {
		return pDao.selectThemeByPfmIdx(pfm);
	}

	@Override
	public List<Artist> getArtist(Performance pfm) {
		return pDao.selectArtistByPfmIdx(pfm);
	}

	@Override
	public List<PfmDateByTime> getPfmdbt(Performance pfm) {
		return pDao.selectPfmdbtByPfmIdx(pfm);
	}

	@Override
	public PfmDetail getPfmDetail(Performance pfm) {
		return pDao.selectPfmDetailByPfmIdx(pfm);
	}

	@Override
	public PfmBookinfo getPfmBookinfo(Performance pfm) {
		return pDao.selectPfmBookinfoByPfmIdx(pfm);
	}

	@Override
	public Poster getPoster(Performance pfm) {
		return pDao.selectPosterByPfmIdx(pfm);
	}

	@Override
	public void editPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList, CastList castList,
			SeatSectionList seatSecList, PfmDateByTimeList pfmDbtList, String pfmDetailContents, String pfmBookinfoContents) {
		int pfmIdx = pfm.getPfmIdx();
		// 공연 기본 정보 수정
		pDao.updatePfm(pfm);
		
		// 포스터 수정
		if (posterUpload.getSize() != 0) {
			Poster poster = uploadPoster(posterUpload);
			poster.setPfmIdx(pfmIdx); // 공연 idx 지정
			// 포스터 업로드 정보 DB 저장
			pDao.updatePoster(poster);
		}
		
		// 테마들 수정
		if (themeList.getThmList() != null) {
			pDao.deletePfmTheme(pfmIdx); // 이전 테마 정보 모두 삭제하고 다시 등록
			for (PfmTheme thm : themeList.getThmList()) {
				if (thm.getThemeIdx() != 0) { // theme가 존재하는 경우에 insert
					// 공연 idx 지정
					thm.setPfmIdx(pfmIdx);
					pDao.insertPfmTheme(thm);
				}
			}
		}
		
		// 출연진들 수정
		if (castList.getCastList() != null) {
			pDao.deleteCast(pfmIdx); // 이전 출연진 정보 모두 삭제
			for (Cast cast : castList.getCastList()) {
				if (cast.getArtistIdx() != 0) { // artist 정보가 존재하는 경우에 insert
					// 공연 idx 지정
					cast.setPfmIdx(pfmIdx);
					pDao.insertCast(cast);
				}
			}
		}
		
		// 좌석 정보 수정
		if(seatSecList.getSeatSecList() != null) {
			pDao.deleteSeatSec(pfmIdx); // 이전 좌석 정보 모두 삭제
			for(SeatSection seatSec : seatSecList.getSeatSecList()) {
				if(seatSec.getOriSecName() != null && !"".equals(seatSec.getOriSecName())) {
					// 공연 idx 지정
					seatSec.setPfmIdx(pfmIdx);
					seatSec.setHallIdx(pfm.getHallIdx());
					pDao.insertSeatSection(seatSec);
				}
			}
		}
		
		// 공연 일정들(날짜, 시간) 등록
		if (pfmDbtList.getPfmDbtList() != null) {
			pDao.deletePfmDbt(pfmIdx);
			for (PfmDateByTime pfmDbt : pfmDbtList.getPfmDbtList()) {
				if (pfmDbt.getPfmDate() != null && pfmDbt.getPfmTime() != null) { // 일정 정보가 존재하는 경우에 insert
					// 공연 idx 지정
					pfmDbt.setPfmIdx(pfmIdx);
					pDao.insertPfmDbt(pfmDbt);
				}
			}
		}

		// 공연 상세정보 수정
		if (!"".equals(pfmDetailContents)) {
			PfmDetail pfmDetail = new PfmDetail();
			pfmDetail.setPfmIdx(pfmIdx);
			pfmDetail.setContents(pfmDetailContents);
			pDao.updatePfmDetail(pfmDetail);
		}

		// 공연 예약정보 수정
		if (!"".equals(pfmBookinfoContents)) {
			PfmBookinfo pfmBookinfo = new PfmBookinfo();
			pfmBookinfo.setPfmIdx(pfmIdx);
			pfmBookinfo.setContents(pfmBookinfoContents);
			pDao.updatePfmBookinfo(pfmBookinfo);
		}
		
	}

	@Override
	public List<SeatSection> getSeatSectionList(Performance pfm) {
		return pDao.selectSeatSectionByPfmIdx(pfm);
	}

	@Override
	public void deletePfm(Performance pfm) {
		int pfmIdx = pfm.getPfmIdx();
		
		// 공연 예약정보 삭제
		pDao.deletePfmBookinfo(pfmIdx);
		
		// 공연 상제정보 삭제
		pDao.deletePfmDetail(pfmIdx);
		
		// 공연 일정 삭제
		pDao.deletePfmDbt(pfmIdx);
		
		// 좌석 정보 삭제
		pDao.deleteSeatSec(pfmIdx);
		
		// 출연진 목록 삭제
		pDao.deleteCast(pfmIdx);
		
		// 테마 삭제
		pDao.deletePfmTheme(pfmIdx);
		
		// 포스터 삭제
		pDao.deletePoster(pfmIdx);
		
		// 공연 기본 정보 삭제
		pDao.deletePfm(pfmIdx);
	}

	@Override
	public void deleteMainBanner(int mainbanIdx) {
		pDao.deleteMainBanner(mainbanIdx);
		
	}

	@Override
	public List<Performance> getNeweastPfm(Paging paging) {
		// 최신순 공연 목록 가져오기
		return pDao.selectNeweastPfm(paging);
	}

	@Override
	public int getTotalPfm(String search) {
		// 전체 공연수 가져오기
		return pDao.selectCntPfmSearch(search);
	}

	@Override
	public void fileUpload(int pfmIdx, ServletContext context, MultipartFile thumbFile, MultipartFile bannerFile) {
		// 파일 업로드하기
		
		//UUID, 고유 식별자 
		String uId = UUID.randomUUID().toString().split("-")[0];

		// 파일이 저장될 경로(서버에 저장해야함, 로컬저장x)
		String stored = context.getRealPath("upload");

		// 저장될 파일의 이름
		String thumbFileName = thumbFile.getOriginalFilename() + "_" + uId;
		String bannerFileName = bannerFile.getOriginalFilename() + "_" + uId;

		// 파일 객체
		File dest = new File(stored, thumbFileName);
		File dest2 = new File(stored, bannerFileName);

		// 파일 저장(업로드)
		try {
			thumbFile.transferTo(dest);
			bannerFile.transferTo(dest2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// DB에 저장(업로드 정보 기록)
		// pfmIdx, thumbFile, bannerFile

		// 테이블명 main_banner

		// 파일번호(PK) fileno NUMBER
		// 제목 pfmIdx NUMBER
		
		// 썸네일 원본파일명 thumb_img_ori VARCHAR2(200)
		// 썸네일 저장된 파일명 thumb_img_str VARCHAR2(200)
		
		// 배너 원본파일명 banner_img_ori VARCHAR2(200)
		// 배너 저장된 파일명 banner_img_str VARCHAR2(200)

		// 시퀀스명 main_banner_seq

		// DTO class MainBanner 
//		Filetest filetest = new Filetest();
		MainBanner mainBanner = new MainBanner();

//		mainBanner.setTitle(title);
//		mainBanner.setOrigin_name(fileupload.getOriginalFilename());
//		mainBanner.setStored_name(name);
		
		mainBanner.setPfmIdx(pfmIdx);
		mainBanner.setThumbImgOri(thumbFile.getOriginalFilename());
		mainBanner.setThumbImgStr(thumbFileName);
		mainBanner.setBannerImgOri(bannerFile.getOriginalFilename());
		mainBanner.setBannerImgStr(bannerFileName);
		
//		fileDao.uploadInfoSave(filetest);
		pDao.insertMainBanner(mainBanner);
	}

	@Override
	public boolean checkPfmIdxDup(int pfmIdx) {
		// pfmIdx로 메인 배너 중복 확인하기
		if(pDao.selectPfmIdxDup(pfmIdx) == 0) {
			// 중복 x
			
			return true;
		} else {
			// 중복 o
			
			return false;
		}
	}

	@Override
	public List<Performance> getAllPfmList(Paging paging) {
		return pDao.selectAllPfmList(paging);
	}
	@Override
	public List<Performance> getAllConPfmList(Paging paging) {
		return pDao.selectAllConPfm(paging);
	}
	@Override
	public List<Performance> getAllMuPfmList(Paging paging) {
		return pDao.selectAllMuPfm(paging);
	}

	@Override
	public Performance getPfmByPfmIdx(int pfmIdx) {
		// pfmIdx로 검색해서 pfm 정보 가져오기
		return pDao.selectPfmByPfmIdx(pfmIdx);
	}

	@Override
	public List<Performance> getNewestPfmList(String mbPfmSearch) {
		// 정렬 종류별 공연 목록 가져오기 
		return pDao.selectNewestPfmList(mbPfmSearch);
	}

	@Override
	public List<Performance> getAlphaPfmList() {
		// 정렬 종류별 공연 목록 가져오기 
		return pDao.selectAlpahPfmList();
	}

	@Override
	public void deleteTabBanner(int tabIdx) {
		// tabIdx를 이용해서 탭 배너 삭제하기
		pDao.deleteTabBanner(tabIdx);
	}

	@Override
	public boolean checkTabbanDup(Map<String, Integer> tabInfo) {
		// pfmIdx로 탭배너 중복 확인하기
		if (pDao.selectTabbanDup(tabInfo) == 0) {
			// 중복 x

			return true;
		} else {
			// 중복 o

			return false;
		}
	}

	@Override
	public void insertTBanner(Map<String, String> tabInfo) {
		// TODO Auto-generated method stub
		pDao.insertTBanner(tabInfo);
	}

	@Override
	public List<Performance> getPfmListAlpha(Paging paging) {
		return pDao.selectPfmListAlpha(paging);
	}

	@Override
	public List<Performance> getConPfmListAlpha(Paging paging) {
		return pDao.selectConPfmListAlpha(paging);
	}

	@Override
	public List<Performance> getMuPfmListAlpha(Paging paging) {
		return pDao.selectMuPfmListAlpha(paging);
	}

}
