package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PreferTDao;
import ticket.dto.Theme;
import ticket.service.face.PreferTService;

@Service
public class PreferTServiceImpl implements PreferTService {

	@Autowired
	private PreferTDao preferTDao;
	
	@Override
	public List<Theme> choiceList(int userIdx) {
		return preferTDao.selectThemeByUserIdx(userIdx);
	}

	@Override
	public List<Theme> themeAllList() {
		return preferTDao.selectAll();
	}

}
