package ticket.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PreferADao;
import ticket.dto.Artist;
import ticket.dto.PreferArtist;
import ticket.dto.PreferTheme;
import ticket.service.face.PreferAService;

@Service
public class PreferAServiceImpl implements PreferAService{

	@Autowired
	private PreferADao preferADao;
	

	@Override
	public List<PreferArtist> choiceList(int userIdx) {
		return preferADao.selectPreferArtistByUserIdx(userIdx);
	}

	@Override
	public List<Artist> search(String search) {
		return preferADao.selectArtistBySearch(search);
	}

	@Override
	public List<Artist> artistByTheme(List<PreferTheme> ptList) {
	 
		Map map = new HashMap<>();
		map.put("ptList", ptList);
		return preferADao.selectArtistByTheme(map);
	}

	@Override
	public void choiceArtist(int userIdx, List<String> artistIdx) {
		
		// 넣기 전에 userIdx 로 기존 정보 지우기 
		preferADao.deleteByUserIdx(userIdx);
		
		// 넣기
		PreferArtist preferArtist = new PreferArtist() ;
		preferArtist.setUserIdx(userIdx);
		for(int i=0; i<artistIdx.size(); i++) {
			preferArtist.setArtistIdx(Integer.parseInt(artistIdx.get(i)));
			
			preferADao.insertPreferArtist(preferArtist);
		}
		
	}

	@Override
	public List<Artist> choiceArtistList(int userIdx) {
		return preferADao.selectArtistByUserIdx(userIdx);
	}

}
