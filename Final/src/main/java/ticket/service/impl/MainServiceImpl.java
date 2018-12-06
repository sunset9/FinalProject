package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MainDao;
import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Theme;
import ticket.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;

//	@Override
//	public List getAdminChoiceBanner(Performance pfm, Genre genre) {
//		return mainDao.selectAdminChoiceBanner(pfm, genre);
//	}

	@Override
	public List adminChoiceBannerCon() {
		return mainDao.selectAdminBanCon();
	}

	@Override
	public List adminChoiceBannerMu() {
		return mainDao.selectAdminBanMu();
	}

	@Override
	public List adminChoiceBannerFam() {
		return mainDao.selectAdminBanFam();
	}

	@Override
	public List getGenreByTheme(Genre genre, Theme theme) {
		return mainDao.selectGenreByTheme(genre, theme);
	}

	@Override
	public List getPfmRanking(Performance pfm) {
		return mainDao.selectPfmRanking(pfm);
	}
}
