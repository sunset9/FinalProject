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

	@Override
	public List<Poster> getPfmPoster() {
		logger.info(mainDao.selectPfmPosterInfo().toString());
		return mainDao.selectPfmPosterInfo();
	}

	@Override
	public List<Theme> getThemeKind() {
		return mainDao.selectThemeKind();
	}

	@Override
	public List<Poster> getpfmThemeChoicePoster() {
		return mainDao.selectThemeChoice();
	}
}
