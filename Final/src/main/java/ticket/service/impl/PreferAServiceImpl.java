package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PreferADao;
import ticket.dto.Artist;
import ticket.dto.Theme;
import ticket.service.face.PreferAService;

@Service
public class PreferAServiceImpl implements PreferAService{

	@Autowired
	private PreferADao preferADao;
	
	@Override
	public List<Artist> artistByTheme(List<Theme> tList) {
		return preferADao.selectArtistByTheme(tList);
	}

	@Override
	public List<Artist> choiceList(int userIdx) {
		return preferADao.selectArtistByUserIdx(userIdx);
	}

	@Override
	public List<Artist> search(String search) {
		return preferADao.selectArtistBySearch(search);
	}

}
