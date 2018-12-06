package ticket.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PfmDao;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;

@Service
public class AdminPfmServiceImpl implements AdminPfmService{
	@Autowired PfmDao pDao;
	
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
}
