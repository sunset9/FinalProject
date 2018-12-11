package ticket.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MainDao;
import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);

	@Autowired MainDao mainDao;

	@Override
	public List<Poster> adminChoiceBannerCon() {
		return mainDao.selectAdminBanCon();
	}

	@Override
	public List<Poster> adminChoiceBannerMu() {
		return mainDao.selectAdminBanMu();
	}

	@Override
	public List<Poster> adminChoiceBannerFam() {
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

	@Override
	public List<Poster> getPfmPoster() {
//		logger.info(mainDao.selectPfmPosterInfo().toString());
		return mainDao.selectPfmPosterInfo();
	}

	@Override
	public List<Theme> getConThemeKind() {
		return mainDao.selectConThemeKind();
	}

	@Override
	public List<Theme> getMuThemeKind() {
		return mainDao.selectMuThemeKind();
	}

	@Override
	public List<Theme> getFamThemeKind() {
		return mainDao.selectFamThemeKind();
	}

	@Override
	public List<Poster> getpfmThemeChoicePoster(Theme theme) {
		return mainDao.ConThemeChoice(theme);
	}
}
