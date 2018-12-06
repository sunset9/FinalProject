
package ticket.service.admin.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;

import ticket.dao.face.PfmDao;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;
import ticket.dao.face.CategoryConDao;
import ticket.dao.face.CategoryFamDao;
import ticket.dao.face.CategoryMuDao;
import ticket.dao.face.PosterInfoDao;
import ticket.dto.CategoryCon;
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.PosterInfo;

@Service
public class AdminPfmServiceImpl implements AdminPfmService{
	@Autowired PfmDao pDao;
		@Autowired
	CategoryConDao conDao;
	@Autowired
	CategoryMuDao muDao;
	@Autowired
	CategoryFamDao famDao;
	@Autowired
	PosterInfoDao infoDao;
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
		 
		return 0;
	}

	@Override
	public int getTodayCancel() {
		 
		return 0;
	}

	@Override
	public int getTodayCon() {
		 
		return 0;
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
	public List<PosterInfo> getListCon() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PosterInfo> getListFam() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PosterInfo> getListMu() {
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
		PosterInfo info = new PosterInfo();
		info.setOrginName(file.getOriginalFilename());
		info.setStoredName(dest.getName());
		infoDao.insert(info);
	}

}
