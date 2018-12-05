package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MainDao;
import ticket.dto.Genre;
import ticket.dto.Theme;
import ticket.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;

	@Override
	public List getAdminChoiceBanner(Genre genre) {
		return mainDao.selectAdminChoiceBanner(genre);
	}

	@Override
	public List getGenreByTheme(Genre genre, Theme theme) {
		return mainDao.selectGenreByTheme(genre, theme);
	}

	@Override
	public List getPfmRanking() {
		return mainDao.selectPfmRanking();
	}

}
