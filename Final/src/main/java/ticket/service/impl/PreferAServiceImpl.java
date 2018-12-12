package ticket.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PreferADao;
import ticket.dto.Artist;
import ticket.dto.PreferTheme;
import ticket.service.face.PreferAService;

@Service
public class PreferAServiceImpl implements PreferAService{

	@Autowired
	private PreferADao preferADao;
	

	@Override
	public List<Artist> choiceList(int userIdx) {
		return preferADao.selectArtistByUserIdx(userIdx);
	}

	@Override
	public List<Artist> search(String search) {
		return preferADao.selectArtistBySearch(search);
	}

	@Override
	public List<Artist> artistByTheme(List<PreferTheme> ptList) {
		
		Map themeMap = new HashMap();
		
		for ( int i =0; i <ptList.size(); i++) {
			themeMap.put("themeIdx"+i, ptList.get(i).getThemeIdx());
		}
		
		preferADao.selectArtistByTheme(themeMap);
		
		return null;
	}

}
