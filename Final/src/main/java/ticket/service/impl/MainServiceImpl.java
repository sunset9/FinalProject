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
//	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);

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
	public List getPfmRanking(Performance pfm) {
		return mainDao.selectPfmRanking(pfm);
	}

	@Override
	public List<Poster> getConPfmPoster() {
//		logger.info(mainDao.selectPfmPosterInfo().toString());
		return mainDao.selectConPfmPosterInfo();
	}

	@Override
	public List<Poster> getMuPfmPoster() {
		return mainDao.selectMuPfmPosterInfo();
	}

	@Override
	public List<Poster> getFamPfmPoster() {
		return mainDao.selectFamPfmPosterInfo();
	}

	@Override
	public List<Poster> getpfmThemeChoicePoster(String theme) {
		return mainDao.ConThemeChoice(theme);
	}

	@Override
	public List<Poster> getDeadlineList() {
		return mainDao.selectDeadlindListPfm();
	}

	@Override
	public List<Poster> getLatestList() {
		return mainDao.selectLatestListPfm();
	}

	@Override
	public List<Poster> getPopularityList() {
		return mainDao.selectPopularityListPfm();
	}
}
