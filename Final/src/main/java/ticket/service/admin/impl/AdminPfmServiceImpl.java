package ticket.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PfmDao;
import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.Theme;
import ticket.dto.ThemeList;
import ticket.service.admin.face.AdminPfmService;

@Service
public class AdminPfmServiceImpl implements AdminPfmService{

	@Autowired PfmDao pDao;
	
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
	public void registPfm(Performance pfm, Genre genre, ThemeList themeList) {
		
	}

}
