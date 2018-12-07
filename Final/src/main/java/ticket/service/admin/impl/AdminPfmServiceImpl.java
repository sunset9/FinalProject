package ticket.service.admin.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
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
import ticket.dto.CategoryCon;
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.PfmTheme;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;

@Service
public class AdminPfmServiceImpl implements AdminPfmService{
	@Autowired ServletContext context;
	@Autowired PfmDao pDao;
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
		//pfmDao.insertMBanner()
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
		//오늘의 예매수 불러오기
		return pDao.selectTodayBook();
	}

	@Override
	public int getTodayCancel() {
		//오늘의 예매취소수 불러오기
		return pDao.selectTodayCancel();
	}

	@Override
	public int getTodayCon() {
		//오늘 등록된 콘서트의 수 불러오기
		return pDao.selectTodayCon();
	}

	@Override
	public int getTodayMu() {
		 
		return 0;
	}

	@Override
	public int getTodayFam() {
		 
		return 0;
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
	public List<Artist> getArtistList(Artist artist) {
		return pDao.selectArtistByName(artist);
	}

	@Override
	public List<Hall> getHallList() {
		return pDao.selectAllHall();
	}
  
	@Override
	public void registPfm(Performance pfm, MultipartFile posterUpload, PfmThemeList themeList) {
		// 공연 기본 정보 등록
		pDao.insertPfm(pfm);
		
		// 포스터 업로드
		Poster poster = uploadPoster(posterUpload);
		poster.setPfmIdx(pfm.getPfmIdx()); // 공연 idx 지정
		// 포스터 업로드 정보 DB 저장
		pDao.insertPoster(poster);
		
		// 테마들 등록
		for(PfmTheme thm : themeList.getThmList()) {
			if(thm.getThemeIdx() != 0 ) { 
				// 공연 idx 지정
				thm.setPfmIdx(pfm.getPfmIdx());
				System.out.println(thm);
				
				pDao.insertPfmTheme(thm);
			}
		}
			
	}
  
	public Poster uploadPoster(MultipartFile posterUpload) {
		// UUID, 고유 식별자
		String uId = UUID.randomUUID().toString().split("-")[0];
		
		//파일이 저장될 경로
		String stored = context.getRealPath("resources/image");
		
		//저장될 파일의 이름
		String oriName = posterUpload.getOriginalFilename();
		String name = oriName+"_"+uId;
		
		//파일객체
		File dest = new File(stored, name);
		
		//파일 저장(업로드)
		try {
			posterUpload.transferTo(dest);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 반환할 포스터 객체 생성
		Poster poster = new Poster();
		poster.setOrginName(oriName);
		poster.setStoredName(name);
		
		return poster;
	}

	@Override
	public List<Poster> getListCon() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Poster> getListFam() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Poster> getListMu() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addCon(CategoryCon con) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addFam(CategoryFam fam) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addMu(CategoryMu mu) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeCon(CategoryCon con) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeFam(CategoryCon fam) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeMu(CategoryCon mu) {
		// TODO Auto-generated method stub

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
		info.setOrginName(file.getOriginalFilename());
		info.setStoredName(dest.getName());
		infoDao.insert(info);
	}

	@Override
	public int getTodayAllPfm() {
		// 오늘 등록된 모든 공연의 수 가져오기
		return pDao.selectTodayAllPfm();
	}



}
