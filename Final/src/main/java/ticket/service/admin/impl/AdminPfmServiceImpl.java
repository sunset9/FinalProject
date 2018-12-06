package ticket.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PfmDao;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.service.admin.face.AdminPfmService;

@Service
public class AdminPfmServiceImpl implements AdminPfmService{
	@Autowired PfmDao pfmDao;
	
	@Override
	public List getMBannerList() {
		return null;
	}

	@Override
	public Performance getPfmInfo() {
		return null;
	}

	@Override
	public MainBanner getMBanner() {
		return null;
	}

	@Override
	public void registMBanner() {
		//pfmDao.insertMBanner()
	}

	@Override
	public List getNewTabBanner() {
		return null;
	}

	@Override
	public List getConTabBanner() {
		return null;
	}

	@Override
	public List getMuTabBanner() {
		return null;
	}

	@Override
	public int getTodayBook() {
		 
		return 0;
	}

	@Override
	public int getTodayCancel() {
		 
		return 0;
	}

	@Override
	public int getTodayCon() {
		 
		return 0;
	}

	@Override
	public int getTodayMu() {
		 
		return 0;
	}

	@Override
	public int getTodayFam() {
		 
		return 0;
	}
}
