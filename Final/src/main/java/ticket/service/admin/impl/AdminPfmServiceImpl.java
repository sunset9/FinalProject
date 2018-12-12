package ticket.service.admin.impl;

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

import ticket.dao.face.CategoryConDao;
import ticket.dao.face.CategoryFamDao;
import ticket.dao.face.CategoryMuDao;
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
import ticket.dto.Hall;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.PfmBookinfo;
import ticket.dto.PfmDateByTime;
import ticket.dto.PfmDateByTimeList;
import ticket.dto.PfmDetail;
import ticket.dto.PfmTheme;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;
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

	@Override
	public List getMBannerList() {
		return null;
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
	public List getNewTabBanner() {
		return null;
	}

	@Override
	public List getConTabBanner() {
		return null;
	}

	@Override
	public List getMuTabBanner() {
		return null;
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

	public void registPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList, CastList castList,
			PfmDateByTimeList pfmDbtList, String pfmDetailContents, String pfmBookinfoContents) {
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
		return infoDao.selectBygenreIdx(1,paging);
	}
	@Override
	public List<Poster> getModalListMu(Paging paging){
		return infoDao.selectBygenreIdx(2,paging);
	}
	@Override
	public List<Poster> getModalListFam(Paging paging){
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
	public List<Poster> getSearchListForFam(String searchPoster){
		return infoDao.selectPosterByNameFam(searchPoster);
	}

	@Override
	public List<Poster> getModalListMu() {
		return infoDao.selectBygenreIdx(2, null);
	}

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
	};
}
