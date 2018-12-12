package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PreferTDao;
import ticket.dto.PreferTheme;
import ticket.dto.Theme;
import ticket.service.face.PreferTService;

@Service
public class PreferTServiceImpl implements PreferTService {

	@Autowired
	private PreferTDao preferTDao;
	
	@Override
	public List<PreferTheme> choiceList(int userIdx) {
		return preferTDao.selectThemeByUserIdx(userIdx);
	}

	@Override
	public List<Theme> themeAllList() {
		return preferTDao.selectAll();
	}

	@Override
	public void choiceTheme(int userIdx, List<String> themeIdx) {
		
		// 사용자가 전에 넣었던 선호 테마지우기 
		preferTDao.deleteTheme(userIdx);
		
		
		// 선택한 테마 넣기
		PreferTheme preferTheme = new PreferTheme();
		preferTheme.setUserIdx(userIdx);
	
		for(int i = 0; i <themeIdx.size(); i++) {

			preferTheme.setThemeIdx(Integer.parseInt(themeIdx.get(i)));
			
			preferTDao.insertTheme(preferTheme);
		}
	}

}
